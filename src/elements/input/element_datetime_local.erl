-module(element_datetime_local).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#datetime_local.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#datetime_local.postback of
        [] -> Record#datetime_local.id;
        Postback ->
          ID = case Record#datetime_local.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#datetime_local.source, delegate=Record#datetime_local.delegate }),
          ID end,
    List = [
      %global
      {<<"accesskey">>, Record#datetime_local.accesskey},
      {<<"class">>, Record#datetime_local.class},
      {<<"contenteditable">>, case Record#datetime_local.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#datetime_local.contextmenu},
      {<<"dir">>, case Record#datetime_local.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#datetime_local.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#datetime_local.dropzone},
      {<<"hidden">>, case Record#datetime_local.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#datetime_local.lang},
      {<<"spellcheck">>, case Record#datetime_local.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#datetime_local.style},
      {<<"tabindex">>, Record#datetime_local.tabindex},
      {<<"title">>, Record#datetime_local.title},
      {<<"translate">>, case Record#datetime_local.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autocomplete">>, case Record#datetime_local.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#datetime_local.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#datetime_local.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#datetime_local.form},
      {<<"list">>,Record#datetime_local.list},
      {<<"max">>,Record#datetime_local.max},
      {<<"min">>,Record#datetime_local.min},
      {<<"name">>,Record#datetime_local.name},
      {<<"readonly">>,if Record#datetime_local.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#datetime_local.required == true -> "required"; true -> [] end},      
      {<<"step">>,Record#datetime_local.step},
      {<<"type">>, <<"datetime-local">>},
      {<<"value">>, Record#datetime_local.value} | Record#datetime_local.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#datetime_local.body), List).
