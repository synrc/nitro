-ifndef(NITRO_PROTO_HRL).
-define(NITRO_PROTO_HRL, true).

-record(client,  { data=[] }).
-record(server,  { data=[] }).
-record(init,    { token=[] }).
-record(pickle,  { source=[], pickled=[], args=[] }).
-record(flush,   { data=[] }).
-record(direct,  { data=[] }).
-record(ev,      { module=[], msg=[], trigger=[], name=[] }).

-endif.