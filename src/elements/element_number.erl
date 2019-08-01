-module(element_number).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#number.postback of
        undefined -> Record#number.id;
        Postback ->
          ID = case Record#number.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#number.source, delegate=Record#number.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#number.accesskey},
      {<<"class">>, Record#number.class},
      {<<"contenteditable">>, case Record#number.contenteditable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"contextmenu">>, Record#number.contextmenu},
      {<<"dir">>, case Record#number.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> undefined end},
      {<<"draggable">>, case Record#number.draggable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"dropzone">>, Record#number.dropzone},
      {<<"hidden">>, case Record#number.hidden of "hidden" -> "hidden"; _ -> undefined end},
      {<<"id">>, Id},
      {<<"lang">>, Record#number.lang},
      {<<"spellcheck">>, case Record#number.spellcheck of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"style">>, Record#number.style},
      {<<"tabindex">>, Record#number.tabindex},
      {<<"title">>, Record#number.title},
      {<<"translate">>, case Record#number.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> undefined end},      
      % spec      
      {<<"autocomplete">>, case Record#number.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
      {<<"autofocus">>,if Record#number.autofocus == true -> "autofocus"; true -> undefined end},            
      {<<"disabled">>, if Record#number.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#number.form},
      {<<"list">>,Record#number.list},
      {<<"max">>,Record#number.max},
      {<<"min">>,Record#number.min},      
      {<<"name">>,Record#number.name},
      {<<"placeholder">>,Record#number.placeholder},
      {<<"readonly">>,if Record#number.readonly == true -> "readonly"; true -> undefined end},      
      {<<"required">>,if Record#number.required == true -> "required"; true -> undefined end},      
      {<<"step">>,Record#number.step},
      {<<"type">>, <<"number">>},
      {<<"value">>, Record#number.value} | Record#number.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#number.body), List).