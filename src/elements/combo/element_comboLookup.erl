-module(element_comboLookup).
% -include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1,proto/1,has_function/3]).

proto(#comboKeyup{value=all}=Msg) -> keyUp(Msg);
proto(#comboKeyup{delegate=[]}=Msg) -> keyUp(Msg);
proto(#comboKeyup{delegate=Module}=Msg) ->
  case has_function(Module, keyUp, 1) of 
    true -> Module:keyUp(Msg);
    false -> keyUp(Msg)
  end;
  
proto(#comboSelect{delegate=Module}=Msg) ->
  case has_function(Module, select, 1) of 
    true -> Module:select(Msg);
    false -> skip
  end.


keyUp(#comboKeyup{value=all, dom=Field0, feed=Feed, delegate=Module}) ->
    Field = nitro:to_list(Field0),    
    All = kvs:all(Feed),
    L = length(All),
    nitro:clear(form:atom([comboContainer, Field])),
    dropDownList(All, Field, Module);

keyUp(#comboKeyup{value=Value0, dom=Field0, feed=Feed, delegate=Module}) ->
    Value = string:lowercase(unicode:characters_to_list(Value0)),
    Field = nitro:to_list(Field0),
    All = kvs:all(Feed),
    Index = index(Module),
    nitro:clear(form:atom([comboContainer, Field])),

    Filtered =
      lists:filter(
        fun(X) ->
          lists:any(fun(I) -> 
                              Fld = unicode:characters_to_list(kvs:field(X, I)),
                              Fld /= element(1, X) andalso string:rstr(string:lowercase(Fld), Value) > 0
                    end, Index)
        end,
        All),
 
    dropDownList(Filtered, Field, Module).

dropDownList(Filtered, Field, Module) -> 
  
  io:format("filtered: ~p~n", [Filtered]),
  case Filtered of
    [] -> nitro:display(form:atom([comboContainer, Field]), none);
    _ -> nitro:display(form:atom([comboContainer, Field]), block)
  end,

  SortIndex = sortIndex(Module),
  Sorted = lists:sort(fun(F1, F2) -> kvs:field(F1, SortIndex) >= kvs:field(F2, SortIndex) end, Filtered),

  lists:foreach(
    fun(Obj) ->
     Form = case has_function(Module, dropDown, 2) of  
                true -> Module:dropDown(Obj, Field);
                false -> dropDown(Obj, Field, Module)
             end,
      nitro:insert_top(form:atom([comboContainer, Field]), 
                      nitro:render(Form))
    end, Sorted).

dropDown(Obj, Dom0, Module) ->
  case has_function(Module, dropDown, 3) of 
    true -> Module:dropDown(Obj, Dom0);
    false -> Id = element(2, Obj),
             Dom = nitro:to_list(Dom0),
             Item = nitro:to_list(item(Obj, Module)),
             #panel{
                % id = Id,
                class = ['dropdown-item'],
                onclick = nitro:jse("comboSelect('" ++ Dom ++ "','" ++ Id ++ "')"),
                body = [
                  #p{body = Item}
                ]}
  end.


index([]) -> [name, id];
index(Module) -> case has_function(Module, index, 0) of
                    true -> Module:index();
                    false -> index([])
                  end.


sortIndex([]) -> hd(index([]));
sortIndex(Module) -> case has_function(Module, sortIndex, 0) of
                        true -> Module:sortIndex();
                        false -> hd(index(Module))
                      end.

item(Obj, []) -> kvs:field(Obj, sortIndex([]));                    
item(Obj, Module) -> case has_function(Module, item, 1) of
                      true -> Module:item(Obj);
                      false -> kvs:field(Obj, sortIndex(Module))
                    end.

has_function(M, F, A) ->
  Functions = M:module_info(exports),
  IsF = proplists:get_value(F, Functions, -1),
  IsF == A.



render_element(#comboLookup{id=Id, style=Style, value = Val, feed = Feed, disabled = Disabled, delegate = Module} = _Data) ->
  nitro:render(
    #panel{id=form:atom([lookup, Id]), class=[dropdown],
           body=[#input{id=Id, disabled = Disabled, type="text",
                        onkeyup= nitro:jse("comboLookupKeyup('"++nitro:to_list(Id)++"','"++nitro:to_list(Feed)++"','"++nitro:to_list(Module)++"')"),
                        value = Val,
                        style = Style,
                        class = column},
                 #panel{id=form:atom([comboContainer, Id]), class = ['dropdown-content']}]}).
