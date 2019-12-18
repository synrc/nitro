-module(element_audio).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#audio.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#audio.accesskey},
      {<<"class">>, Record#audio.class},
      {<<"contenteditable">>, case Record#audio.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#audio.contextmenu},
      {<<"dir">>, case Record#audio.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#audio.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#audio.dropzone},
      {<<"hidden">>, case Record#audio.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#audio.id},
      {<<"lang">>, Record#audio.lang},
      {<<"spellcheck">>, case Record#audio.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#audio.style},
      {<<"tabindex">>, Record#audio.tabindex},
      {<<"title">>, Record#audio.title},
      {<<"translate">>, case Record#audio.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"autoplay">>, case Record#audio.autoplay of true -> "autoplay"; _ -> [] end},      
      {<<"controls">>, case Record#audio.controls of true -> "controls"; _ -> [] end},      
      {<<"loop">>, case Record#audio.loop of true -> "loop"; _ -> [] end},            
      {<<"mediagroup">>, Record#audio.mediagroup},      
      {<<"muted">>, case Record#audio.muted of true -> "muted"; _ -> [] end},
      {<<"preload">>, case Record#audio.preload of "auto" -> "auto"; "none" -> "none"; "metadata" -> "metadata"; _ -> [] end},
      {<<"src">>, Record#audio.src},
      {<<"width">>, Record#audio.width} | Record#audio.data_fields
    ],
    wf_tags:emit_tag(<<"audio">>, nitro:render(case Record#audio.body of [] -> []; B -> B end), List).