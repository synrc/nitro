-module(element_comboLookupModify).
-include_lib("nitro/include/comboLookupModify.hrl").
-include_lib("nitro/include/comboLookupModify_item.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupModify{id = Id, input = Input, disabled = Disabled, validation = Validation, values = Values,
  modify_pos = Pos, modify_feed = Feed, modify_module = Module, modify_default = Default}) ->
  ListId = form:atom([Id, "list"]),
  InputId = element(#element.id, Input),
  InputBody =
    case Disabled of
      true -> [];
      _ ->
        #panel{
          body = [
            Input,
            #link{class = 'add-btn', onclick = nitro:jse("comboLookupModifyAdd('" ++ ListId ++ "', '" ++ InputId ++ "');")}
          ]
        }
    end,
  ProtoItem = #comboLookupModify_item{list_id = ListId, pos = Pos, feed = Feed, delegate = Module, default = Default, disabled = Disabled},
  ListBody =
    case Values of
      {view_value_pairs, X} -> [ProtoItem#comboLookupModify_item{value = Value, bind = Bind} || {Value, Bind} <- X];
      _ -> [ProtoItem#comboLookupModify_item{value = X} || X <- Values]
    end,
  nitro:render(
    #panel{
      id = Id,
      data_fields = [{<<"data-modify-input">>, <<"data-modify-input">>}],
      validation = Validation,
      body = [
        InputBody,
        #panel{
          id = ListId,
          data_fields = [
            {<<"data-modify-list">>, <<"data-modify-list">>},
            {<<"data-pos">>, base64:encode(term_to_binary(Pos))},
            {<<"data-feed">>, base64:encode(term_to_binary(Feed))},
            {<<"data-delegate">>, base64:encode(term_to_binary(Module))},
            {<<"data-default">>, base64:encode(term_to_binary(Default))}
          ],
          body = ListBody
        }
      ]
    }
  ).
