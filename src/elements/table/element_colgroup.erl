-module(element_colgroup).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#colgroup.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#colgroup.accesskey},
      {<<"class">>, Record#colgroup.class},
      {<<"contenteditable">>, case Record#colgroup.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#colgroup.contextmenu},
      {<<"dir">>, case Record#colgroup.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#colgroup.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#colgroup.dropzone},
      {<<"hidden">>, case Record#colgroup.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#colgroup.id},
      {<<"lang">>, Record#colgroup.lang},
      {<<"spellcheck">>, case Record#colgroup.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#colgroup.style},
      {<<"tabindex">>, Record#colgroup.tabindex},
      {<<"title">>, Record#colgroup.title},
      {<<"translate">>, case Record#colgroup.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"span">>,Record#colgroup.span} | Record#colgroup.data_fields
    ],
    wf_tags:emit_tag(<<"colgroup">>, nitro:render(case Record#colgroup.body of [] -> []; B -> B end), List).