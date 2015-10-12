-module(element_cursor).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"cursor">>, nitro:render(Record#cursor.body),
	lists:append([
		[
			{<<"id">>, Record#cursor.id},
			{<<"class">>, Record#cursor.class},
			{<<"style">>, Record#cursor.style},
			{<<"x">>, Record#cursor.x},
			{<<"y">>, Record#cursor.y},
			{<<"externalResourcesRequired">>, Record#cursor.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_xlink(Record),
		Record#cursor.data_fields,
		Record#cursor.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#cursor.requiredExtensions},
	{<<"requiredFeatures">>, Record#cursor.requiredFeatures},
	{<<"systemLanguage">>, Record#cursor.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#cursor.xmlbase},
	{<<"xml:lang">>, Record#cursor.xmllang},
	{<<"xml:space">>, Record#cursor.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#cursor.xlinkhref},
	{<<"xlink:type">>, Record#cursor.xlinktype},
	{<<"xlink:role">>, Record#cursor.xlinkrole},
	{<<"xlink:arcrole">>, Record#cursor.xlinkarcrole},
	{<<"xlink:title">>, Record#cursor.xlinktitle},
	{<<"xlink:show">>, Record#cursor.xlinkshow},
	{<<"xlink:actuate">>, Record#cursor.xlinkactuate}
].