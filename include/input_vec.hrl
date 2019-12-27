-ifndef(INPUT_VEC_NX_HRL).
-define(INPUT_VEC_NX_HRL, true).

-include_lib("nitro/include/nitro.hrl").
-record(input_vec, {?ELEMENT_BASE(element_input_vec), input, disabled, values}).

-endif.
