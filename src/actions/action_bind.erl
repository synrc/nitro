-module(action_bind).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#bind{postback=Code,target=Control,type=Type}) ->
    [list_to_binary(nitro:f("{ var x=qi('~w'); if(x)x.addEventListener('~w', function(e) { ~s }); }",[Control,Type,Code]))].
