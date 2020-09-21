-module(element_input).
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#input.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#input.postback of
        [] -> Record#input.id;
        undefined -> Record#input.id;
        Postback ->
          ID = case Record#input.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#input.source, delegate=Record#input.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#input.accesskey},
      {<<"class">>, Record#input.class},
      {<<"contenteditable">>, case Record#input.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#input.contextmenu},
      {<<"dir">>, case Record#input.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#input.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#input.dropzone},
      {<<"hidden">>, case Record#input.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#input.lang},
      {<<"spellcheck">>, case Record#input.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#input.style},
      {<<"tabindex">>, Record#input.tabindex},
      {<<"title">>, Record#input.title},
      {<<"translate">>, case Record#input.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},
      % spec
      {<<"autocomplete">>,Record#input.autocomplete},
      {<<"autofocus">>,Record#input.autofocus},
      {<<"disabled">>, if Record#input.disabled == true -> "disabled"; true -> [] end},
      {<<"name">>,Record#input.name},
      {<<"type">>, Record#input.type},
      {<<"accept">>, Record#input.accept},
      {<<"max">>, Record#input.max},
      {<<"checked">>, if Record#input.checked == true -> true; true -> [] end},
      {<<"aria-states">>, Record#input.aria_states},
      {<<"placeholder">>,Record#input.placeholder},
      {<<"min">>, Record#input.min},
      {<<"multiple">>, Record#input.multiple},
      {<<"pattern">>, Record#input.pattern},
      {<<"value">>, Record#input.value},
      {<<"data-bind">>, case Record#input.bind of [] -> []; X -> base64:encode(term_to_binary(X)) end},
      {<<"onkeypress">>, Record#input.onkeypress},
      {<<"onkeyup">>, Record#input.onkeyup},
      {<<"onkeydown">>, Record#input.onkeydown},
      {<<"onclick">>, Record#input.onclick},
      {<<"required">>, if Record#input.required == true -> "required"; true -> [] end},
      {<<"onchange">>, Record#input.onchange} | Record#input.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#input.body), List).
