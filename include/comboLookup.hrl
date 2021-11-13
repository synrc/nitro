-ifndef(COMBO_LOOKUP_HRL).
-define(COMBO_LOOKUP_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboKey,    { value=[], dom=[], feed=[], delegate=[]}).
-record(comboKeyup,  { value=[], dom=[], feed=[], delegate=[]}).
-record(comboSelect, { value=[], dom=[], feed=[], delegate=[] }).
-record(comboNext,   { pos=[],  count=[], feed=[]}).
-record(comboScroll, { dom=[], delegate=[] }).
-record(comboInsert, { dom=[], rows=[], chunks=[], status=[], delegate=[], feed=[] }).
-record(comboLookup, { ?ELEMENT_BASE(element_comboLookup),
    value=[],
    disabled=false,
    feed=[],
    reader=[],
    chunk=20 }).

-record(process, {name=[]}).

-endif.
