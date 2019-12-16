-module(element_tr).
-include("nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#tr.show_if==false -> [<<>>];
render_element(Record = #tr{postback= Postback}) ->
  Id = case Record#tr.id of [] -> nitro:temp_id(); I->I end,
  Cursor = case Postback of [] -> "";
    P -> nitro:wire(#event {type=click, postback=P, target=Id, delegate=Record#tr.delegate}), "cursor:pointer;"
  end,
  wf_tags:emit_tag(<<"tr">>, nitro:render(Record#tr.cells), [
    {<<"id">>, Id},
    {<<"onclick">>, Record#tr.onclick},
    {<<"class">>, Record#tr.class},
    {<<"onmouseover">>, Record#tr.onmouseover},
    {<<"onmouseout">>, Record#tr.onmouseout},
    {<<"style">>, [Record#tr.style, Cursor]} | Record#tr.data_fields
  ]).
