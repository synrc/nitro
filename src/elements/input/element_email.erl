-module(element_email).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#email.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#email.postback of
        [] -> Record#email.id;
        Postback ->
          ID = case Record#email.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#email.source, delegate=Record#email.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#email.accesskey},
      {<<"class">>, Record#email.class},
      {<<"contenteditable">>, case Record#email.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#email.contextmenu},
      {<<"dir">>, case Record#email.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#email.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#email.dropzone},
      {<<"hidden">>, case Record#email.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#email.lang},
      {<<"spellcheck">>, case Record#email.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#email.style},
      {<<"tabindex">>, Record#email.tabindex},
      {<<"title">>, Record#email.title},
      {<<"translate">>, case Record#email.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#email.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#email.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#email.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#email.form},
      {<<"list">>,Record#email.list},
      {<<"maxlength">>,Record#email.maxlength},
      {<<"multiple">>,if Record#email.multiple == true -> "multiple"; true -> [] end},
      {<<"name">>,Record#email.name},
      {<<"pattern">>,Record#email.pattern},
      {<<"placeholder">>,Record#email.placeholder},
      {<<"readonly">>,if Record#email.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#email.required == true -> "required"; true -> [] end}, 
      {<<"size">>,Record#email.size},
      {<<"type">>, <<"email">>},
      {<<"value">>, Record#email.value} | Record#email.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#email.body), List).