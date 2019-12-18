-module(action_wire).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_action(#wire{actions=Actions}) -> nitro:render(Actions);
render_action(S) when is_list(S) -> S;
render_action(_) -> [].

wire(A) -> Actions = case get(actions) of undefined -> []; E -> E end,
           put(actions,Actions++[#wire{actions=A}]), [].
