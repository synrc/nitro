-module(nitro).
-include_lib("nitro/include/cx.hrl").
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).
-behaviour(application).
-export([start/2, stop/1, init/1]).

-record(ev,      { module, msg, trigger, name }).

start(_StartType, _StartArgs) -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) -> ok.
init([]) -> {ok, {{one_for_one, 5, 10}, []}}.

f(S) -> f(S, []).
f(S, Args) -> lists:flatten(io_lib:format(S, Args)).

coalesce([]) -> undefined;
coalesce([H]) -> H;
coalesce([undefined|T]) -> coalesce(T);
coalesce([[]|T]) -> coalesce(T);
coalesce([H|_]) -> H.

jse(X) -> js_escape(X).

js_escape(undefined) -> [];
js_escape(Value) when is_list(Value) -> binary_to_list(js_escape(iolist_to_binary(Value)));
js_escape(Value) -> js_escape(Value, <<>>).
js_escape(<<"\\", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "\\\\">>);
js_escape(<<"\r", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "\\r">>);
js_escape(<<"\n", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "\\n">>);
js_escape(<<"\"", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "\\\"">>);
js_escape(<<"'",Rest/binary>>,Acc) -> js_escape(Rest, <<Acc/binary, "\\'">>);
js_escape(<<"<script", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "<scr\" + \"ipt">>);
js_escape(<<"script>", Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, "scr\" + \"ipt>">>);
js_escape(<<C, Rest/binary>>, Acc) -> js_escape(Rest, <<Acc/binary, C>>);
js_escape(<<>>, Acc) -> Acc.

-define(IS_STRING(Term), (is_list(Term) andalso Term /= [] andalso is_integer(hd(Term)))).

to_list(L) when ?IS_STRING(L) -> L;
to_list(L) when is_list(L) -> SubLists = [inner_to_list(X) || X <- L], lists:flatten(SubLists);
to_list(A) -> inner_to_list(A).
inner_to_list(A) when is_atom(A) -> atom_to_list(A);
inner_to_list(B) when is_binary(B) -> binary_to_list(B);
inner_to_list(I) when is_integer(I) -> integer_to_list(I);
inner_to_list(L) when is_tuple(L) -> lists:flatten(io_lib:format("~p", [L]));
inner_to_list(L) when is_list(L) -> L;
inner_to_list(F) when is_float(F) -> float_to_list(F,[{decimals,9},compact]).

to_atom(A) when is_atom(A) -> A;
to_atom(B) when is_binary(B) -> to_atom(binary_to_list(B));
to_atom(I) when is_integer(I) -> to_atom(integer_to_list(I));
to_atom(F) when is_float(F) -> to_atom(float_to_list(F,[{decimals,9},compact]));
to_atom(L) when is_list(L) -> list_to_atom(binary_to_list(list_to_binary(L))).

to_binary(A) when is_atom(A) -> atom_to_binary(A,latin1);
to_binary(B) when is_binary(B) -> B;
to_binary(I) when is_integer(I) -> to_binary(integer_to_list(I));
to_binary(F) when is_float(F) -> float_to_binary(F,[{decimals,9},compact]);
to_binary(L) when is_list(L) ->  iolist_to_binary(L).

-ifndef(PICKLER).
-define(PICKLER, (application:get_env(n2o,pickler,nitro_pickle))).
-endif.

pickle(Data) -> ?PICKLER:pickle(Data).
depickle(SerializedData) -> ?PICKLER:depickle(SerializedData).
depickle(SerializedData, TTLSeconds) -> ?PICKLER:depickle(SerializedData, TTLSeconds).

render(X) -> wf_render:render(X).
wire(Actions) -> action_wire:wire(Actions).

unique_integer() -> erlang:unique_integer().
temp_id() -> "auto" ++ integer_to_list(unique_integer() rem 1000000).

