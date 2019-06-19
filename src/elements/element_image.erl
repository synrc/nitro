-module(element_image).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#image.show_if==false -> [<<>>];
render_element(Record) ->
  Attributes = [
    {<<"id">>, Record#image.id},
    {<<"class">>, Record#image.class},
    {<<"title">>, Record#image.title},
    {<<"style">>, Record#image.style},
    {<<"alt">>, Record#image.alt},
    {<<"width">>, Record#image.width},
    {<<"height">>, Record#image.height},
    {<<"src">>, nitro:coalesce([Record#image.src, Record#image.image])} | Record#image.data_fields
  ],

  wf_tags:emit_tag(<<"img">>, Attributes).
