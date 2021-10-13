-ifndef(COMBO_LOOKUP_EDIT_HRL).
-define(COMBO_LOOKUP_EDIT_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(comboLookupEdit, {?ELEMENT_BASE(element_comboLookupEdit), input, disabled, form, values}).

-endif.