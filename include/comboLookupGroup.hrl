-ifndef(COMBO_LOOKUP_GROUP_HRL).
-define(COMBO_LOOKUP_GROUP_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(comboLookupGroup, {?ELEMENT_BASE(element_comboLookupGroup),
                           input = [],
                           disabled = false,
                           values = [],
                           subtitle = []}).

-endif.
