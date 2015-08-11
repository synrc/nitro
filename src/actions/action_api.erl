-module(action_api).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(Record) ->
    Name = Record#api.name,
    Data = "utf8_toByteArray(JSON.stringify(data))",
    PostbackScript = wf_event:new(Name, "document", Record#api.delegate, api_event, Data, []),
    nitro:f("~s = function(data) {",  [Name]) ++ PostbackScript ++ "};".

