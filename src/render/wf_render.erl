-module(wf_render).
-include_lib("nitro/include/nitro.hrl").
-export([render_item/1, render/1]).

render_item([]) -> <<>>;
render_item(undefined) -> <<>>;
render_item(E) when element(2,E) =:= element -> wf_render_elements:render_element(E);
render_item(E) when element(2,E) =:= action  -> wf_render_actions:render_action(E);
render_item(E) -> E.

render([]) -> <<>>;
render(undefined) -> <<>>;
render(<<E/binary>>) -> E;
render(Elements) when is_list(Elements) -> [ render_item(E) || E <- Elements, E /= undefined, E /= nil ];
render(Elements) -> render_item(Elements).
