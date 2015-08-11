-module(element_td).
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
  wf_tags:emit_tag(<<"td">>, nitro:render(Record#td.body), [
    {<<"id">>, Record#td.id},
    {<<"class">>, Record#td.class},
    {<<"style">>, Record#td.style},
    {<<"rowspan">>, Record#td.rowspan},
    {<<"colspan">>, Record#td.colspan},
    {<<"scope">>, Record#td.scope} | Record#td.data_fields
  ]).
