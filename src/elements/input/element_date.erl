-module(element_date).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#date.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#date.postback of
        [] -> Record#date.id;
        Postback ->
          ID = case Record#date.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#date.source, delegate=Record#date.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#date.accesskey},
      {<<"class">>, Record#date.class},
      {<<"contenteditable">>, case Record#date.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#date.contextmenu},
      {<<"dir">>, case Record#date.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#date.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#date.dropzone},
      {<<"hidden">>, case Record#date.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#date.lang},
      {<<"spellcheck">>, case Record#date.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#date.style},
      {<<"tabindex">>, Record#date.tabindex},
      {<<"title">>, Record#date.title},
      {<<"translate">>, case Record#date.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#date.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#date.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#date.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#date.form},
      {<<"list">>,Record#date.list},
      {<<"max">>,Record#date.max},
      {<<"min">>,Record#date.min},
      {<<"name">>,Record#date.name},
      {<<"readonly">>,if Record#date.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#date.required == true -> "required"; true -> [] end},      
      {<<"step">>,Record#date.step},
      {<<"type">>, <<"date">>},
      {<<"value">>, Record#date.value} | Record#date.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#date.body), List).