-module(element_meta).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#meta.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#meta.accesskey},
      {<<"class">>, Record#meta.class},
      {<<"contenteditable">>, case Record#meta.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#meta.contextmenu},
      {<<"dir">>, case Record#meta.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#meta.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#meta.dropzone},
      {<<"hidden">>, case Record#meta.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#meta.id},
      {<<"lang">>, Record#meta.lang},
      {<<"spellcheck">>, case Record#meta.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#meta.style},
      {<<"tabindex">>, Record#meta.tabindex},
      {<<"title">>, Record#meta.title},
      {<<"translate">>, case Record#meta.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"charset">>, Record#meta.charset},
      {<<"content">>, Record#meta.content},
      {<<"http_equiv">>, Record#meta.http_equiv},
      {<<"name">>, Record#meta.name},
      {<<"type">>, Record#meta.type} | Record#meta.data_fields
    ],
    wf_tags:emit_tag(<<"meta">>, List).