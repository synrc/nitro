-ifndef(NITRO_PI).
-define(NITRO_PI, true).

-include("n2o_core.hrl").
-include("n2o.hrl").

-spec start(#pi{}) -> {pid(),term()} | #error{}.
-spec stop(term(),atom()) -> #pi{} | #error{}.

-endif.
