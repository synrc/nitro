-module(element_track).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#track.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#track.accesskey},
      {<<"class">>, Record#track.class},
      {<<"contenteditable">>, case Record#track.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#track.contextmenu},
      {<<"dir">>, case Record#track.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#track.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#track.dropzone},
      {<<"hidden">>, case Record#track.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#track.id},
      {<<"lang">>, Record#track.lang},
      {<<"spellcheck">>, case Record#track.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#track.style},
      {<<"tabindex">>, Record#track.tabindex},
      {<<"title">>, Record#track.title},
      {<<"translate">>, case Record#track.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"default">>, case Record#track.default of true -> "default"; _ -> [] end},
      {<<"kind">>, case Record#track.kind of "subtitles" -> "subtitles"; "captions" -> "captions"; "descriptions" -> "descriptions"; "chapters" -> "chapters"; "metadata" -> "metadata"; _ -> [] end},
      {<<"label">>, Record#track.label},
      {<<"src">>, Record#track.src},
      {<<"srclang">>, Record#track.srclang} | Record#track.data_fields
    ],
    wf_tags:emit_tag(<<"track">>, List).