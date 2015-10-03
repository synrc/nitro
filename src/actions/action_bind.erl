-module(action_bind).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#bind{postback=Code,target=Control,type=Type}) ->
    [list_to_binary(nitro:f("{ var x=qi('~s'); if(x)x.addEventListener('~s', function(e) { ~s }); }",[Control,Type,Code]))].
