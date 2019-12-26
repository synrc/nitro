-module(element_select).
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#select.show_if==false -> [<<>>];
render_element(Record = #select{}) ->
  ID = case Record#select.id of [] -> nitro:temp_id(); I->I end,
  case Record#select.postback of
    [] -> skip;
    Postback -> nitro:wire(#event{ type=change,
                                target=ID,
                                postback=Postback,
                                source=[nitro:to_atom(ID)|Record#select.source],
                                delegate=Record#select.delegate }) end,
  Props = [
    {<<"id">>, ID},
    {<<"class">>, Record#select.class},
    {<<"style">>, Record#select.style},
    {<<"name">>, Record#select.name},
    {<<"onchange">>, Record#select.onchange},
    {<<"title">>, Record#select.title},
    {<<"required">>, case Record#select.required of true -> <<"required">>; _-> [] end},
    {<<"disabled">>, case Record#select.disabled of true -> <<"disabled">>; _-> [] end},
    {<<"multiple">>, case Record#select.multiple of true -> <<"multiple">>; _-> [] end} | Record#select.data_fields
  ],
  wf_tags:emit_tag(<<"select">>, nitro:render(Record#select.body),
                                  Props);
render_element(Group = #optgroup{}) ->
  wf_tags:emit_tag(<<"optgroup">>, nitro:render(Group#optgroup.body), [
    {<<"disabled">>, case Group#optgroup.disabled of true-> <<"disabled">>; _-> [] end},
    {<<"label">>, Group#optgroup.label}
  ]);
render_element(O = #option{}) ->
  wf_tags:emit_tag(<<"option">>, nitro:render(O#option.body), lists:flatten([get_attrs(O) | O#option.data_fields])).

get_attrs(O) ->
  ValueAttr = case {O#option.selected, O#option.disabled} of
                {true, _} -> <<"selected value">>;
                {true, true} -> <<"selected disabled value">>;
                {_, true} -> <<"disabled value">>;
                _ -> <<"value">>
              end,
  [{<<"id">>, O#option.id},
    {<<"label">>, O#option.label},
    {<<"title">>, O#option.title},
    {ValueAttr, O#option.value}
  ].
