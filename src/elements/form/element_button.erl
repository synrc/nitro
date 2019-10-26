-module(element_button).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#button.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#button.postback of
        [] -> Record#button.id;
        undefined -> Record#button.id;
        Postback ->
          ID = case Record#button.id of [] -> nitro:temp_id(); I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#button.source, delegate=Record#button.delegate }),
          ID end,
    wf_tags:emit_tag(<<"button">>, nitro:render(Record#button.body), [
        {<<"id">>, Id},
        {<<"type">>, Record#button.type},
        {<<"name">>, Record#button.name},
        {<<"class">>, Record#button.class},
        {<<"style">>, Record#button.style},
        {<<"onchange">>, Record#button.onchange},
        {<<"onclick">>, Record#button.onclick},
        {<<"disabled">>, if Record#button.disabled == true -> "disabled"; true -> [] end},
        {<<"value">>, Record#button.value}  | Record#button.data_fields ]).
