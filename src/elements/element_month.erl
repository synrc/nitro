-module(element_month).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#month.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#month.postback of
        [] -> Record#month.id;
        Postback ->
          ID = case Record#month.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#month.source, delegate=Record#month.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#month.accesskey},
      {<<"class">>, Record#month.class},
      {<<"contenteditable">>, case Record#month.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#month.contextmenu},
      {<<"dir">>, case Record#month.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#month.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#month.dropzone},
      {<<"hidden">>, case Record#month.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#month.lang},
      {<<"spellcheck">>, case Record#month.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#month.style},
      {<<"tabindex">>, Record#month.tabindex},
      {<<"title">>, Record#month.title},
      {<<"translate">>, case Record#month.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"alt">>,Record#month.alt},
      {<<"autofocus">>,if Record#month.autofocus == true -> "autofocus"; true -> [] end},            
      {<<"disabled">>, if Record#month.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#month.form},
      {<<"max">>,Record#month.max},
      {<<"min">>,Record#month.min},      
      {<<"name">>,Record#month.name},
      {<<"readonly">>,if Record#month.readonly == true -> "readonly"; true -> [] end},      
      {<<"required">>,if Record#month.required == true -> "required"; true -> [] end},      
      {<<"step">>,Record#month.step},
      {<<"type">>, <<"month">>},
      {<<"value">>, Record#month.value} | Record#month.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#month.body), List).