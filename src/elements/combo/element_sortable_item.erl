-module(element_sortable_item).
-include_lib("nitro/include/sortable_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#sortable_item{list_id = ListId, value = Value, closeable = Close}) ->
  nitro:render(#panel{
                class = <<"list__item">>,
                data_fields = [{<<"data-sortable-item">>,<<"data-sortable-item">>}],
                body = [
                  case Close of
                    true -> 
                      #panel{
                        class = <<"list__item-close">>,
                        onclick = nitro:jse("removeSortableItem('#" ++ ListId ++ "', this.parentNode);"),
                        data_fields = [{<<"data-sortable-close">>,<<"data-sortable-close">>}]
                      };
                    _ ->
                      #panel{
                        style = <<"position:relative;width:40px">>
                      }
                    end,
                  #panel{
                    class = <<"list__item-content">>,
                    body = [
                      #panel{
                        class = <<"list__item-title">>,
                        body = Value
                      }
                    ]
                  },
                  #panel{
                    class = <<"list__item-handle">>,
                    data_fields = [{<<"data-sortable-handle">>,<<"data-sortable-handle">>}]
                  }
                ]
              }).
