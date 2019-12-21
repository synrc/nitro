-module(element_sortable_list).
-include_lib("nitro/include/sortable_list.hrl").
-include_lib("nitro/include/sortable_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#sortable_list{id=Id, values = Values, closeable = Close}) ->
  nitro:wire("createSortable('#" ++ Id ++ "');"),
  nitro:render(
    #panel{
      id = Id,
      data_fields = [{<<"data-sortable-list">>, <<"data-sortable-list">>}],
      body = [#sortable_item{list_id = Id, value = Val, closeable = Close} || Val <- Values]}).
