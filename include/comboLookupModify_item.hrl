-ifndef(COMBO_LOOKUP_MODIFY_ITEM_HRL).
-define(COMBO_LOOKUP_MODIFY_ITEM_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboLookupModify_item, {?ELEMENT_BASE(element_comboLookupModify_item), list_id = [], value = [],
                                 pos = [], feed = [], default = [], disabled = false}).

-endif.
