-module(action_event).

-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#event{source=undefined}) -> [];
render_action(#event{postback=Postback,actions=_A,source=Source,target=Control,type=Type,delegate=D,validation=V}) ->
    Element = nitro:to_list(Control),
    ValidationSource = [ S || S <- Source, not is_tuple(S) ],
    PostbackBin = wf_event:new(Postback, Element, D, event, data(Element,Source), ValidationSource, V),
    [list_to_binary([<<"{ var x=qi('">>,Element,<<"'); x && x.addEventListener('">>,
        nitro:to_binary(Type),<<"',function (event){ ">>,
        PostbackBin,<<"});};">>])].

data(Element,SourceList) ->
    Type=fun(A) when is_atom(A) -> [ "atom('",atom_to_list(A),"')" ]; (A) -> [ "utf8_toByteArray('",A,"')" ] end,
    list_to_binary([<<"[tuple(tuple(utf8_toByteArray('">>,Element,<<"'),bin('detail')),[])">>,
        [ begin case S of
                {Id,JsGetCode} -> [ ",tuple(",Type(Id),",",JsGetCode,")" ];
                _ -> [ ",tuple(",Type(S),",querySource('",nitro:to_list(S),"'))" ]
            end end || S <- SourceList ], <<"]">>]).
