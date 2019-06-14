-ifndef(NITRO_EVENT).
-define(NITRO_EVENT, true).

-include_lib("nitro/include/nitro.hrl").

-record(event,   {?ACTION_BASE(action_event), type=default, postback, delegate, validation=[]}).

-endif.
