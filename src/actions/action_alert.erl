-module(action_alert).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(Record) -> nitro:f("alert(\"~s\");", [nitro:js_escape(Record#alert.text)]).
