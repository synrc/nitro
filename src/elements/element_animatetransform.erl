-module(element_animatetransform).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).
%% -import(element_svg, [svg_conditional_processing/1, svg_core/1, svg_xlink/1]).

render_element(Record) ->
	wf_tags:emit_tag(<<"animateTransform">>, nitro:render(Record#animateTransform.body),
	lists:append([
		[
			{<<"id">>, Record#animateTransform.id},
			{<<"class">>, Record#animateTransform.class},
			{<<"style">>, Record#animateTransform.style},
			{<<"type">>, Record#animateTransform.type},
			{<<"externalResourcesRequired">>, Record#animateTransform.externalResourcesRequired}
		],
		svg_animation_event(Record),
		svg_animation_attribut_target(Record),
		svg_animation_timing(Record),
		svg_animation_value(Record),
		svg_animation_addition(Record),
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_xlink(Record),
		Record#animateTransform.data_fields,
		Record#animateTransform.aria_states
	])).

svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#animateTransform.requiredExtensions},
	{<<"requiredFeatures">>, Record#animateTransform.requiredFeatures},
	{<<"systemLanguage">>, Record#animateTransform.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#animateTransform.xmlbase},
	{<<"xml:lang">>, Record#animateTransform.xmllang},
	{<<"xml:space">>, Record#animateTransform.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#animateTransform.xlinkhref},
	{<<"xlink:type">>, Record#animateTransform.xlinktype},
	{<<"xlink:role">>, Record#animateTransform.xlinkrole},
	{<<"xlink:arcrole">>, Record#animateTransform.xlinkarcrole},
	{<<"xlink:title">>, Record#animateTransform.xlinktitle},
	{<<"xlink:show">>, Record#animateTransform.xlinkshow},
	{<<"xlink:actuate">>, Record#animateTransform.xlinkactuate}
].

% Common SVG animateTransform attributes
svg_animation_event(Record) -> [
	{<<"onbegin">>, Record#animateTransform.onbegin},
	{<<"onend">>, Record#animateTransform.onend},
	{<<"onload">>, Record#animateTransform.onload_animation},
	{<<"onrepeat">>, Record#animateTransform.onrepeat}
].
svg_animation_attribut_target(Record) -> [
	{<<"attributeType">>, Record#animateTransform.attributeType},
	{<<"attributeName">>, Record#animateTransform.attributeName}
].
svg_animation_timing(Record) -> [
	{<<"begin">>, Record#animateTransform.svgbegin},
	{<<"dur">>, Record#animateTransform.dur},
	{<<"end">>, Record#animateTransform.svgend},
	{<<"min">>, Record#animateTransform.min},
	{<<"max">>, Record#animateTransform.max},
	{<<"restart">>, Record#animateTransform.restart},
	{<<"repeatCount">>, Record#animateTransform.repeatCount},
	{<<"repeatDur">>, Record#animateTransform.repeatDur},
	{<<"fill">>, Record#animateTransform.fill}
].
svg_animation_value(Record) -> [
	{<<"calcMode">>, Record#animateTransform.calcMode},
	{<<"values">>, Record#animateTransform.values},
	{<<"keyTimes">>, Record#animateTransform.keyTimes},
	{<<"keySplines">>, Record#animateTransform.keySplines},
	{<<"from">>, Record#animateTransform.from},
	{<<"to">>, Record#animateTransform.to},
	{<<"by">>, Record#animateTransform.by},
	{<<"autoReverse">>, Record#animateTransform.autoReverse},
	{<<"accelerate">>, Record#animateTransform.accelerate},
	{<<"decelerate">>, Record#animateTransform.decelerate}
].
svg_animation_addition(Record) -> [
	{<<"additive">>, Record#animateTransform.additive},
	{<<"accumulate">>, Record#animateTransform.accumulate}
].
