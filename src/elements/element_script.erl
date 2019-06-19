-module(element_script).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#script.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#script.accesskey},
      {<<"class">>, Record#script.class},
      {<<"contenteditable">>, case Record#script.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#script.contextmenu},
      {<<"dir">>, case Record#script.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#script.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#script.dropzone},
      {<<"hidden">>, case Record#script.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#script.id},
      {<<"lang">>, Record#script.lang},
      {<<"spellcheck">>, case Record#script.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#script.style},
      {<<"tabindex">>, Record#script.tabindex},
      {<<"title">>, Record#script.title},
      {<<"translate">>, case Record#script.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"async">>, if Record#script.async == true -> "async"; true -> [] end},
      {<<"charset">>,Record#script.charset},
      {<<"defer">>, if Record#script.defer == true -> "defer"; true -> [] end},
      {<<"src">>,Record#script.src},
      {<<"type">>,Record#script.type} | Record#script.data_fields
    ],
    wf_tags:emit_tag(<<"script">>,
      case Record#script.src of
           [] -> nitro:render(case Record#script.body of [] -> []; B -> B end);
           _ -> [] end, List).
