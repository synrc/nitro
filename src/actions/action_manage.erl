-module(action_manage).
-author('Andrey Martemyanov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

-define(B(E), nitro:to_binary(E)).
-define(R(E), nitro:render(E)).
-define(T(T), wf_event:target(T)).

render_action(#replace{target=T,elements=E}) -> ?R(#jq{target=T,property=outerHTML,right=E});
render_action(#insert{target=T,elements=E,position=P}) ->
    {Rendered,Actions}=render_element(E),
    [?T(T),".insertAdjacentHTML('",?B(P),"','",Rendered,"');",?R(Actions)];
render_action(#multi{actions=A}) -> ["window.requestAnimationFrame(function(timestamp){",?R(A),"});"].

render_element(E) ->
    Pid = self(),
    Ref = make_ref(),
    spawn(fun() -> Pid ! {?R(E),Ref,wf:actions()} end),
    receive {Rendered, Ref, Actions} -> {Rendered,Actions} end.