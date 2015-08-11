-module(action_jq).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(Record=#jq{property=undefined,target=Target,method=Methods,args=Args0,format=_F}) ->
    Args = case Record#jq.format of "'~s'" -> [nitro:render(Args0)]; _ -> Args0 end,
    RenderedArgs = string:join([ case A of 
        A when is_tuple(A) -> nitro:render(A);
        A when is_list(A) -> A;
        A when is_integer(A) -> nitro:to_list(A);
        A -> A end || A <- Args],","),
    string:join([ nitro:f("qi('~s').~s("++Record#jq.format++");",
        [nitro:to_list(Target),nitro:to_list(Method),RenderedArgs]) || Method <- Methods],[]);

render_action(#jq{target=T,method=undefined,property=P,args=simple,right=R,format=_F}) ->
    nitro:f("~s.~s = '~s';",
        [nitro:to_list(T),nitro:to_list(P),binary_to_list(iolist_to_binary(nitro:render(R)))]);

render_action(#jq{target=T,method=undefined,property=P,right=undefined}) ->
    nitro:f("qi('~s').~s;", [nitro:to_list(T),nitro:to_list(P)]);

render_action(#jq{target=T,method=undefined,property=P,right=R,format=_F}) ->
    nitro:f("qi('~s').~s = '~s';",
        [nitro:to_list(T),nitro:to_list(P),binary_to_list(iolist_to_binary(nitro:render(R)))]).
