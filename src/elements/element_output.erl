-module(element_output).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#output.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#output.accesskey},
      {<<"class">>, Record#output.class},
      {<<"contenteditable">>, case Record#output.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#output.contextmenu},
      {<<"dir">>, case Record#output.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#output.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#output.dropzone},
      {<<"hidden">>, case Record#output.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#output.id},
      {<<"lang">>, Record#output.lang},
      {<<"spellcheck">>, case Record#output.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#output.style},
      {<<"tabindex">>, Record#output.tabindex},
      {<<"title">>, Record#output.title},
      {<<"translate">>, case Record#output.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"for">>,Record#output.for},
      {<<"form">>,Record#output.form},
      {<<"name">>,Record#output.name} | Record#output.data_fields
    ],
    wf_tags:emit_tag(<<"output">>, nitro:render(case Record#output.body of [] -> []; B -> B end), List).