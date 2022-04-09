-ifndef(COMBO_LOOKUP_MODIFY_HRL).
-define(COMBO_LOOKUP_MODIFY_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboLookupModify, {?ELEMENT_BASE(element_comboLookupModify), input = [], disabled = false,
                            values = [], modify_pos = [], modify_feed = [], modify_module = [], modify_default = []}).

-endif.