html_encode(L,Fun) when is_function(Fun) -> Fun(L);
html_encode(L,EncType) when is_atom(L) -> html_encode(nitro:to_list(L),EncType);
html_encode(L,EncType) when is_integer(L) -> html_encode(integer_to_list(L),EncType);
html_encode(L,EncType) when is_float(L) -> html_encode(float_to_list(L,[{decimals,9},compact]),EncType);
html_encode(L, false) -> L;
html_encode(L, true) -> L;
html_encode(L, whites) -> html_encode_whites(nitro:to_list(lists:flatten([L]))).
html_encode(<<>>) -> [];
html_encode([]) -> [];
html_encode([H|T]) ->
    case H of
        $< -> "&lt;" ++ html_encode(T);
        $> -> "&gt;" ++ html_encode(T);
        $" -> "&quot;" ++ html_encode(T);
        $' -> "&#39;" ++ html_encode(T);
        $& -> "&amp;" ++ html_encode(T);
        BigNum when is_integer(BigNum) andalso BigNum > 255 ->
        [$&,$# | nitro:to_list(BigNum)] ++ ";" ++ html_encode(T);
        Tup when is_tuple(Tup) -> throw({html_encode,encountered_tuple,Tup});
        _ -> [H|html_encode(T)]
    end.

html_encode_whites([]) -> [];
html_encode_whites([H|T]) ->
    case H of
        $\s -> "&nbsp;" ++ html_encode_whites(T);
        $\t -> "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ++ html_encode_whites(T);
        $< -> "&lt;" ++ html_encode_whites(T);
        $> -> "&gt;" ++ html_encode_whites(T);
        $" -> "&quot;" ++ html_encode_whites(T);
        $' -> "&#39;" ++ html_encode_whites(T);
        $& -> "&amp;" ++ html_encode_whites(T);
        $\n -> "<br>" ++ html_encode_whites(T);
        _ -> [H|html_encode_whites(T)]
    end.

script() -> get(script).
script(Script) -> put(script,Script).

% Update DOM nitro:update

update(Target, Elements) ->
    nitro:wire(#jq{target=Target,property=outerHTML,right=Elements,format="'~s'"}).

insert_top(Tag,Target, Elements) ->
    Pid = self(),
    Ref = make_ref(),
    spawn(fun() -> R = nitro:render(Elements), Pid ! {R,Ref,nitro:actions()} end),
    {Render,Ref,Actions} = receive {_, Ref, _} = A -> A end,
    nitro:wire(nitro:f(
        "qi('~s').insertBefore("
        "(function(){var div = qn('~s'); div.innerHTML = '~s'; return div.firstChild; })(),"
        "qi('~s').firstChild);",
        [Target,Tag,Render,Target])),
    nitro:wire(nitro:render(Actions)).

insert_bottom(Tag, Target, Elements) ->
    Pid = self(),
    Ref = make_ref(),
    spawn(fun() -> R = nitro:render(Elements), Pid ! {R,Ref,nitro:actions()} end),
    {Render,Ref,Actions} = receive {_, Ref, _} = A -> A end,
    nitro:wire(nitro:f(
        "(function(){ var div = qn('~s'); div.innerHTML = '~s';"
                     "qi('~s').appendChild(div.firstChild); })();",
        [Tag,Render,Target])),
    nitro:wire(nitro:render(Actions)).

insert_adjacent(Command,Target, Elements) ->
    Pid = self(),
    Ref = make_ref(),
    spawn(fun() -> R = nitro:render(Elements), Pid ! {R,Ref,nitro:actions()} end),
    {Render,Ref,Actions} = receive {_, Ref, _} = A -> A end,
    nitro:wire(nitro:f("qi('~s').insertAdjacentHTML('~s', '~s');",[Target,Command,Render])),
    nitro:wire(nitro:render(Actions)).

actions() -> get(actions).
actions(Ac) -> put(actions,Ac).

insert_top(Target, Elements) when element(1,Elements) == tr -> insert_top(tbody,Target, Elements);
insert_top(Target, Elements) -> insert_top('div',Target, Elements).
insert_bottom(Target, Elements) when element(1,Elements) == tr -> insert_bottom(tbody, Target, Elements);
insert_bottom(Target, Elements) -> insert_bottom('div', Target, Elements).
insert_before(Target, Elements) -> insert_adjacent(beforebegin,Target, Elements).
insert_after(Target, Elements) -> insert_adjacent(afterend,Target, Elements).

remove(Target) ->
    nitro:wire("var x=qi('"++nitro:to_list(Target)++"'); x && x.parentNode.removeChild(x);").

% Wire JavaScript nitro:wire

state(Key) -> erlang:get(Key).
state(Key,Value) -> erlang:put(Key,Value).

% Redirect and purge connection nitro:redirect

redirect({http,Url}) -> n2o:header(<<"Location">>,nitro_conv:to_binary(Url)), nitro:state(status,302), [];
redirect(Url) -> nitro:wire(#jq{target='window.top',property=location,args=simple,right=Url}).
header(K,V) -> nitro:context((?CTX)#cx{req=cowboy_req:set_resp_header(K,V,?CTX#cx.req)}).

% Convert and Utils API

display(Element,Status) ->
   nitro:wire("{ var x = qi('"++
   nitro:to_list(Element)++"'); if (x) x.style.display = '"++nitro:to_list(Status)++"'; }").

show(Element) -> display(Element,block).
hide(Element) -> display(Element,none).
