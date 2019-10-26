-module(element_color).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#color.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#color.postback of
        [] -> Record#color.id;
        Postback ->
          ID = case Record#color.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#color.source, delegate=Record#color.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#color.accesskey},
      {<<"class">>, Record#color.class},
      {<<"contenteditable">>, case Record#color.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#color.contextmenu},
      {<<"dir">>, case Record#color.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#color.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#color.dropzone},
      {<<"hidden">>, case Record#color.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#color.lang},
      {<<"spellcheck">>, case Record#color.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#color.style},
      {<<"tabindex">>, Record#color.tabindex},
      {<<"title">>, Record#color.title},
      {<<"translate">>, case Record#color.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>,case Record#color.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#color.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#color.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#color.form},
      {<<"list">>,Record#color.list},      
      {<<"name">>,Record#color.name},
      {<<"type">>, <<"color">>},
      {<<"value">>, Record#color.value} | Record#color.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#color.body), List).