-module(wf_event).
-author('Maxim Sokhatsky').
-author('Andrey Martemyanov').
-include_lib("nitro/include/cx.hrl").
-include_lib("nitro/include/nitro.hrl").
-export([target/1, new/2, new/6, new/7]).

-record(ev,      { module, msg, trigger, name }).

-define(B(E), nitro:to_binary(E)).
-define(L(E), nitro:to_list(E)).
target({ps, {qa, Id}, Ps}) ->
  T = target({qa,Id}), P = nitro:js_escape(Ps),
  ["var t=",T,";t.map(ts => '",P,"'.split('.').reduce((a,p)=>(a&&a[p]?a[p]:null),ts)).filter(o=>o)"];
target({ps,Id,Ps}) ->
  T = target(Id), P = nitro:js_escape(Ps),
  ["var ts=",T,",ps = '",P,"'.split('.').reduce((a,p)=>(a&&a[p]?a[p]:null),ts);","ps&&ps"];
target({qs,S}) -> ["qs('",nitro:js_escape(?L(S)), "')"];
target({qa,S}) -> ["Array.from(qa('",nitro:js_escape(?L(S)), "'))"];
target({g,T})  -> nitro:js_escape(?L(T));
target(Id)     -> ["qi('",nitro:js_escape(?L(Id)),"')"].

new(P,E,D,N,Data,Source) -> new(P,E,D,N,Data,Source,<<>>).

new(bin,Data) -> <<"ws.send(enc(tuple(atom('bin'),bin('",(nitro:pickle(Data))/binary,"'))));">>.
new([], _, _, _, _, _, _) -> <<>>;
new(undefined, _, _, _, _, _, _) -> <<>>;
new(Postback, Element, Delegate, Name, Data, Source, Validation) ->
    Module = nitro:coalesce([Delegate, ?CTX#cx.module]),
    Join=fun([]) -> [];
           ([E]) -> [$'|E]++[$'];
         ([H|T]) -> [[$'|H]++[$']] ++ [ [$,,$'|E]++[$'] || E <- T ] end,
    Event = #ev{name=Name, module=Module, msg=Postback, trigger=Element},
    list_to_binary(["{ if (validateSources([",Join([ nitro:to_list(S) || S <- Source, S =/= []]),
        "])) { ",?B(Validation)," ws.send(enc(tuple(atom('",?B(application:get_env(n2o,event,pickle)),"'),bin('",
        Element,"'),bin('",nitro:pickle(Event),"'),",Data,"))); } else console.log('Validation Error'); }"]).
