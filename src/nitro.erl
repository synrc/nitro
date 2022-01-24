-module(nitro).

-include_lib("nitro/include/cx.hrl").

-include_lib("nitro/include/nitro.hrl").

-include_lib("nitro/include/event.hrl").

-compile(export_all).

-behaviour(application).

-export([start/2, stop/1, init/1]).

atom(List) when is_list(List) ->
    string:join([nitro:to_list(L) || L <- List], "_");
atom(Scalar) -> nitro:to_list(Scalar).

q(Key) -> q(Key, []).

q(Key, Def) ->
    case get(Key) of
        undefined -> Def;
        Val -> Val
    end.

qc(Key) ->
    CX = get(context),
    qc(Key, CX#cx.req).

qc(Key, Req) ->
    proplists:get_value(nitro:to_binary(Key),
                        cowboy_req:parse_qs(Req)).

start(_StartType, _StartArgs) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop(_State) -> ok.

init([]) -> {ok, {{one_for_one, 5, 10}, []}}.

f(S) -> f(S, []).

f(S, Args) -> lists:flatten(io_lib:format(S, Args)).

coalesce([]) -> undefined;
coalesce([H]) -> H;
coalesce([undefined | T]) -> coalesce(T);
coalesce([[] | T]) -> coalesce(T);
coalesce([H | _]) -> H.

jse(X) -> js_escape(X).

hte(X) when is_binary(X) ->
    nitro:to_binary(nitro_conv:html_encode(X));
hte(X) -> nitro_conv:html_encode(X).

js_escape(Value) -> nitro_conv:js_escape(Value).

-define(IS_STRING(Term),
        is_list(Term) andalso
            Term /= [] andalso is_integer(hd(Term))).

to_list(L) when ?IS_STRING(L) -> L;
to_list(L) when is_list(L) ->
    SubLists = [inner_to_list(X) || X <- L],
    lists:flatten(SubLists);
to_list(A) -> inner_to_list(A).

inner_to_list(A) when is_atom(A) -> atom_to_list(A);
inner_to_list(B) when is_binary(B) -> binary_to_list(B);
inner_to_list(I) when is_integer(I) ->
    integer_to_list(I);
inner_to_list(L) when is_tuple(L) ->
    lists:flatten(io_lib:format("~p", [L]));
inner_to_list(L) when is_list(L) -> L;
inner_to_list(F) when is_float(F) ->
    float_to_list(F, [{decimals, 9}, compact]).

to_atom(A) when is_atom(A) -> A;
to_atom(B) when is_binary(B) ->
    to_atom(binary_to_list(B));
to_atom(I) when is_integer(I) ->
    to_atom(integer_to_list(I));
to_atom(F) when is_float(F) ->
    to_atom(float_to_list(F, [{decimals, 9}, compact]));
to_atom(L) when is_list(L) ->
    list_to_atom(binary_to_list(list_to_binary(L))).

to_binary(A) when is_atom(A) ->
    atom_to_binary(A, latin1);
to_binary(B) when is_binary(B) -> B;
to_binary(I) when is_integer(I) ->
    to_binary(integer_to_list(I));
to_binary(F) when is_float(F) ->
    float_to_binary(F, [{decimals, 9}, compact]);
to_binary(L) when is_list(L) -> iolist_to_binary(L);
to_binary(X) when is_tuple(X) -> term_to_binary(X).

-ifndef(PICKLER).

-define(PICKLER,
        application:get_env(n2o, pickler, nitro_conv)).

-endif.

pickle(Data) -> (?PICKLER):pickle(Data).

depickle(SerializedData) ->
    (?PICKLER):depickle(SerializedData).

prolongate() ->
    case application:get_env(n2o, session) of
        {ok, M} -> M:prolongate();
        undefined -> false
    end.

authenticate(I, Auth) ->
    (application:get_env(n2o,
                         session,
                         n2o_session)):authenticate(I, Auth).

render(X) -> wf_render:render(X).

wire(Actions) -> action_wire:wire(Actions).

unique_integer() -> erlang:unique_integer().

temp_id() ->
    "auto" ++ integer_to_list(unique_integer() rem 1000000).

html_encode(L, Fun) when is_function(Fun) -> Fun(L);
html_encode(L, EncType) when is_atom(L) ->
    html_encode(nitro:to_list(L), EncType);
html_encode(L, EncType) when is_integer(L) ->
    html_encode(integer_to_list(L), EncType);
html_encode(L, EncType) when is_float(L) ->
    html_encode(float_to_list(L, [{decimals, 9}, compact]),
                EncType);
html_encode(L, false) -> L;
html_encode(L, true) -> L;
html_encode(L, whites) ->
    html_encode_whites(nitro:to_list(lists:flatten([L]))).

html_encode(<<>>) -> [];
html_encode([]) -> [];
html_encode([H | T]) ->
    case H of
        $< -> "&lt;" ++ html_encode(T);
        $> -> "&gt;" ++ html_encode(T);
        $" -> "&quot;" ++ html_encode(T);
        $' -> "&#39;" ++ html_encode(T);
        $& -> "&amp;" ++ html_encode(T);
        BigNum when is_integer(BigNum) andalso BigNum > 255 ->
            [$&, $# | nitro:to_list(BigNum)] ++
                ";" ++ html_encode(T);
        Tup when is_tuple(Tup) ->
            throw({html_encode, encountered_tuple, Tup});
        _ -> [H | html_encode(T)]
    end.

html_encode_whites([]) -> [];
html_encode_whites([H | T]) ->
    case H of
        $\s -> "&nbsp;" ++ html_encode_whites(T);
        $\t ->
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" ++
                html_encode_whites(T);
        $< -> "&lt;" ++ html_encode_whites(T);
        $> -> "&gt;" ++ html_encode_whites(T);
        $" -> "&quot;" ++ html_encode_whites(T);
        $' -> "&#39;" ++ html_encode_whites(T);
        $& -> "&amp;" ++ html_encode_whites(T);
        $\n -> "<br>" ++ html_encode_whites(T);
        _ -> [H | html_encode_whites(T)]
    end.

script() -> get(script).

script(Script) -> put(script, Script).

% Update DOM nitro:update

update(Target, Elements) ->
    {Render, _, Actions} = render_html(Elements),
    nitro:wire(nitro:f("var x=qi('~s'); if(x) x.outerHTML=`~s`;", [Target, Render])),
    nitro:wire(nitro:render(Actions)).

insert_top(Tag, Target, Elements) ->
    {Render, _Ref, Actions} = render_html(Elements),
    nitro:wire(nitro:f("qi('~s').insertBefore((function(){var "
                       "div = qn('~s'); div.innerHTML = `~s`; "
                       "return div.firstChild; })(),qi('~s').firstChi"
                       "ld);",
                       [Target, Tag, Render, Target])),
    nitro:wire(nitro:render(Actions)).

insert_bottom(Tag, Target, Elements) ->
    {Render, _Ref, Actions} = render_html(Elements),
    nitro:wire(nitro:f("(function(){ var div = qn('~s'); div.innerHTM"
                       "L = `~s`;qi('~s').appendChild(div.firstChild)"
                       "; })();",
                       [Tag, Render, Target])),
    nitro:wire(nitro:render(Actions)).

insert_before(Target, Elements) ->
    insert_adjacent(beforebegin, Target, Elements).

insert_after(Target, Elements) ->
    insert_adjacent(afterend, Target, Elements).

insert_adjacent(Command, Target, Elements) ->
    insert_adjacent(Command, Target, Elements, "qi").

insert_adjacent(Command, Target, Elements, Q) ->
    {Render, _Ref, Actions} = render_html(Elements),
    nitro:wire(nitro:f("~s('~s').insertAdjacentHTML('~s', `~s`);",
                       [Q, Target, Command, Render])),
    nitro:wire(nitro:render(Actions)).

render_html(Elements) ->
    Pid = self(),
    Ref = make_ref(),
    spawn(fun () ->
                  R = nitro:render(Elements),
                  Pid ! {R, Ref, nitro:actions()}
          end),
    {Render, Ref, Actions} = receive
                                 {_, Ref, _} = A -> A
                             end,
    {Render, Ref, Actions}.

actions() -> get(actions).

actions(Ac) -> put(actions, Ac).

insert_top(Target, Elements)
    when element(1, Elements) == tr ->
    insert_top(tbody, Target, Elements);
insert_top(Target, Elements) ->
    insert_top('div', Target, Elements).

insert_bottom(Target, Elements)
    when element(1, Elements) == tr ->
    insert_bottom(tbody, Target, Elements);
insert_bottom(Target, Elements) ->
    insert_bottom('div', Target, Elements).

clear(Target) ->
    nitro:wire("var x = qi('" ++
                   nitro:to_list(Target) ++
                       "'); while (x && x.firstChild) x.removeChild(x"
                       ".firstChild);").

remove(Target) ->
    nitro:wire("var x=qi('" ++
                   nitro:to_list(Target) ++
                       "'); x && x.parentNode.removeChild(x);").

% Wire JavaScript nitro:wire

state(Key) -> erlang:get(Key).

state(Key, Value) -> erlang:put(Key, Value).

% Redirect and purge connection nitro:redirect

redirect(Url) ->
    nitro:wire(#jq{target = window, property = location,
                   args = simple, right = Url}).

%header(K,V) -> nitro:context((?CTX)#cx{req=cowboy_req:set_resp_header(K,V,?CTX#cx.req)}).

setAttr(Element, Attr, Value) ->
    nitro:wire("{ var x = qi('" ++
                   nitro:to_list(Element) ++
                       "'); if (x) x.setAttribute('" ++
                           nitro:to_list(Attr) ++
                               "', '" ++ nitro:to_list(Value) ++ "'); }").

style(Element, Style) ->
    setAttr(Element, "style", Style).

style(Element, Style, Value) ->
    nitro:wire("{ var x = qi('" ++
                   nitro:to_list(Element) ++
                       "'); if (x) x.style." ++
                           nitro:to_list(Style) ++
                               " = '" ++ nitro:to_list(Value) ++ "'; }").

display(Element, Status) ->
    style(Element, "display", Status).

show(Element) -> display(Element, block).

hide(Element) -> display(Element, none).

compact([]) -> "[]";
compact("\n") -> "[]";
compact([X | _] = Y) when is_tuple(X) ->
    [compact(F) || F <- Y];
compact(Tuple) when is_binary(Tuple) ->
    unicode:characters_to_binary(Tuple);
compact(Tuple) when is_tuple(Tuple) ->
    Min = erlang:min(9, size(Tuple)),
    Fields = lists:zip(lists:seq(1, Min),
                       lists:sublist(tuple_to_list(Tuple), 1, Min)),
    "{" ++
        string:join([io_lib:format("~s", [compact(F)])
                     || {_, F} <- Fields],
                    ",")
            ++ "}";
compact(Tuple) -> nitro:jse(nitro:to_list(Tuple)).

meg(X) -> integer_to_list(X div 1000000) ++ "M".

rev(X) -> lists:reverse(X).

num(S) ->
    case rev(S) of
        [$K | K] -> list_to_integer(rev(K)) * 1000;
        [$M | M] -> list_to_integer(rev(M)) * 1000 * 1000;
        [$G | G] ->
            list_to_integer(rev(G)) * 1000 * 1000 * 1000;
        [$T | T] ->
            list_to_integer(rev(T)) * 1000 * 1000 * 1000 * 1000
    end.

cookie_expire(SecondsToLive) ->
    Seconds =
        calendar:datetime_to_gregorian_seconds(calendar:local_time()),
    DateTime =
        calendar:gregorian_seconds_to_datetime(Seconds +
                                                   SecondsToLive),
    cow_date:rfc2109(DateTime).

cookie(Id, Value) ->
    cookie(Id, Value, 2147483647). % expire never

cookie(Id, Value, Expire) ->
    Format = "document.cookie='~s=~s; path=/; expires=~s';",
    nitro:wire(nitro:f(Format,
                       [nitro:to_list(Id),
                        nitro:to_list(Value),
                        cookie_expire(Expire)])).

cookies() ->
    cowboy_req:parse_cookies((get(context))#cx.req).

cookie(Key) ->
    case lists:keyfind(Key,
                       1,
                       cowboy_req:parse_cookies((get(context))#cx.req))
        of
        false -> undefined;
        {_, Value} -> Value
    end.
