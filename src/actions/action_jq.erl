-module(action_jq).
-author('Rusty Klophaus').
-author('Andrey Martemyanov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

-define(B(E), nitro:to_binary(E)).
-define(R(E), nitro:render(E)).
-define(T(T), wf_event:target(T)).
-define(U, undefined).

render_action(#jq{property=?U,target=T,method=Methods,args=Args0,format=F}) ->
    Args = case F of "'~s'" -> [ ?R(Args0) ]; _ -> Args0 end,
    Format = fun(A) when is_tuple(A) orelse is_integer(A) -> ?R(A); (A) -> nitro:to_list(A) end,
    RenderedArgs = string:join([ Format(A) || A <- Args], ","),
    [[?T(T),".",?B(M),"(",nitro:f(F,[RenderedArgs]),");"] || M <- Methods];
render_action(#jq{target=T,method=?U,property=P,right=R,args=simple}) -> [?B(T),".",?B(P),"='",?R(R),"';"];
render_action(#jq{target=T,method=?U,property=P,right=?U})            -> [?T(T),".",?B(P),";"];
render_action(#jq{target=T,method=?U,property=P,right=#jq{}=R})       -> [?T(T),".",?B(P),"=", ?R(R), ";"];
render_action(#jq{target=T,method=?U,property=P,right=R})             -> [?T(T),".",?B(P),"='",?R(R),"';"].
