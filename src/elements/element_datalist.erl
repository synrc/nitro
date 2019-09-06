-module(element_datalist).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #datalist{}) ->
  ID = case Record#datalist.id of undefined -> nitro:temp_id(); I->I end,
  case Record#datalist.postback of
    undefined -> skip;
    Postback -> nitro:wire(#event{ type=change,
                                target=ID,
                                postback=Postback,
                                source=[nitro:to_atom(ID)],
                                delegate=Record#datalist.delegate }) end,
  Props = [
    {<<"id">>, ID},
    {<<"class">>, Record#datalist.class},
    {<<"style">>, Record#datalist.style},
%    {<<"name">>, Record#datalist.name},
    {<<"onchange">>, Record#datalist.onchange},
    {<<"title">>, Record#datalist.title},
    {<<"required">>, case Record#datalist.required of true -> <<"required">>; _-> undefined end}
%    {<<"disabled">>, case Record#datalist.disabled of true -> <<"disabled">>; _-> undefined end}
    | Record#datalist.data_fields
  ],
  wf_tags:emit_tag(<<"datalist">>, nitro:render(Record#datalist.body),
                                  Props).

