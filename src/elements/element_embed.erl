-module(element_embed).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#embed.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#embed.accesskey},
      {<<"class">>, Record#embed.class},
      {<<"contenteditable">>, case Record#embed.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#embed.contextmenu},
      {<<"dir">>, case Record#embed.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#embed.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#embed.dropzone},
      {<<"hidden">>, case Record#embed.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#embed.id},
      {<<"lang">>, Record#embed.lang},
      {<<"spellcheck">>, case Record#embed.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#embed.style},
      {<<"tabindex">>, Record#embed.tabindex},
      {<<"title">>, Record#embed.title},
      {<<"translate">>, case Record#embed.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"height">>,Record#embed.height},      
      {<<"src">>,Record#embed.src},
      {<<"type">>,Record#embed.type},
      {<<"width">>,Record#embed.width} | Record#embed.data_fields
    ],
    wf_tags:emit_tag(<<"embed">>, List).