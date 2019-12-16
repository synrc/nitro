-module(action_alert).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_action(#alert{text=T}) -> ["alert(\"",nitro:js_escape(T),"\");"].
