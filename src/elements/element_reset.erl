-module(element_reset).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#reset.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#reset.postback of
        [] -> Record#reset.id;
        Postback ->
          ID = case Record#reset.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#reset.source, delegate=Record#reset.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#reset.accesskey},
      {<<"class">>, Record#reset.class},
      {<<"contenteditable">>, case Record#reset.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#reset.contextmenu},
      {<<"dir">>, case Record#reset.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#reset.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#reset.dropzone},
      {<<"hidden">>, case Record#reset.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#reset.lang},
      {<<"spellcheck">>, case Record#reset.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#reset.style},
      {<<"tabindex">>, Record#reset.tabindex},
      {<<"title">>, Record#reset.title},
      {<<"translate">>, case Record#reset.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autofocus">>,if Record#reset.autofocus == true -> "autofocus"; true -> [] end},            
      {<<"disabled">>, if Record#reset.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#reset.form},
      {<<"name">>,Record#reset.name},
      {<<"type">>, <<"reset">>},
      {<<"value">>, Record#reset.value} | Record#reset.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#reset.body), List).