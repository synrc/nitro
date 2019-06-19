-module(element_textbox).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#textbox.show_if==false -> [<<>>];
render_element(Record) -> 
    List = [
      {<<"id">>, Record#textbox.id},
      {<<"type">>, <<"text">>},
      {<<"maxlength">>,Record#textbox.maxlength},
      {<<"style">>,Record#textbox.style},
      {<<"name">>,Record#textbox.name},
      {<<"placeholder">>,Record#textbox.placeholder},
      {<<"value">>, Record#textbox.value},
      {<<"disabled">>,Record#textbox.disabled},
      {<<"autofocus">>,Record#textbox.autofocus},
      {<<"readonly">>,if Record#textbox.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#textbox.required == true -> "required"; true -> [] end}, 
      {<<"class">>,Record#textbox.class} | Record#textbox.data_fields
  ] ++ case Record#textbox.disabled of [] -> []; _ -> [{<<"disabled">>,<<"disabled">>}] end,
  wf_tags:emit_tag(<<"input">>, nitro:render(Record#textbox.body), List).

