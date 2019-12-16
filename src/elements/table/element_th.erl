-module(element_th).
-include("nitro.hrl").
-compile(export_all).

render_element(Record) when Record#th.show_if==false -> [<<>>];
render_element(Record) ->
  wf_tags:emit_tag(<<"th">>, nitro:render(Record#th.body), [
    {<<"id">>, Record#th.id},
    {<<"class">>, Record#th.class},
    {<<"style">>, Record#th.style},
    {<<"rowspan">>, Record#th.rowspan},
    {<<"colspan">>, Record#th.colspan},
    {<<"scope">>, Record#th.scope} | Record#th.data_fields
  ]).
