-module(element_number).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#number.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#number.postback of
        [] -> Record#number.id;
        Postback ->
          ID = case Record#number.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#number.source, delegate=Record#number.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#number.accesskey},
      {<<"class">>, Record#number.class},
      {<<"contenteditable">>, case Record#number.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#number.contextmenu},
      {<<"dir">>, case Record#number.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#number.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#number.dropzone},
      {<<"hidden">>, case Record#number.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#number.lang},
      {<<"spellcheck">>, case Record#number.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#number.style},
      {<<"tabindex">>, Record#number.tabindex},
      {<<"title">>, Record#number.title},
      {<<"translate">>, case Record#number.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec      
      {<<"autocomplete">>, case Record#number.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#number.autofocus == true -> "autofocus"; true -> [] end},            
      {<<"disabled">>, if Record#number.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#number.form},
      {<<"list">>,Record#number.list},
      {<<"max">>,Record#number.max},
      {<<"min">>,Record#number.min},      
      {<<"name">>,Record#number.name},
      {<<"placeholder">>,Record#number.placeholder},
      {<<"readonly">>,if Record#number.readonly == true -> "readonly"; true -> [] end},      
      {<<"required">>,if Record#number.required == true -> "required"; true -> [] end},      
      {<<"step">>,Record#number.step},
      {<<"type">>, <<"number">>},
      {<<"value">>, Record#number.value} | Record#number.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#number.body), List).