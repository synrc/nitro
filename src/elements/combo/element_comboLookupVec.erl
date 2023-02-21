-module(element_comboLookupVec).
-include_lib("nitro/include/comboLookupVec.hrl").
-include_lib("nitro/include/sortable_list.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupVec{id=Id, input=Input, disabled=Disabled, validation=Validation, values=Values}) ->
  ListId = nitro:atom([Id, "list"]),
  InputId = element(#element.id, Input),
  nitro:render(
    #panel{
      id = Id,
      validation = Validation,
      data_fields = [{<<"data-vector-input">>,<<"data-vector-input">>}],
      body = [
        #panel{
          style = "display: flex; width: 100%; justify-content: center;",
          body =
            case Disabled of
              true -> [];
              _ -> Input end },
        % TODO: Add validation for each list_item and/or "+" button
        % TODO?: Maybe show message "Empty list" when Values == []
        #sortable_list{id = ListId, values = Values, closeable = true, disabled = Disabled}]}).
