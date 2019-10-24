-module(element_td).
-include("nitro.hrl").
-compile(export_all).

render_element(Record) when Record#td.show_if==false -> [<<>>];
render_element(Record) ->
  wf_tags:emit_tag(<<"td">>, nitro:render(Record#td.body), [
    {<<"id">>, Record#td.id},
    {<<"class">>, Record#td.class},
    {<<"style">>, Record#td.style},
    {<<"onclick">>, Record#td.onclick},
    {<<"rowspan">>, Record#td.rowspan},
    {<<"bgcolor">>, Record#td.bgcolor},
    {<<"colspan">>, Record#td.colspan},
    {<<"scope">>, Record#td.scope} | Record#td.data_fields
  ]).
