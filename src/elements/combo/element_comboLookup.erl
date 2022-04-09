-module(element_comboLookup).
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/nitro.hrl").
-export([render_element/1,proto/1]).

proto(#comboKey{delegate=Module}=Msg)    -> Module:proto(Msg);
proto(#comboKeyup{delegate=Module}=Msg)  -> Module:proto(Msg);
proto(#comboSelect{delegate=Module}=Msg) -> Module:proto(Msg);
proto(#comboScroll{delegate=Module}=Msg) -> Module:proto(Msg);
proto(#comboInsert{delegate=Module}=Msg) -> Module:proto(Msg);
proto(#comboAdd{delegate=Module}=Msg)    -> Module:proto(Msg);
proto(#comboModify{delegate=Module}=Msg) -> Module:proto(Msg).

render_element(#comboLookup{id=Id, style=Style, value = Val, bind = Object,
  feed = Feed, disabled = Disabled, delegate = Module, class = Class, nested = Nested} = Data) ->
  Uid = nitro_pi:uid([], []),
  DataNested = case Nested of [] -> []; _ -> [{<<"nested">>, Nested}] end,
  DataBind = case Object of [] -> []; _ -> [{<<"data-bind">>, base64:encode(term_to_binary(Object))}] end,
  nitro:render(
    #panel{id=form:atom([lookup, Id]), class=lists:flatten([dropdown, Class]),
           body=[#input{id=Id, disabled = Disabled, type="comboLookup",
                        autocomplete = "off",
                        data_fields = DataNested ++ DataBind,
                        onkeyup = nitro:jse("comboLookupKeyup('"
                               ++ nitro:to_list(Uid) ++ "','"
                               ++ nitro:to_list(Id) ++ "','"
                               ++ nitro:to_list(Feed) ++ "','"
                               ++ nitro:to_list(Module) ++ "')"),
                        onkeydown= nitro:jse("comboLookupKeydown('"
                               ++ nitro:to_list(Uid) ++ "','"
                               ++ nitro:to_list(Id) ++ "','"
                               ++ nitro:to_list(Feed) ++ "','"
                               ++ nitro:to_list(Module) ++ "')"),
                        onchange= nitro:jse("comboLookupChange('"
                               ++ nitro:to_list(Id) ++ "')"),
                        bind = Object,
                        value = Val, style = Style, class = column},
                 #panel{class=['triangle'],
                        body="&blacktriangledown;",
                        onclick =
                          case Disabled of
                            true -> [];
                            _ -> nitro:jse("comboLookupClick('"
                              ++ nitro:to_list(Uid) ++ "','"
                              ++ nitro:to_list(Id) ++ "','"
                              ++ nitro:to_list(Feed) ++ "','"
                              ++ nitro:to_list(Module) ++ "')")
                          end},
                 #panel{id=form:atom([comboContainer, Id]),
                        class = ['dropdown-content']},
                 case Disabled of
                   true -> [];
                   false -> #link{class = [button, sgreen, 'delete-btn'],
                                  style = "min-width: 40px; text-align: center; height: fit-content; margin-left: 5px;",
                                  onclick = nitro:jse("clearInput('" ++ Id ++ "')"),
                                  body = <<"">>} end]}).
