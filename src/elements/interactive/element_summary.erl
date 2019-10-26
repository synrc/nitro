-module(element_summary).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#summary.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#summary.accesskey},
      {<<"class">>, Record#summary.class},
      {<<"contenteditable">>, case Record#summary.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#summary.contextmenu},
      {<<"dir">>, case Record#summary.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#summary.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#summary.dropzone},
      {<<"hidden">>, case Record#summary.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#summary.id},
      {<<"lang">>, Record#summary.lang},
      {<<"spellcheck">>, case Record#summary.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#summary.style},
      {<<"tabindex">>, Record#summary.tabindex},
      {<<"title">>, Record#summary.title},
      {<<"translate">>, case Record#summary.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end} | Record#summary.data_fields
    ],
    wf_tags:emit_tag(<<"summary">>, nitro:render(case Record#summary.body of [] -> []; B -> B end), List).