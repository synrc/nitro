-module(element_dropdown).
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#dropdown.show_if==false -> [<<>>];
render_element(Record = #dropdown{}) -> 
    ID = case Record#dropdown.id of [] -> nitro:temp_id(); I->I end,
    case Record#dropdown.postback of
         [] -> skip;
         Postback -> nitro:wire(#event { type=change, postback=Postback, target=ID,
                        source=Record#dropdown.source, delegate=Record#dropdown.delegate } ) end,

    Opts = [wf_tags:emit_tag(<<"option">>, [O#option.label], [
      {<<"disabled">>, O#option.disabled},
      {<<"label">>, O#option.label},
      {<<"selected">>, case O#option.selected of true -> <<"selected">>; _-> [] end},
      {<<"value">>, O#option.value}
    ])|| O = #option{show_if=Visible} <- Record#dropdown.options, Visible == true],

    wf_tags:emit_tag(<<"select">>, Opts, [
        {<<"id">>, Record#dropdown.id},
        {<<"class">>, Record#dropdown.class},
        {<<"style">>, Record#dropdown.style},
        {<<"name">>, Record#dropdown.name},
        {<<"disabled">>, case Record#dropdown.disabled of true -> <<"disabled">>; _-> [] end},
        {<<"multiple">>, case Record#dropdown.multiple of true -> <<"multiple">>; _-> [] end}|
        Record#dropdown.data_fields
    ]).
