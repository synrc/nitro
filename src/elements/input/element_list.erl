-module(element_list).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#list.show_if==false -> [<<>>];
render_element(Record = #list{}) -> 
  Tag = case Record#list.numbered of true -> <<"ol">>; _ -> <<"ul">> end,

  wf_tags:emit_tag(Tag, nitro:render(Record#list.body), [
    {<<"id">>, Record#list.id},
    {<<"class">>, Record#list.class},
    {<<"style">>, Record#list.style} | Record#list.data_fields
  ]).

