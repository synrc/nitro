-ifndef(NITRO_EVENT).
-define(NITRO_EVENT, true).

-include_lib("nitro/include/nitro.hrl").

-record(event,   {?ACTION_BASE(action_event), type=default, postback, delegate, validation=[]}).
-record(action,  {?ACTION_BASE(undefined)}).
-record(wire,    {?ACTION_BASE(action_wire)}).

-record(replace, {?ACTION_BASE(action_manage), elements}).
-record(insert,  {?ACTION_BASE(action_manage), elements, position = beforeend}).
-record(multi,   {?ACTION_BASE(action_manage)}).
-record(focus,   {?ACTION_BASE(action_ui)}).

-record(api,     {?ACTION_BASE(action_api), name, tag, delegate }).
-record(bind,    {?ACTION_BASE(action_bind), type=click, postback}).
-record(alert,   {?ACTION_BASE(action_alert), text}).
-record(confirm, {?ACTION_BASE(action_confirm), text, postback, delegate}).
-record(jq,      {?ACTION_BASE(action_jq), property, method, args=[], right, format="~s"}).
-record(transfer,{?ACTION_BASE(action_transfer), state, events=[] }).

-endif.
