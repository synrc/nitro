-ifndef(N2O_HRL).
-define(N2O_HRL, true).

-define(FORMAT(F), case F of F when is_binary(F) -> binary_to_list(F);
                             F when is_atom(F) -> atom_to_list(F);
                             F when is_list(F) -> F end).

-ifdef(OTP_RELEASE).
-include_lib("kernel/include/logger.hrl").
-else.
-define(LOG_INFO(F), io:format(?FORMAT(F)) end).
-define(LOG_INFO(F,X), io:format(?FORMAT(F),X)).
-define(LOG_ERROR(F), io:format("{~p,~p}: ~p~n", [?MODULE,?LINE,F])).
-define(LOG_ERROR(F,X), io:format(?FORMAT(F),X)).
-endif.

-define(LOG_EXCEPTION(E,R,S), ?LOG_ERROR(#{exception => E, reason => R, stack => S})).

-record(pi, { name     :: term(),
              table    :: atom(),
              sup      :: atom(),
              module   :: atom(),
              timeout   = 5000 :: integer(),
              restart   = transient :: atom(),
              state    :: term()  }).

-record(cx, { handlers  = [] :: list({atom(),atom()}),
              actions   = [] :: list(tuple()),
              req       = [] :: [] | term(),
              module    = [] :: [] | atom() | list(),
              lang      = [] :: [] | atom(),
              path      = [] :: [] | binary(),
              session   = [] :: [] | binary(),
              token     = [] :: [] | binary(),
              formatter = bert :: bert | json | atom(),
              params    = [] :: [] | list(tuple()) | binary() | list(),
              node      = [] :: [] | atom() | list(),
              client_pid= [] :: [] | term(),
              state     = [] :: [] | term(),
              from      = [] :: [] | binary(),
              vsn       = [] :: [] | binary() }).

-define(CTX(ClientId), n2o:cache(ClientId)).
-define(REQ(ClientId), (n2o:cache(ClientId))#cx.req).

% Nitrogen Protocol

-include_lib("nitro/include/proto.hrl").

-endif.