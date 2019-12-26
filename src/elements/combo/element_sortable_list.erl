-module(element_sortable_list).
-include_lib("nitro/include/sortable_list.hrl").
-include_lib("nitro/include/sortable_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#sortable_list{id=Id, values = Values, closeable = Close, disabled = Disabled}) ->
  case Disabled of
    true ->
      Closeable = false;
    _ ->
      nitro:wire("createSortable('#" ++ Id ++ "');"),
      Closeable = Close end,
  
  nitro:render(
    #panel{
      id = Id,
      data_fields = [{<<"data-sortable-list">>, <<"data-sortable-list">>}],
      body = [#sortable_item{
                list_id = Id,
                value = Val,
                closeable = Closeable,
                disabled = Disabled
              } || Val <- Values]}).
