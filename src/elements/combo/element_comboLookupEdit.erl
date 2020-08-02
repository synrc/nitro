-module(element_comboLookupEdit).
-include_lib("nitro/include/comboLookupEdit.hrl").
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupEdit{id=Id, input=Input, disabled=Disabled, validation=Validation, form=Form}) ->
  InputId = element(#element.id, Input),
  nitro:render(
    #panel{
      id = Id,
      body = [
        #panel{
          style = "display: flex; position: relative; width: 100%; justify-content: center;",
          body =
            case Disabled of
              true -> [];
              _ ->
                [ Input,
                  #panel{
                    id = form:atom([InputId, "form"]),
                    class = ['dropdown-content'],
                    body = #panel{class = ['dropdown-item'], body = Form}
                  }] end }
        ]}).