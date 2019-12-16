-module(element_meter).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#meter.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#meter.accesskey},
      {<<"class">>, Record#meter.class},
      {<<"contenteditable">>, case Record#meter.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#meter.contextmenu},
      {<<"dir">>, case Record#meter.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#meter.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#meter.dropzone},
      {<<"hidden">>, case Record#meter.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#meter.id},
      {<<"lang">>, Record#meter.lang},
      {<<"spellcheck">>, case Record#meter.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#meter.style},
      {<<"tabindex">>, Record#meter.tabindex},
      {<<"title">>, Record#meter.title},
      {<<"translate">>, case Record#meter.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"high">>,Record#meter.high},
      {<<"low">>,Record#meter.low},
      {<<"max">>,Record#meter.max},
      {<<"min">>,Record#meter.min},
      {<<"optimum">>,Record#meter.optimum},
      {<<"value">>, Record#meter.value} | Record#meter.data_fields
    ],
    wf_tags:emit_tag(<<"meter">>, nitro:render(case Record#meter.body of [] -> []; B -> B end), List).