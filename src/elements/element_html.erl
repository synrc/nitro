-module(element_html).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#html.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#html.accesskey},
      {<<"class">>, Record#html.class},
      {<<"contenteditable">>, case Record#html.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#html.contextmenu},
      {<<"dir">>, case Record#html.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#html.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#html.dropzone},
      {<<"hidden">>, case Record#html.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#html.id},
      {<<"lang">>, Record#html.lang},
      {<<"spellcheck">>, case Record#html.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#html.style},
      {<<"tabindex">>, Record#html.tabindex},
      {<<"title">>, Record#html.title},
      {<<"translate">>, case Record#html.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"manifest">>, Record#html.manifest} | Record#html.data_fields
    ],
    wf_tags:emit_tag(<<"html">>, nitro:render(case Record#html.body of [] -> []; B -> B end), List).