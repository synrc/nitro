-module(action_bind).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

-define(B(E), nitro:to_binary(E)).
-define(T(T), wf_event:target(T)).

render_action(#bind{postback=Code,target={g,_}=Control,type=Type,source=Src}) ->
    % rebind same control to same handler on same target
    G = ?T(Control), V = ?B(Src), E = ?B(Type),

    ["{ if('",V,"' in ",G,"){",G,".removeEventListener('",E,"',",V,");delete ",G,"[",V,"]};",
        V,"={handleEvent:(event) => { if(event.type === '",E,"'){",?B(Code),"}}};",
        G,".addEventListener('",E,"',", V,");", G,".",V,"=",V,";}"];
render_action(#bind{postback=Code,target=Control,type=Type}) ->
    ["{var x=",?T(Control),"; x && x.addEventListener('",?B(Type),"',function(event){",?B(Code),"});}"].
