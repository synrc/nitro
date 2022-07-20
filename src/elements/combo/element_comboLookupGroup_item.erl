-module(element_comboLookupGroup_item).
-include_lib("nitro/include/comboLookupGroup_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupGroup_item{value = Value, bind = Bind, group = Group}) ->
  nitro:render(
    #panel{
      class = <<"group-list__item">>,
      data_fields = lists:flatten([
        {<<"data-group-item">>, <<"data-group-item">>},
        case Bind of [] -> []; _ -> {<<"data-bind">>, base64:encode(term_to_binary(Bind))} end
      ]),
      body = lists:flatten([
        #panel{class = <<"group-list__item-content">>, body = Value},
        case Group of draft -> #button{class = [<<"button">>, <<"group-button__delete">>], onclick = nitro:jse("this.parentNode.remove();")}; _ -> [] end
      ])
    }
  ).