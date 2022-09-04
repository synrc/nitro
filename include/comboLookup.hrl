-ifndef(COMBO_LOOKUP_HRL).
-define(COMBO_LOOKUP_HRL, true).

-include_lib("nitro/include/nitro.hrl").

-record(comboKey,    { uid=[], value=[], dom=[], feed=[], delegate=[]}).
-record(comboKeyup,  { value=[], dom=[], feed=[], delegate=[]}).
-record(comboSelect, { uid=[], value=[], dom=[], feed=[], delegate=[], update=[]}).
-record(comboVecAdd, { list_id=[], value=[], feed=[], delegate=[]}).
-record(comboNext,   { pos=[],  count=[], feed=[]}).
-record(comboScroll, { uid=[], dom=[], delegate=[] }).
-record(comboInsert, { uid=[], dom=[], rows=[], chunks=[], status=[], delegate=[], feed=[] }).
-record(comboAdd,    { list_id=[], value=[], bind=[], delegate=[], pos=[], feed=[], default=[]}).
-record(comboModify, { list_id=[], item_id=[], value=[], bind=[], modify_bind=[], delegate=[], pos=[], feed=[] }).
-record(comboGroup,  { dom=[], value=[], delegate=[] }).
-record(comboDraft,  { dom=[], list=[], values=[], group=[], subtitle=[], delegate=[] }).
-record(comboUpdate, { id=[], fields=[], module=[], action=[], value=[] }).
-record(comboLoader, { dom=[], delegate=[], status=[] }).
-record(comboLookup, { ?ELEMENT_BASE(element_comboLookup),
    value=[],
    disabled=false,
    feed=[],
    reader=[],
    chunk=20,
    update=[],
    nested=[] }).

-record(process, {name=[]}).

-endif.
