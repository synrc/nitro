-module(element_comboLookupModify_item).
-include_lib("nitro/include/comboLookupModify_item.hrl").
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#comboLookupModify_item{list_id = ListId, value = Value, bind = OldBind, pos = Pos, feed = Feed, delegate = Module, default = Default, disabled = Disabled}) ->
  Id = form:atom([ListId, erp:guid()]),
  Close =
    case Disabled of
      true -> [];
      _ -> #panel{class = <<"modify_item-close">>, onclick = nitro:jse("this.parentNode.remove();")}
    end,
  {Bind, SelectedBind} =
    case element(Pos, OldBind) of
      [] -> {setelement(Pos, OldBind, Default), Default};
      X -> {OldBind, X}
    end,
  SelectedValue =
    case erlang:function_exported(Module, view_value, 1) of
      true -> apply(Module, view_value, [SelectedBind]);
      false -> []
    end,
  nitro:render(
    #panel{
      id = Id,
      class = <<"modify_item">>,
      data_fields = [{<<"data-bind">>, base64:encode(term_to_binary(Bind))}],
      body = [
        #panel{class = <<"modify_item-title">>, body = Value},
        Close,
        #comboLookup{id = form:atom([Id, "input"]), feed = Feed, delegate = Module, value = SelectedValue, bind = SelectedBind, nested = Id, disabled = Disabled}
      ]
    }
  ).

