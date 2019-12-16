-module(element_search).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#search.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#search.postback of
        [] -> Record#search.id;
        Postback ->
          ID = case Record#search.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#search.source, delegate=Record#search.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#search.accesskey},
      {<<"class">>, Record#search.class},
      {<<"contenteditable">>, case Record#search.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#search.contextmenu},
      {<<"dir">>, case Record#search.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#search.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#search.dropzone},
      {<<"hidden">>, case Record#search.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#search.lang},
      {<<"spellcheck">>, case Record#search.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#search.style},
      {<<"tabindex">>, Record#search.tabindex},
      {<<"title">>, Record#search.title},
      {<<"translate">>, case Record#search.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#search.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#search.autofocus == true -> "autofocus"; true -> [] end},
      {<<"dirname">>,Record#search.dirname},
      {<<"disabled">>, if Record#search.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#search.form},
      {<<"list">>,Record#search.list},
      {<<"maxlength">>,Record#search.maxlength},
      {<<"name">>,Record#search.name},
      {<<"pattern">>,Record#search.pattern},
      {<<"placeholder">>,Record#search.placeholder},
      {<<"readonly">>,if Record#search.readonly == true -> "readonly"; true -> [] end},      
      {<<"required">>,if Record#search.required == true -> "required"; true -> [] end},      
      {<<"size">>,Record#search.size},
      {<<"type">>, <<"search">>},
      {<<"value">>, Record#search.value} | Record#search.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#search.body), List).