-module(element_comboLookupEdit).
-include_lib("nitro/include/comboLookupEdit.hrl").
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/sortable_list.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupEdit{id=Id, input=Input, disabled=Disabled, validation=Validation, form=Form, values=Values, multiple=Multiple}) ->
  ListId = form:atom([Id, "list"]),
  InputId = element(#element.id, Input),
  nitro:render(
    #panel{
      id = Id,
      validation = Validation,
      data_fields = [{<<"data-edit-input">>,<<"data-edit-input">>}],
      body = [
        #panel{
          style = "display: flex; position: relative; width: 100%; justify-content: center;",
          body =
            [ Input,
              case Multiple of
                true ->
                  #link{
                    class = [button, sgreen, 'add-btn'],
                    style = "min-width: 40px; text-align: center; height: fit-content; margin-left: 5px;",
                    onclick = nitro:jse("addSortableItemFrom('#" ++ ListId ++ "', '" ++ InputId ++ "')"),
                    body = <<"+">>};
                false -> []
              end,
              case Disabled of
                true -> [];
                _ ->
                  #panel{
                    id = form:atom([InputId, "form"]),
                    class = ['dropdown-content', 'dropdown-content-form'],
                    body = #panel{class = ['dropdown-item'], body = Form}
                  } end ]},
            case Multiple of
              true -> #sortable_list{id = ListId, values = Values, closeable = true, disabled = Disabled};
              false -> []
            end ]}).
