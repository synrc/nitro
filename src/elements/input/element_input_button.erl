-module(element_input_button).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#input_button.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#input_button.postback of
        [] -> Record#input_button.id;
        Postback ->
          ID = case Record#input_button.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input_button.source, delegate=Record#input_button.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#input_button.accesskey},
      {<<"class">>, Record#input_button.class},
      {<<"contenteditable">>, case Record#input_button.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#input_button.contextmenu},
      {<<"dir">>, case Record#input_button.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#input_button.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#input_button.dropzone},
      {<<"hidden">>, case Record#input_button.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#input_button.lang},
      {<<"spellcheck">>, case Record#input_button.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#input_button.style},
      {<<"tabindex">>, Record#input_button.tabindex},
      {<<"title">>, Record#input_button.title},
      {<<"translate">>, case Record#input_button.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autofocus">>,Record#input_button.autofocus},
      {<<"disabled">>, if Record#input_button.disabled == true -> "disabled"; true -> [] end},
      {<<"name">>,Record#input_button.name},
      {<<"type">>, <<"button">>},
      {<<"value">>, Record#input_button.value} | Record#input_button.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input_button.body), List).