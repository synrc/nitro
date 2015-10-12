-module(element_mpath).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"mpath">>, nitro:render(Record#mpath.body),
	lists:append([
		[
			{<<"id">>, Record#mpath.id},
			{<<"class">>, Record#mpath.class},
			{<<"style">>, Record#mpath.style},
			{<<"externalResourcesRequired">>, Record#mpath.externalResourcesRequired}
		],
		svg_core(Record),
		svg_xlink(Record),
		Record#mpath.data_fields,
		Record#mpath.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#mpath.xmlbase},
	{<<"xml:lang">>, Record#mpath.xmllang},
	{<<"xml:space">>, Record#mpath.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#mpath.xlinkhref},
	{<<"xlink:type">>, Record#mpath.xlinktype},
	{<<"xlink:role">>, Record#mpath.xlinkrole},
	{<<"xlink:arcrole">>, Record#mpath.xlinkarcrole},
	{<<"xlink:title">>, Record#mpath.xlinktitle},
	{<<"xlink:show">>, Record#mpath.xlinkshow},
	{<<"xlink:actuate">>, Record#mpath.xlinkactuate}
].