-module(action_bind).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

-define(B(E), nitro:to_binary(E)).
-define(T(T), wf_event:target(T)).

render_action(#bind{postback=Code,target=Control,type=Type}) ->
    ["{var x=",?T(Control),"; x && x.addEventListener('",?B(Type),"',function(event){",?B(Code),"});}"].
