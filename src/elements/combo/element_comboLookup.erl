-module(element_comboLookup).
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/nitro.hrl").
-export([render_element/1,proto/1]).

proto(#comboKey{delegate=Module}=Msg)    -> Module:proto(Msg);
proto(#comboKeyup{delegate=Module}=Msg)  -> Module:proto(Msg);
proto(#comboSelect{delegate=Module}=Msg) -> Module:proto(Msg).

render_element(#comboLookup{id=Id, style=Style, value = Val, bind = Object0,
  feed = Feed, disabled = Disabled, delegate = Module} = Data) ->
  Object = case Object0 of 
              [] -> [];
              _ -> base64:encode(term_to_binary(Object0))
         end,
  nitro:render(
    #panel{id=form:atom([lookup, Id]), class=[dropdown],
           body=[#input{id=Id, disabled = Disabled, type="comboLookup",
                        onkeyup = nitro:jse("comboLookupKeyup('"
                               ++ nitro:to_list(Id) ++ "','"
                               ++ nitro:to_list(Feed) ++ "','"
                               ++ nitro:to_list(Module) ++ "')"),
                        onkeydown= nitro:jse("comboLookupKeydown('"
                               ++ nitro:to_list(Id) ++ "','"
                               ++ nitro:to_list(Feed) ++ "','"
                               ++ nitro:to_list(Module) ++ "')"),
                        onchange= nitro:jse("comboLookupChange('"
                               ++ nitro:to_list(Id) ++ "')"),
                        bind = Object,
                        value = nitro:jse(Val), style = Style, class = column},
                 #panel{id=form:atom([comboContainer, Id]),
                        class = ['dropdown-content']}]}).

