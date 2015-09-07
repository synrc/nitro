-module(nitro).
-include("nitro.hrl").
-compile(export_all).
-behaviour(application).
-export([start/2, stop/1, init/1]).

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

unique_integer() -> try erlang:unique_integer() catch _:_ -> {MS,S,US} = erlang:now(), (MS*1000000+S)*1000000+US end.
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
			%% Any integers above 255 are converted to their HTML encode equivilant,
			%% Example: 7534 gets turned into &#7534;
			[$&,$# | nitro:to_list(BigNum)] ++ ";" ++ html_encode(T);
		Tup when is_tuple(Tup) ->
			throw({html_encode,encountered_tuple,Tup});
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
