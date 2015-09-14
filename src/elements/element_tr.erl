-module(element_tr).
-include("nitro.hrl").
-compile(export_all).

render_element(Record = #tr{postback= Postback}) ->
  Id = case Record#tr.id of undefined -> nitro:temp_id(); I->I end,
  Cursor = case Postback of undefined -> "";
    P -> nitro:wire(#event {type=click, postback=P, target=Id, delegate=Record#tr.delegate}), "cursor:pointer;"
  end,
  wf_tags:emit_tag(<<"tr">>, nitro:render(Record#tr.cells), [
    {<<"id">>, Id},
    {<<"class">>, Record#tr.class},
    {<<"style">>, [Record#tr.style, Cursor]} | Record#tr.data_fields
  ]).
