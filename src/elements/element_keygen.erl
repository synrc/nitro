-module(element_keygen).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#keygen.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#keygen.postback of
        [] -> Record#keygen.id;
        Postback ->
          ID = case Record#keygen.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#keygen.source, delegate=Record#keygen.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#keygen.accesskey},
      {<<"class">>, Record#keygen.class},
      {<<"contenteditable">>, case Record#keygen.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#keygen.contextmenu},
      {<<"dir">>, case Record#keygen.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#keygen.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#keygen.dropzone},
      {<<"hidden">>, case Record#keygen.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#keygen.lang},
      {<<"spellcheck">>, case Record#keygen.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#keygen.style},
      {<<"tabindex">>, Record#keygen.tabindex},
      {<<"title">>, Record#keygen.title},
      {<<"translate">>, case Record#keygen.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autofocus">>,if Record#keygen.autofocus == true -> "autofocus"; true -> [] end},
      {<<"challenge">>,Record#keygen.challenge},      
      {<<"disabled">>, if Record#keygen.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#keygen.form},
      {<<"keytype">>,<<"rsa">>},
      {<<"name">>,Record#keygen.name} | Record#keygen.data_fields
    ],
    wf_tags:emit_tag(<<"keygen">>, nitro:render(Record#keygen.body), List).