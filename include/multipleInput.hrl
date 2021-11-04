-ifndef(MULTIPLEINPUT_HRL).
-define(MULTIPLEINPUT_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(multipleInput, {?ELEMENT_BASE(element_multipleInput), input=[], disabled=[], values=[]}).

-endif.
