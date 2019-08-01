-module(action_alert).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#alert{text=T}) -> ["(window.flash || alert)(\"",nitro:js_escape(T),"\");"].
