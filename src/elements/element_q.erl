-module(element_q).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#q.accesskey},
      {<<"class">>, Record#q.class},
      {<<"contenteditable">>, case Record#q.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#q.contextmenu},
      {<<"dir">>, case Record#q.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#q.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#q.dropzone},
      {<<"hidden">>, case Record#q.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#q.id},
      {<<"lang">>, Record#q.lang},
      {<<"spellcheck">>, case Record#q.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#q.style},
      {<<"tabindex">>, Record#q.tabindex},
      {<<"title">>, Record#q.title},
      {<<"translate">>, case Record#q.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"cite">>,Record#q.cite} | Record#q.data_fields
    ],
    wf_tags:emit_tag( <<"q">>, nitro:render(case Record#q.body of [] -> []; B -> B end), List).