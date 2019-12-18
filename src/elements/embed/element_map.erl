-module(element_map).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#map.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#map.accesskey},
      {<<"class">>, Record#map.class},
      {<<"contenteditable">>, case Record#map.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#map.contextmenu},
      {<<"dir">>, case Record#map.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#map.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#map.dropzone},
      {<<"hidden">>, case Record#map.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#map.id},
      {<<"lang">>, Record#map.lang},
      {<<"spellcheck">>, case Record#map.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#map.style},
      {<<"tabindex">>, Record#map.tabindex},
      {<<"title">>, Record#map.title},
      {<<"translate">>, case Record#map.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"name">>,Record#map.name} | Record#map.data_fields
    ],
    wf_tags:emit_tag(<<"map">>, nitro:render(case Record#map.body of [] -> []; B -> B end), List).