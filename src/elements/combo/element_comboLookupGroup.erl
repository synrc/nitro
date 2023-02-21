-module(element_comboLookupGroup).
-include_lib("nitro/include/comboLookupGroup.hrl").
-include_lib("nitro/include/comboLookupGroup_list.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupGroup{id = Id, input = Input, disabled = Disabled, validation = Validation, values = Values, subtitle = Subtitle, delegate = Delegate}) ->
  ProtoItem = #comboLookupGroup_list{disabled = Disabled, subtitle = Subtitle, delegate = Delegate},
  nitro:render(
    #panel{
      id = Id,
      validation = Validation,
      data_fields = [{<<"data-group-input">>, <<"data-group-input">>}],
      body = lists:flatten([
        case Disabled of true -> []; _ -> Input end,
        ProtoItem#comboLookupGroup_list{id = nitro:atom([Id, "draft"]), group = draft},
        [ProtoItem#comboLookupGroup_list{id = nitro:atom([Id, erp:guid()]), values = Val, group = saved} || Val <- Values]
      ])
    }
  ).
