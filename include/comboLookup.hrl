-ifndef(COMBO_LOOKUP_HRL).
-define(COMBO_LOOKUP_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboKey,    { uid=[], value=[], dom=[], feed=[], delegate=[]}).
-record(comboKeyup,  { value=[], dom=[], feed=[], delegate=[]}).
-record(comboSelect, { uid=[], value=[], dom=[], feed=[], delegate=[] }).
-record(comboNext,   { pos=[],  count=[], feed=[]}).
-record(comboScroll, { uid=[], dom=[], delegate=[] }).
-record(comboInsert, { uid=[], dom=[], rows=[], chunks=[], status=[], delegate=[], feed=[] }).
-record(comboAdd,    { list_id=[], value=[], bind=[], delegate=[], pos=[], feed=[], default=[]}).
-record(comboModify, { list_id=[], item_id=[], value=[], bind=[], modify_bind=[], delegate=[], pos=[], feed=[] }).
-record(comboLookup, { ?ELEMENT_BASE(element_comboLookup),
    value=[],
    disabled=false,
    feed=[],
    reader=[],
    chunk=20,
    nested=[] }).

-record(process, {name=[]}).

-endif.
