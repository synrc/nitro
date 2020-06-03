-module(element_form).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#form.show_if==false -> [<<>>];
render_element(Record) ->
    ID = case Record#form.id of [] -> nitro:temp_id(); I->I end,
    case Record#form.postback of
         [] -> skip;
         Postback -> nitro:wire(#event { type=submit,
                                         target=ID,
                                         postback=Postback,
                                         delegate=Record#form.delegate,
                                         source=Record#form.source }) end,
    List = [
      %global
      {<<"accesskey">>, Record#form.accesskey},
      {<<"class">>, Record#form.class},
      {<<"contenteditable">>, case Record#form.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#form.contextmenu},
      {<<"dir">>, case Record#form.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#form.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#form.dropzone},
      {<<"hidden">>, case Record#form.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, ID},
      {<<"lang">>, Record#form.lang},
      {<<"spellcheck">>, case Record#form.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#form.style},
      {<<"tabindex">>, Record#form.tabindex},
      {<<"title">>, Record#form.title},
      {<<"translate">>, case Record#form.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},
      % spec
      {<<"accept-charset">>, Record#form.accept_charset},
      {<<"action">>, Record#form.action},
      {<<"autocomplete">>, case Record#form.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"enctype">>, case Record#form.enctype of "application/x-www-form-urlencoded" -> "application/x-www-form-urlencoded"; "multipart/form-data" -> "multipart/form-data"; "text/plain" -> "text/plain"; _ -> [] end},
      {<<"method">>, case Record#form.method of "post" -> "post"; _ -> "get" end},
      {<<"name">>,Record#form.name},
      {<<"novalidate">>, case Record#form.novalidate of true -> "novalidate"; _ -> [] end},
      {<<"target">>, Record#form.target} | Record#form.data_fields
    ],
    wf_tags:emit_tag(<<"form">>, nitro:render(Record#form.body), List).