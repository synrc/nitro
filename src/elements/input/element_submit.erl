-module (element_submit).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#submit.show_if==false -> [<<>>];
render_element(Record) ->
    ID = case Record#submit.id of [] -> nitro:temp_id(); I->I end,
    case Record#submit.postback of
         [] -> skip;
         Postback -> nitro:wire(#event { type=click, 
                                      target=ID,
                                      postback=Postback,
                                      source=Record#submit.source }) end,
    case Record#submit.click of
         [] -> ignore;
         ClickActions -> nitro:wire(#event { target=ID, type=click, actions=ClickActions }) end,
  wf_tags:emit_tag(<<"input">>, [
      {<<"id">>, ID},
      {<<"type">>, <<"submit">>},
      {<<"class">>, Record#submit.class},
      {<<"style">>, Record#submit.style},
      {<<"value">>, Record#submit.body}  | Record#submit.data_fields
  ]).
