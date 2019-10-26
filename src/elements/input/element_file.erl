-module(element_file).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#file.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#file.postback of
        [] -> Record#file.id;
        Postback ->
          ID = case Record#file.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#file.source, delegate=Record#file.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#file.accesskey},
      {<<"class">>, Record#file.class},
      {<<"contenteditable">>, case Record#file.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#file.contextmenu},
      {<<"dir">>, case Record#file.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#file.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#file.dropzone},
      {<<"hidden">>, case Record#file.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#file.lang},
      {<<"spellcheck">>, case Record#file.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#file.style},
      {<<"tabindex">>, Record#file.tabindex},
      {<<"title">>, Record#file.title},
      {<<"translate">>, case Record#file.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"accept">>,Record#file.accept},
      {<<"autofocus">>,if Record#file.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#file.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#file.form},
      {<<"multiple">>,if Record#file.multiple == true -> "multiple"; true -> [] end},
      {<<"name">>,Record#file.name},
      {<<"required">>,if Record#file.required == true -> "required"; true -> [] end}, 
      {<<"type">>, <<"file">>} | Record#file.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#file.body), List).