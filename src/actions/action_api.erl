-module(action_api).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

-define(B(E), nitro:to_binary(E)).

render_action(#api{name=Name,delegate=Delegate}) ->
    Data = "string(JSON.stringify(data))",
    PostbackScript = wf_event:new(Name, "document", Delegate, api_event, Data, []),
    [?B(Name),"=function(data){",PostbackScript,"};"].

