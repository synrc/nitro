-module(element_sortable_item).
-include_lib("nitro/include/sortable_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#sortable_item{list_id = ListId, value = Value, closeable = Close, disabled = Disabled}) ->
  Item = case Disabled of
              true ->
                #panel{
                  class = <<"list__item">>,
                  body = #panel{
                      class = <<"list__item-content">>,
                      style = <<"width:100%">>,
                      body = #panel{ class = <<"list__item-title">>, body = Value}}};
              _ ->
                #panel{
                  class = <<"list__item">>,
                  data_fields = [{<<"data-sortable-item">>,<<"data-sortable-item">>}],
                  body = [
                    case Close of
                      true -> 
                        #panel{
                          class = <<"list__item-close">>,
                          onclick = nitro:jse("removeSortableItem('#" ++ ListId ++ "', this.parentNode);"),
                      _ -> [] end,
                    #panel{
                      class = <<"list__item-content">>,
                      style = case Close of true -> []; _ -> <<"width:100% - 40px">> end,
                      body = #panel{ class = <<"list__item-title">>, body = Value}},
                    #panel{
                      class = <<"list__item-handle">>,
                      data_fields = [{<<"data-sortable-handle">>,<<"data-sortable-handle">>}]}]} end,
  nitro:render(Item).
