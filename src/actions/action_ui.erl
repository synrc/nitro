-module(action_ui).
-author('Andrey Martemyanov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

-define(T(T), wf_event:target(T)).

render_action(#focus{target=T}) -> ["window.setTimeout(function(){var x=",?T(T),"; x && x.focus();},4);"].
