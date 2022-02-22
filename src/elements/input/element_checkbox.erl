-module(element_checkbox).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#checkbox.show_if==false -> [<<>>];
render_element(Record) -> 
    Id = case Record#checkbox.id of [] -> nitro:temp_id(); I->I end,
    case Record#checkbox.postback of
        [] -> ignore;
        Postback -> nitro:wire(#event { type=change, postback=Postback, target=Id, source=[Id|Record#checkbox.source], delegate=Record#checkbox.delegate })
    end,
   List = [
      % global
      {<<"accesskey">>, Record#checkbox.accesskey},
      {<<"class">>, Record#checkbox.class},
      {<<"contenteditable">>, case Record#checkbox.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#checkbox.contextmenu},
      {<<"dir">>, case Record#checkbox.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#checkbox.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#checkbox.dropzone},
      {<<"hidden">>, case Record#checkbox.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#checkbox.lang},
      {<<"spellcheck">>, case Record#checkbox.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#checkbox.style},
      {<<"tabindex">>, Record#checkbox.tabindex},
      {<<"title">>, Record#checkbox.title},
      {<<"translate">>, case Record#checkbox.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autofocus">>,Record#checkbox.autofocus},
      {<<"checked">>, if Record#checkbox.checked==true -> <<"checked">>; true -> [] end},
      {<<"data-toggle">>, <<"checkbox">>},
      {<<"disabled">>, if Record#checkbox.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>, Record#checkbox.form},
      {<<"name">>, Record#checkbox.name},            
      {<<"required">>, if Record#checkbox.required == true -> "required"; true -> [] end},
      {<<"type">>, <<"checkbox">>},
      {<<"value">>, Record#checkbox.value} | Record#checkbox.data_fields
      ],
    case Record#checkbox.label of
      true ->
        wf_tags:emit_tag(<<"label">>, nitro:render([wf_tags:emit_tag(<<"input">>, [], List), Record#checkbox.body]), [
          {<<"class">>, Record#checkbox.class},
          {<<"style">>, Record#checkbox.style},
          {<<"for">>, Id} ]);
      false -> nitro:render(wf_tags:emit_tag(<<"input">>, Record#checkbox.body, List)) end.