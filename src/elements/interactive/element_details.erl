-module(element_details).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#details.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#details.accesskey},
      {<<"class">>, Record#details.class},
      {<<"contenteditable">>, case Record#details.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#details.contextmenu},
      {<<"dir">>, case Record#details.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#details.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#details.dropzone},
      {<<"hidden">>, case Record#details.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#details.id},
      {<<"lang">>, Record#details.lang},
      {<<"spellcheck">>, case Record#details.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#details.style},
      {<<"tabindex">>, Record#details.tabindex},
      {<<"title">>, Record#details.title},
      {<<"translate">>, case Record#details.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"open">>, case Record#details.open of true -> "open"; _ -> [] end} | Record#details.data_fields
    ],
    wf_tags:emit_tag(<<"details">>, nitro:render(case Record#details.body of [] -> []; B -> B end), List).