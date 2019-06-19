-module(element_dtl).
-author('Maxim Sokhatsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) when Record#dtl.show_if==false -> [<<>>];
render_element(Record=#dtl{}) ->
    M = list_to_atom(nitro:to_list(Record#dtl.file) ++ "_view"),
    %File = case code:lib_dir(nitro:to_atom(Record#dtl.app)) of
                %{error,bad_name} -> nitro:to_list(Record#dtl.app);
                %A -> A end ++ "/" ++ nitro:to_list(Record#dtl.folder)
         %++ "/" ++ nitro:to_list(Record#dtl.file) ++ "." ++ nitro:to_list(Record#dtl.ext),
    {ok,R} = render(M, Record#dtl.js_escape, [{K,nitro:render(V)} || {K,V} <- Record#dtl.bindings] ++
        if Record#dtl.bind_script==true -> [{script,nitro:script()}]; true-> [] end),
    R.

render(M, true, Args) ->
    {ok, R} = M:render(Args),
    {ok, nitro:js_escape(R)};
render(M, _, Args) -> M:render(Args).
