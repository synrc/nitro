-module(element_comboLookupText).
-include_lib("nitro/include/comboLookupText.hrl").
-include_lib("nitro/include/nitro.hrl").
-export([render_element/1]).

render_element(#comboLookupText{id=Id, input=Input, disabled=Disabled, validation=Validation, textarea=Textarea, values=Values}) ->
  InputId = element(#element.id, Input),
  LookupId = "wrap_" ++ Id ++ "_lookup",
  TextareaId = "wrap_" ++ Id ++ "_textarea",
  WrapId = "wrap_" ++ Id ++ "_comboLookupText",
  TextAreaDisplay =
    case Disabled of
      true -> "flex";
      _ -> "none"
    end,
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
                  _ -> [
                    Input,
                    #link{
                      class = [button, sgreen],
                      style = "min-width: 40px; text-align: center; height: fit-content; margin-left: 5px;",
                      onclick = nitro:jse("displayTextarea('" ++ LookupId ++ "', '" ++ InputId ++ "', '" ++ TextareaId ++ "')"),
                      body = <<"+">>} ] end },
            #panel{
              id = TextareaId,
              style = "width: 100%; justify-content: center; display: " ++ TextAreaDisplay ++ ";",
              body = [
                Textarea |
                case Disabled of
                  true -> [];
                  false ->
                    [#link{
                      class = [button, sgreen, back],
                      style = "min-width: 40px; text-align: center; height: fit-content; margin-left: 5px;",
                      onclick = nitro:jse("hideTextarea('" ++ LookupId ++ "', '" ++ TextareaId ++ "')"),
                      body = <<"+">>}] end]}]}).
