-module(wf_render).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_item(undefined) -> <<>>;
render_item(E) when element(2,E) =:= element -> wf_render_elements:render_element(E);
render_item(E) when element(2,E) =:= action  ->
%    io:format("Render Action: ~p~n",[E]),
    wf_render_actions:render_action(E);
render_item(E) ->
%    io:format("Render Item: ~p~n",[E]),
    E.

render(undefined) -> <<>>;
render(<<E/binary>>) -> E;
render(Elements) when is_list(Elements) ->
%    io:format("Render: ~p~n",[Elements]),
   [ render_item(E) || E <- Elements, E /= undefined ];
render(Elements) -> render_item(Elements).
