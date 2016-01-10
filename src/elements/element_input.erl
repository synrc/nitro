-module(element_input).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#input.postback of
        undefined -> Record#input.id;
        [] -> Record#input.id;
        Postback ->
          ID = case Record#input.id of
            undefined -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input.source, delegate=Record#input.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#input.accesskey},
      {<<"class">>, Record#input.class},
      {<<"contenteditable">>, case Record#input.contenteditable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"contextmenu">>, Record#input.contextmenu},
      {<<"dir">>, case Record#input.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> undefined end},
      {<<"draggable">>, case Record#input.draggable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"dropzone">>, Record#input.dropzone},
      {<<"hidden">>, case Record#input.hidden of "hidden" -> "hidden"; _ -> undefined end},
      {<<"id">>, Id},
      {<<"lang">>, Record#input.lang},
      {<<"spellcheck">>, case Record#input.spellcheck of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"style">>, Record#input.style},
      {<<"tabindex">>, Record#input.tabindex},
      {<<"title">>, Record#input.title},
      {<<"translate">>, case Record#input.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> undefined end},      
      % spec
      {<<"autofocus">>,Record#input.autofocus},
      {<<"disabled">>, if Record#input.disabled == true -> "disabled"; true -> undefined end},
      {<<"name">>,Record#input.name},
      {<<"type">>, Record#input.type},
      {<<"accept">>, Record#input.accept},
      {<<"max">>, Record#input.max},
      {<<"placeholder">>,Record#input.placeholder},
      {<<"min">>, Record#input.min},
      {<<"multiple">>, Record#input.multiple },
      {<<"pattern">>,Record#input.pattern},
      {<<"value">>,      nitro:js_escape(Record#input.value)},
      {<<"onkeypress">>, nitro:js_escape(Record#input.onkeypress)},
      {<<"onkeyup">>,    nitro:js_escape(Record#input.onkeyup)},
      {<<"onkeydown">>,  nitro:js_escape(Record#input.onkeydown)},
      {<<"onclick">>,    nitro:js_escape(Record#input.onclick)},
      {<<"onchange">>, Record#input.onchange} | Record#input.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input.body), List).
