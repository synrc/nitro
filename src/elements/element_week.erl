-module(element_week).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#week.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#week.postback of
        [] -> Record#week.id;
        Postback ->
          ID = case Record#week.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#week.source, delegate=Record#week.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#week.accesskey},
      {<<"class">>, Record#week.class},
      {<<"contenteditable">>, case Record#week.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#week.contextmenu},
      {<<"dir">>, case Record#week.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#week.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#week.dropzone},
      {<<"hidden">>, case Record#week.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#week.lang},
      {<<"spellcheck">>, case Record#week.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#week.style},
      {<<"tabindex">>, Record#week.tabindex},
      {<<"title">>, Record#week.title},
      {<<"translate">>, case Record#week.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#week.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#week.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#week.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#week.form},
      {<<"list">>,Record#week.list},
      {<<"max">>,Record#week.max},
      {<<"min">>,Record#week.min},
      {<<"name">>,Record#week.name},
      {<<"readonly">>,if Record#week.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#week.required == true -> "required"; true -> [] end},      
      {<<"step">>,Record#week.step},
      {<<"type">>, <<"week">>},
      {<<"value">>, Record#week.value} | Record#week.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#week.body), List).