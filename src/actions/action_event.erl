-module(action_event).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#event{source=undefined}) -> [];
render_action(#event{postback=Postback,actions=_Actions,source=Source,target=Control,type=Type,delegate=Delegate,validation=Validation}) ->
    Element = nitro:to_list(Control),
    Data=list_to_binary([<<"[tuple(tuple(utf8_toByteArray('">>,Element,<<"'),bin('detail')),[])">>,
         [ begin {SrcType,Src2}=case is_atom(Src) of
                 true -> { <<"atom">>,atom_to_list(Src) };
                 false -> { <<"utf8_toByteArray">>,Src } end,
             [ <<",tuple(">>,SrcType,<<"('">>,Src2,<<"'),querySource('">>,Src2,<<"'))">> ]
             end || Src <- Source ],<<"]">>]),
    PostbackBin = wf_event:new(Postback, Element, Delegate, event, Data, Source, Validation),
    [list_to_binary([<<"{ var x=qi('">>,Element,<<"'); x && x.addEventListener('">>,
        nitro:to_binary(Type),<<"',function (event){ ">>,
        PostbackBin,<<"});};">>])].
