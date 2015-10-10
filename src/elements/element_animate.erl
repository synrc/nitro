-module(element_animate).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"animate">>, nitro:render(Record#animate.body),
	lists:append([
		[
			{<<"id">>, Record#animate.id},
			{<<"class">>, Record#animate.class},
			{<<"style">>, Record#animate.style},
			{<<"externalResourcesRequired">>, Record#animate.externalResourcesRequired}
		],
		svg_animation_event(Record),
		svg_animation_attribut_target(Record),
		svg_animation_timing(Record),
		svg_animation_value(Record),
		svg_animation_addition(Record),
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_xlink(Record),
		Record#animate.data_fields,
		Record#animate.aria_states
	])).

svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#animate.requiredExtensions},
	{<<"requiredFeatures">>, Record#animate.requiredFeatures},
	{<<"systemLanguage">>, Record#animate.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#animate.xmlbase},
	{<<"xml:lang">>, Record#animate.xmllang},
	{<<"xml:space">>, Record#animate.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#animate.xlinkhref},
	{<<"xlink:type">>, Record#animate.xlinktype},
	{<<"xlink:role">>, Record#animate.xlinkrole},
	{<<"xlink:arcrole">>, Record#animate.xlinkarcrole},
	{<<"xlink:title">>, Record#animate.xlinktitle},
	{<<"xlink:show">>, Record#animate.xlinkshow},
	{<<"xlink:actuate">>, Record#animate.xlinkactuate}
].

% Common SVG animate attributes
svg_animation_event(Record) -> [
	{<<"onbegin">>, Record#animate.onbegin},
	{<<"onend">>, Record#animate.onend},
	{<<"onload">>, Record#animate.onload_animation},
	{<<"onrepeat">>, Record#animate.onrepeat}
].
svg_animation_attribut_target(Record) -> [
	{<<"attributeType">>, Record#animate.attributeType},
	{<<"attributeName">>, Record#animate.attributeName}
].
svg_animation_timing(Record) -> [
	{<<"begin">>, Record#animate.svgbegin},
	{<<"dur">>, Record#animate.dur},
	{<<"end">>, Record#animate.svgend},
	{<<"min">>, Record#animate.min},
	{<<"max">>, Record#animate.max},
	{<<"restart">>, Record#animate.restart},
	{<<"repeatCount">>, Record#animate.repeatCount},
	{<<"repeatDur">>, Record#animate.repeatDur},
	{<<"fill">>, Record#animate.fill}
].
svg_animation_value(Record) -> [
	{<<"calcMode">>, Record#animate.calcMode},
	{<<"values">>, Record#animate.values},
	{<<"keyTimes">>, Record#animate.keyTimes},
	{<<"keySplines">>, Record#animate.keySplines},
	{<<"from">>, Record#animate.from},
	{<<"to">>, Record#animate.to},
	{<<"by">>, Record#animate.by},
	{<<"autoReverse">>, Record#animate.autoReverse},
	{<<"accelerate">>, Record#animate.accelerate},
	{<<"decelerate">>, Record#animate.decelerate}
].
svg_animation_addition(Record) -> [
	{<<"additive">>, Record#animate.additive},
	{<<"accumulate">>, Record#animate.accumulate}
].
