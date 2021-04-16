-ifndef(COMBO_LOOKUP_TEXT_HRL).
-define(COMBO_LOOKUP_TEXT_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(comboLookupText, {?ELEMENT_BASE(element_comboLookupText), input, disabled, textarea, values}).

-endif.
