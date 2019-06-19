-module(element_param).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#param.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#param.accesskey},
      {<<"class">>, Record#param.class},
      {<<"contenteditable">>, case Record#param.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#param.contextmenu},
      {<<"dir">>, case Record#param.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#param.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#param.dropzone},
      {<<"hidden">>, case Record#param.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#param.id},
      {<<"lang">>, Record#param.lang},
      {<<"spellcheck">>, case Record#param.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#param.style},
      {<<"tabindex">>, Record#param.tabindex},
      {<<"title">>, Record#param.title},
      {<<"translate">>, case Record#param.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"name">>,Record#param.name},
      {<<"value">>,Record#param.value} | Record#param.data_fields
    ],
    wf_tags:emit_tag(<<"param">>, List).