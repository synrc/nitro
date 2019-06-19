-module(element_menu).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#menu.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#menu.accesskey},
      {<<"class">>, Record#menu.class},
      {<<"contenteditable">>, case Record#menu.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#menu.contextmenu},
      {<<"dir">>, case Record#menu.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#menu.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#menu.dropzone},
      {<<"hidden">>, case Record#menu.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#menu.id},
      {<<"lang">>, Record#menu.lang},
      {<<"spellcheck">>, case Record#menu.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#menu.style},
      {<<"tabindex">>, Record#menu.tabindex},
      {<<"title">>, Record#menu.title},
      {<<"translate">>, case Record#menu.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"label">>, Record#menu.label},
      {<<"type">>, case Record#menu.type of "toolbar" -> "toolbar"; "context" -> "context"; _ -> [] end} | Record#menu.data_fields
    ],
    wf_tags:emit_tag(<<"menu">>, nitro:render(case Record#menu.body of [] -> []; B -> B end), List).