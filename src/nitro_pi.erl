-module(nitro_pi).
-description('NITRO Process Instance'). % gen_server replacement
-include_lib("nitro/include/nitro_pi.hrl").
-include_lib("nitro/include/n2o.hrl").
-behaviour(gen_server).
-export([start_link/1]).
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]).
-export([start/1,stop/2,send/2,send/3,cast/2,cast/3,pid/2,restart/2,uid/2,cache/4,cache/3]).

start(#pi{table=Tab,name=Name,module=Module,sup=Sup,timeout=Timeout,restart=Restart} = Async) ->
    ChildSpec = {{Tab,Name},{?MODULE,start_link,[Async]},Restart,Timeout,worker,[Module]},
    case supervisor:start_child(Sup,ChildSpec) of
               {ok,Pid} -> {Pid,Async#pi.name};
             {ok,Pid,_} -> {Pid,Async#pi.name};
         {error,Reason} -> {error,Reason} end.

stop(Tab,Name) ->
    case nitro_pi:pid(Tab,Name) of
        Pid when is_pid(Pid) ->
                #pi{sup=Sup} = Async = send(Pid,{get}),
                [ supervisor:F(Sup,{Tab,Name})
                  || F <- [ terminate_child , delete_child ] ],
                cache(Tab,{Tab,Name},undefined),
                Async;
        Data -> {error,{not_pid,Data}} end.

send(Pid,Message) when is_pid(Pid) -> gen_server:call(Pid,Message).
send(Tab,Name,Message) -> gen_server:call(nitro_pi:pid(Tab,Name),Message).

cast(Pid,Message) when is_pid(Pid) -> gen_server:cast(Pid,Message).
cast(Tab,Name,Message) -> gen_server:cast(nitro_pi:pid(Tab,Name),Message).

cache(Tab, Key) ->
    Res = ets:lookup(Tab,Key),
    Val = case Res of [] -> []; [Value] -> Value; Values -> Values end,
    case Val of [] -> [];
                {_,{infinity,X}} -> X;
                {_,{Expire,X}} -> case Expire < calendar:local_time() of
                                  true ->  ets:delete(Tab,Key), [];
                                  false -> X end end.
cache(Tab, Key, undefined)   -> ets:delete(Tab,Key);
cache(Tab, Key, Value)       -> cache(Tab, Key, Value, infinity).
cache(Tab, Key, Value, Till) -> ets:insert(Tab,{Key,{Till,Value}}), Value.

uid(_,_) ->
  case os:type() of
       {win32,nt} -> {Mega,Sec,Micro} = erlang:timestamp(), integer_to_list((Mega*1000000+Sec)*1000000+Micro);
                _ -> erlang:integer_to_list(element(2,hd(lists:reverse(erlang:system_info(os_monotonic_time_source)))))
  end.

pid(Tab,Name) -> cache(Tab,{Tab,Name}).

restart(Tab,Name) ->
    case stop(Tab,Name)  of
          #pi{}=Async -> start(Async);
                     Error -> Error end.

handle(Mod,Message,Async) ->
  case Mod:proc(Message,Async) of
                {ok,S} -> {ok,S};
              {ok,S,T} -> {ok,S,T};
          {stop,X,Y,S} -> {stop,X,Y,S};
            {stop,X,S} -> {stop,X,S};
              {stop,S} -> {stop,S};
         {reply,X,S,T} -> {reply,X,S,T};
           {reply,X,S} -> {reply,X,S};
         {noreply,X,S} -> {noreply,X,S};
           {noreply,S} -> {noreply,S};
                 {_,S} -> {noreply,S};
                     S -> {noreply,S} end.

start_link (Parameters)    -> gen_server:start_link(?MODULE, Parameters, []).
code_change(_,State,_)     -> {ok, State}.
handle_call({get},_,Async) -> {reply,Async,Async};
handle_call(_,_,#pi{module=undefined}) -> {noreply,[]};
handle_call(Message,_,#pi{module=Mod}=Async) -> handle(Mod,Message,Async).
handle_cast(_,  #pi{module=undefined}) -> {noreply,[]};
handle_cast(Message,  #pi{module=Mod}=Async) -> handle(Mod,Message,Async).
handle_info(timeout,  #pi{module=undefined}) -> {noreply,[]};
handle_info(timeout,  #pi{module=Mod}=Async) -> handle(Mod,timeout,Async);
handle_info(_,  #pi{module=undefined}) -> {noreply,[]};
handle_info(Message,  #pi{module=Mod}=Async) -> handle(Mod,Message,Async);
handle_info(_,  _) -> {noreply,[]}.

init(#pi{module=Mod,table=Tab,name=Name}=Handler) ->
    cache(Tab,{Tab,Name},self(),infinity),
    Mod:proc(init,Handler).

terminate(_Reason, #pi{name=Name,sup=Sup,table=Tab}) ->
    spawn(fun() -> supervisor:delete_child(Sup,{Tab,Name}) end),
    catch cache(Tab,{Tab,Name},undefined), ok.
