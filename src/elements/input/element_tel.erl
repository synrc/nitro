-module(element_tel).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#tel.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#tel.postback of
        [] -> Record#tel.id;
        Postback ->
          ID = case Record#tel.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#tel.source, delegate=Record#tel.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#tel.accesskey},
      {<<"class">>, Record#tel.class},
      {<<"contenteditable">>, case Record#tel.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#tel.contextmenu},
      {<<"dir">>, case Record#tel.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#tel.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#tel.dropzone},
      {<<"hidden">>, case Record#tel.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#tel.lang},
      {<<"spellcheck">>, case Record#tel.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#tel.style},
      {<<"tabindex">>, Record#tel.tabindex},
      {<<"title">>, Record#tel.title},
      {<<"translate">>, case Record#tel.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#tel.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#tel.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#tel.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#tel.form},
      {<<"list">>,Record#tel.list},
      {<<"maxlength">>,Record#tel.maxlength},
      {<<"name">>,Record#tel.name},
      {<<"pattern">>,Record#tel.pattern},
      {<<"placeholder">>,Record#tel.placeholder},
      {<<"readonly">>,if Record#tel.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#tel.required == true -> "required"; true -> [] end},      
      {<<"size">>,Record#tel.size},
      {<<"type">>, <<"tel">>},
      {<<"value">>, Record#tel.value} | Record#tel.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#tel.body), List).