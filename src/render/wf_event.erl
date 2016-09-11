-module(wf_event).
-author('Maxim Sokhatsky').
-author('Andrey Martemyanov').
-include_lib ("nitro/include/nitro.hrl").
-compile(export_all).

-record(ev, { module, msg, trigger, name }).
-record(cx, { handlers, actions, req, module, lang, path, session, formatter, params, form, state=[] }).
-define(CTX, (get(context))).

-define(B(E), nitro:to_binary(E)).
target({qs,S}) -> ["qs('",S,"')"];
target(Id)     -> ["qi('",?B(Id),"')"].

new(P,E,D,N,Data,Source) -> new(P,E,D,N,Data,Source,<<>>).

new(bin,Data) -> <<"ws.send(enc(tuple(atom('bin'),bin('",(nitro:pickle(Data))/binary,"'))));">>.
new(undefined, _, _, _, _, _, _) -> <<>>;
new(Postback, Element, Delegate, Name, Data, Source, Validation) ->
    Module = nitro:coalesce([Delegate, ?CTX#cx.module]),
    Join=fun([]) -> [];
           ([E]) -> [$'|E]++[$'];
         ([H|T]) -> [[$'|H]++[$']] ++ [ [$,,$'|E]++[$'] || E <- T ] end,
    Event = #ev{name=Name, module=Module, msg=Postback, trigger=Element},
    list_to_binary(["{ if (validateSources([",Join([ nitro:to_list(S) || S <- Source, S =/= []]),
        "])) { ",?B(Validation)," ws.send(enc(tuple(atom('",?B(application:get_env(n2o,event,pickle)),"'),bin('",
        Element,"'),bin('",nitro:pickle(Event),"'),",Data,"))); } else console.log('Validation Error'); }"]).