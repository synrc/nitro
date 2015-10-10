-module(element_set).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"set">>, nitro:render(Record#set.body),
	lists:append([
		[
			{<<"id">>, Record#set.id},
			{<<"class">>, Record#set.class},
			{<<"style">>, Record#set.style},
			{<<"to">>, Record#set.to},
			{<<"externalResourcesRequired">>, Record#set.externalResourcesRequired}
		],
		svg_animation_event(Record),
		svg_animation_attribut_target(Record),
		svg_animation_timing(Record),
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_xlink(Record),
		Record#set.data_fields,
		Record#set.aria_states
	])).

svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#set.requiredExtensions},
	{<<"requiredFeatures">>, Record#set.requiredFeatures},
	{<<"systemLanguage">>, Record#set.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#set.xmlbase},
	{<<"xml:lang">>, Record#set.xmllang},
	{<<"xml:space">>, Record#set.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#set.xlinkhref},
	{<<"xlink:type">>, Record#set.xlinktype},
	{<<"xlink:role">>, Record#set.xlinkrole},
	{<<"xlink:arcrole">>, Record#set.xlinkarcrole},
	{<<"xlink:title">>, Record#set.xlinktitle},
	{<<"xlink:show">>, Record#set.xlinkshow},
	{<<"xlink:actuate">>, Record#set.xlinkactuate}
].

% Common SVG animate attributes
svg_animation_event(Record) -> [
	{<<"onbegin">>, Record#set.onbegin},
	{<<"onend">>, Record#set.onend},
	{<<"onload">>, Record#set.onload_animation},
	{<<"onrepeat">>, Record#set.onrepeat}
].

svg_animation_attribut_target(Record) -> [
	{<<"attributeType">>, Record#set.attributeType},
	{<<"attributeName">>, Record#set.attributeName}
].

svg_animation_timing(Record) -> [
	{<<"begin">>, Record#set.svgbegin},
	{<<"dur">>, Record#set.dur},
	{<<"end">>, Record#set.svgend},
	{<<"min">>, Record#set.min},
	{<<"max">>, Record#set.max},
	{<<"restart">>, Record#set.restart},
	{<<"repeatCount">>, Record#set.repeatCount},
	{<<"repeatDur">>, Record#set.repeatDur},
	{<<"fill">>, Record#set.fill}
].