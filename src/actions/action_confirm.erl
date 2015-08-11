-module(action_confirm).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(Record) -> 
    Control = Record#confirm.target,
    Delegate = Record#confirm.delegate,
    Postback = Record#confirm.postback,
    PostbackScript = wf_event:new(Postback, Control, Delegate, event, "[]", []),
    [
        nitro:f("if (confirm(\"~s\")) {", [nitro:js_escape(Record#confirm.text)]),
        PostbackScript,
        "}"
    ].

