-module(wf_render_actions).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_action/1]).

render_action(Action) ->
    Module = element(#action.module,Action),
    Res = Module:render_action(Action),
    case Res of
         Res when is_tuple(Res) -> render_action(Res);
         Bin when is_binary(Bin) -> Bin;
         Str when is_list(Str) -> Str;
         _ -> [] end.

