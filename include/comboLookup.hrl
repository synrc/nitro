-ifndef(COMBO_LOOKUP_HRL).
-define(COMBO_LOOKUP_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboKeyup,  { value=[], dom=[], feed=[], delegate=[]}).
-record(comboNext,   { pos=[],  count=[], feed=[]}).
-record(comboLookup, { ?ELEMENT_BASE(element_comboLookup),
    value=[],
    disabled=false,
    feed=[],
    reader=[],
    chunk=20 }).

-record(process, {name=[]}).

-endif.
