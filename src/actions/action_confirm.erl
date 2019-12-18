-module(action_confirm).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_action(#confirm{target=Control,text=Text,postback=Postback,delegate=Delegate}) -> 
    PostbackScript = wf_event:new(Postback, Control, Delegate, event, "[]", []),
    ["if (confirm(\"",nitro:js_escape(Text),"\")) {",PostbackScript,"}"].

