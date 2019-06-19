-module(element_legend).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#legend.show_if==false -> [<<>>];
render_element(Record) -> 
  wf_tags:emit_tag(<<"legend">>, nitro:render(Record#legend.body), [
    {<<"id">>, Record#legend.id},
    {<<"class">>, Record#legend.class},
    {<<"style">>, Record#legend.style} | Record#legend.data_fields
  ]).
