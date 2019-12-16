-module(element_password).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#password.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#password.postback of
        [] -> Record#password.id;
        Postback ->
          ID = case Record#password.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#password.source, delegate=Record#password.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#password.accesskey},
      {<<"class">>, Record#password.class},
      {<<"contenteditable">>, case Record#password.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#password.contextmenu},
      {<<"dir">>, case Record#password.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#password.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#password.dropzone},
      {<<"hidden">>, case Record#password.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#password.lang},
      {<<"spellcheck">>, case Record#password.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#password.style},
      {<<"tabindex">>, Record#password.tabindex},
      {<<"title">>, Record#password.title},
      {<<"translate">>, case Record#password.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec 
      {<<"autocomplete">>, case Record#password.autocomplete of true -> "on"; false -> "off"; _ -> [] end},      
      {<<"autofocus">>,if Record#password.autofocus == true -> "autofocus"; true -> [] end},            
      {<<"disabled">>, if Record#password.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#password.form},
      {<<"maxlength">>,Record#password.maxlength},
      {<<"name">>,Record#password.name},
      {<<"pattern">>,Record#password.pattern},
      {<<"placeholder">>, Record#password.placeholder},
      {<<"readonly">>,if Record#password.readonly == true -> "readonly"; true -> [] end},      
      {<<"required">>,if Record#password.required == true -> "required"; true -> [] end},      
      {<<"size">>,Record#password.size},
      {<<"type">>, <<"password">>},
      {<<"value">>, Record#password.value} | Record#password.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#password.body), List).
