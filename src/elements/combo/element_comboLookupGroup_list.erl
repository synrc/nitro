-module(element_comboLookupGroup_list).
-include_lib("nitro/include/comboLookupGroup_list.hrl").
-include_lib("nitro/include/comboLookupGroup_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupGroup_list{disabled = true, group = draft}) -> [];
render_element(#comboLookupGroup_list{id = Id, values = Values, subtitle = Subtitle, group = Group, delegate = Delegate, disabled = Disabled}) ->
  ProtoItem = #comboLookupGroup_item{group = Group},
  Click = nitro:jse("comboLookupGroupDraft('" ++ nitro:to_list(Id) ++ "', '" ++ nitro:to_list(Group) ++ "', '" ++ nitro:to_list(Subtitle) ++ "', '" ++ nitro:to_list(Delegate) ++ "');"),
  Drag =
    case Group of
      draft -> [];
      _ when not Disabled -> [
        {<<"draggable">>, <<"true">>},
        {<<"ondragstart">>, <<"groupListDrag(event)">>},
        {<<"ondrop">>, <<"groupListDrop(event)">>},
        {<<"ondragover">>, <<"groupListAllowDrop(event)">>}
      ];
      _ -> []
    end,
  Control =
    case Group of
      draft -> [
        #panel{class = <<"group-list__label">>, body = Subtitle},
        #button{class = [<<"button">>, <<"group-button__confirm">>], onclick = Click}
      ];
      _ when not Disabled -> [
        #button{class = [<<"button">>, <<"group-button__edit">>], onclick = Click},
        #button{class = [<<"button">>, <<"group-button__delete">>], onclick = nitro:jse("this.parentNode.remove();")}
      ];
      _ -> []
    end,
  Body =
    case Values of
      {view_value_pairs, List} -> [ProtoItem#comboLookupGroup_item{value = Val, bind = Bind} || {Val, Bind} <- List];
      _ -> [ProtoItem#comboLookupGroup_item{value = Val} || Val <- Values]
    end,
  nitro:render(
    #panel{
      id = Id,
      class = case Group of draft -> <<"group-list__draft">>; _ -> <<"group-list__saved">> end,
      data_fields = lists:flatten([
        {<<"data-group-list">>, Group},
        Drag
      ]),
      body = lists:flatten([Control, Body])
    }
  ).