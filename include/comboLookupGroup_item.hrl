-ifndef(COMBO_LOOKUP_GROUP_ITEM_HRL).
-define(COMBO_LOOKUP_GROUP_ITEM_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(comboLookupGroup_item, {?ELEMENT_BASE(element_comboLookupGroup_item),
                                value = [],
                                group = []}).

-endif.
