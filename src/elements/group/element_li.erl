-module(element_li).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#li.show_if==false -> [<<>>];
render_element(Record) -> 
  wf_tags:emit_tag(<<"li">>, nitro:render(Record#li.body), [
    {<<"class">>, Record#li.class},
    {<<"id">>, Record#li.id},
    {<<"style">>, Record#li.style} | Record#li.data_fields
  ]).
