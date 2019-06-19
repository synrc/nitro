-module(element_hidden).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#hidden.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#hidden.accesskey},
      {<<"class">>, Record#hidden.class},
      {<<"contenteditable">>, case Record#hidden.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#hidden.contextmenu},
      {<<"dir">>, case Record#hidden.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#hidden.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#hidden.dropzone},
      {<<"hidden">>, case Record#hidden.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#hidden.id},
      {<<"lang">>, Record#hidden.lang},
      {<<"spellcheck">>, case Record#hidden.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#hidden.style},
      {<<"tabindex">>, Record#hidden.tabindex},
      {<<"title">>, Record#hidden.title},
      {<<"translate">>, case Record#hidden.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"disabled">>, if Record#hidden.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#hidden.form},
      {<<"name">>,Record#hidden.name},
      {<<"type">>, <<"hidden">>},
      {<<"value">>, Record#hidden.value} | Record#hidden.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#hidden.body), List).