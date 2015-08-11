-module(element_textbox).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    List = [
      {<<"id">>, Record#textbox.id},
      {<<"type">>, <<"text">>},
      {<<"maxlength">>,Record#textbox.maxlength},
      {<<"style">>,Record#textbox.style},
      {<<"name">>,Record#textbox.name},
      {<<"placeholder">>,Record#textbox.placeholder},
      {<<"value">>,nitro:js_escape(Record#textbox.value)},
      {<<"disabled">>,Record#textbox.disabled},
      {<<"autofocus">>,Record#textbox.autofocus},
      {<<"class">>,Record#textbox.class} | Record#textbox.data_fields
  ] ++ case Record#textbox.disabled of undefined -> []; _ -> [{<<"disabled">>,<<"disabled">>}] end,
  wf_tags:emit_tag(<<"input">>, nitro:render(Record#textbox.body), List).

