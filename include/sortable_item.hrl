-ifndef(SORTABLE_ITEM_NX_HRL).
-define(SORTABLE_ITEM_NX_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(sortable_item, {?ELEMENT_BASE(element_sortable_item), list_id, value, closeable, disabled}).

-endif.
