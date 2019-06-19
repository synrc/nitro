-module(element_video).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#video.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#video.accesskey},
      {<<"class">>, Record#video.class},
      {<<"contenteditable">>, case Record#video.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#video.contextmenu},
      {<<"dir">>, case Record#video.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#video.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#video.dropzone},
      {<<"hidden">>, case Record#video.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#video.id},
      {<<"lang">>, Record#video.lang},
      {<<"spellcheck">>, case Record#video.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#video.style},
      {<<"tabindex">>, Record#video.tabindex},
      {<<"title">>, Record#video.title},
      {<<"translate">>, case Record#video.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autoplay">>, case Record#video.autoplay of true -> "autoplay"; _ -> [] end},      
      {<<"controls">>, case Record#video.controls of true -> "controls"; _ -> [] end},      
      {<<"height">>, Record#video.height},      
      {<<"loop">>, case Record#video.loop of true -> "loop"; _ -> [] end},            
      {<<"mediagroup">>, Record#video.mediagroup},      
      {<<"muted">>, case Record#video.muted of true -> "muted"; _ -> [] end},
      {<<"poster">>, Record#video.poster},      
      {<<"preload">>, case Record#video.preload of "auto" -> "auto"; "none" -> "none"; "metadata" -> "metadata"; _ -> [] end},
      {<<"src">>, Record#video.src},     
      {<<"width">>, Record#video.width} | Record#video.data_fields
    ],
    wf_tags:emit_tag(<<"video">>, nitro:render(case Record#video.body of [] -> []; B -> B end), List).