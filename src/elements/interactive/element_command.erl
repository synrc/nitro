-module(element_command).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#command.show_if==false -> [<<>>];
render_element(Record) ->
    List = [
      %global
      {<<"accesskey">>, Record#command.accesskey},
      {<<"class">>, Record#command.class},
      {<<"contenteditable">>, case Record#command.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#command.contextmenu},
      {<<"dir">>, case Record#command.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#command.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#command.dropzone},
      {<<"hidden">>, case Record#command.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Record#command.id},
      {<<"lang">>, Record#command.lang},
      {<<"spellcheck">>, case Record#command.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#command.style},
      {<<"tabindex">>, Record#command.tabindex},
      {<<"title">>, Record#command.title},
      {<<"translate">>, case Record#command.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},
      % spec
      {<<"disabled">>, if Record#command.disabled == true -> "disabled"; true -> [] end},
      {<<"icon">>, Record#command.icon},
      {<<"label">>, Record#command.label},
      {<<"radiogroup">>, Record#command.radiogroup},
      {<<"type">>, case Record#command.type of "command" -> "command"; "radio" -> "radio"; "checkbox" -> "checkbox"; _ -> [] end} | Record#command.data_fields
    ],
    wf_tags:emit_tag(<<"command">>, List).
