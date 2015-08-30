-module(nitro_pickle).
-compile(export_all).

pickle(Data) -> base64:encode(term_to_binary({Data, os:timestamp()}, [compressed])).
depickle(PickledData) ->
    try {Data, _PickleTime} = binary_to_term(base64:decode(wf:to_binary(PickledData))), Data
    catch _:_ -> undefined end.
