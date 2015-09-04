-module(element_button).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#button.postback of
        undefined -> Record#button.id;
        Postback ->
          ID = case Record#button.id of undefined -> wf:temp_id(); I -> I end,
          wf:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#button.source, delegate=Record#button.delegate }),
          ID end,
    wf_tags:emit_tag(<<"button">>, nitro:render(Record#button.body), [
        {<<"id">>, Id},
        {<<"type">>, Record#button.type},
        {<<"name">>, Record#button.name},
        {<<"class">>, Record#button.class},
        {<<"style">>, Record#button.style},
        {<<"disabled">>, if Record#button.disabled == true -> "disabled"; true -> undefined end},
        {<<"value">>, Record#button.value}  | Record#button.data_fields ]).
