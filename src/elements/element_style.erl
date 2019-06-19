-module(element_style).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#style.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#style.accesskey},
      {<<"class">>, Record#style.class},
      {<<"contenteditable">>, case Record#style.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#style.contextmenu},
      {<<"dir">>, case Record#style.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#style.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#style.dropzone},
      {<<"hidden">>, case Record#style.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#style.id},
      {<<"lang">>, Record#style.lang},
      {<<"spellcheck">>, case Record#style.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#style.style},
      {<<"tabindex">>, Record#style.tabindex},
      {<<"title">>, Record#style.title},
      {<<"translate">>, case Record#style.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"media">>, Record#style.media},
      {<<"scoped">>, case Record#style.scoped of true -> "scoped"; _ -> [] end},      
      {<<"type">>, Record#style.type} | Record#style.data_fields
    ],
    wf_tags:emit_tag(<<"style">>, nitro:render(case Record#style.body of [] -> []; B -> B end), List).