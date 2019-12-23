-ifndef(SORTABLE_LIST_NX_HRL).
-define(SORTABLE_LIST_NX_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(sortable_list, {?ELEMENT_BASE(element_sortable_list), values, closeable, disabled}).

-endif.
