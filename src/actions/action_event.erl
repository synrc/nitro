-module(action_event).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#event{source=undefined}) -> [];

render_action(#event{postback={bin,Value},target=Control,type=Type}) ->
    PostbackBin = wf_event:new(bin,Value),
    [list_to_binary([<<"qi('">>,nitro:to_binary(Control),<<"').addEventListener('">>,
        nitro:to_binary(Type),<<"',function (event){">>,PostbackBin,<<"});">>])];

render_action(#event{postback=Postback,actions=_Actions,source=Source,target=Control,type=Type,delegate=Delegate}) ->
    Element = nitro:to_list(Control),
    Data=list_to_binary([<<"[tuple(tuple(utf8_toByteArray('">>,Element,<<"'),bin('detail')),event.detail)">>,
         [ begin {SrcType,Src2}=case is_atom(Src) of
                 true -> { <<"atom">>,atom_to_list(Src) };
                 false -> { <<"utf8_toByteArray">>,Src } end,
             [ <<",tuple(">>,SrcType,<<"('">>,Src2,<<"'),querySource('">>,Src2,<<"'))">> ]
             end || Src <- Source ],<<"]">>]),
    PostbackBin = wf_event:new(Postback, Element, Delegate, event, Data, Source),
    [list_to_binary([<<"{var x=qi('">>,Element,<<"'); x && x.addEventListener('">>,
        nitro:to_binary(Type),<<"',function (event){">>,
        PostbackBin,<<"});};">>])].
