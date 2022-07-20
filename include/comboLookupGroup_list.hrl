-ifndef(COMBO_LOOKUP_GROUP_LIST_HRL).
-define(COMBO_LOOKUP_GROUP_LIST_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(comboLookupGroup_list, {?ELEMENT_BASE(element_comboLookupGroup_list),
                                disabled = false,
                                values = [],
                                subtitle = [],
                                group = []}).

-endif.
