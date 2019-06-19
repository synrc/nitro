-module(element_col).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#col.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#col.accesskey},
      {<<"class">>, Record#col.class},
      {<<"contenteditable">>, case Record#col.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#col.contextmenu},
      {<<"dir">>, case Record#col.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#col.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#col.dropzone},
      {<<"hidden">>, case Record#col.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#col.id},
      {<<"lang">>, Record#col.lang},
      {<<"spellcheck">>, case Record#col.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#col.style},
      {<<"tabindex">>, Record#col.tabindex},
      {<<"title">>, Record#col.title},
      {<<"translate">>, case Record#col.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"span">>,Record#col.span} | Record#col.data_fields
    ],
    wf_tags:emit_tag(<<"col">>, nitro:render(case Record#col.body of [] -> []; B -> B end), List).