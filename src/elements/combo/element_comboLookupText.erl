-module(element_comboLookupText).
-include_lib("nitro/include/comboLookupText.hrl").
-include_lib("nitro/include/nitro.hrl").
-export([render_element/1]).

render_element(#comboLookupText{id=Id, input=Input, disabled=Disabled, validation=Validation, textarea=Textarea, values=Values}) ->
  InputId = element(#element.id, Input),
  LookupId = "wrap_" ++ Id ++ "_lookup",
  TextareaId = "wrap_" ++ Id ++ "_textarea",
  WrapId = "wrap_" ++ Id ++ "_comboLookupText",
  nitro:render(
        #panel{
          id = WrapId,
          validation = Validation,
          data_fields = [{<<"data-text-input">>,<<"data-text-input">>}],
          body = [
            #panel{
              id = LookupId,
              style = "display: flex; width: 100%; justify-content: center;",
              body =
                case Disabled of
                  true -> [];
                  _ -> [Input]
                end},
            #panel{
              id = TextareaId,
              style = "display: flex; width: 100%; justify-content: center;",
              body = [Textarea]}]}).
