-module(element_animatemotion).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).
%% -import(element_svg, [svg_conditional_processing/1, svg_core/1, svg_xlink/1]).

render_element(Record) ->
	wf_tags:emit_tag(<<"animateMotion">>, nitro:render(Record#animateMotion.body),
	lists:append([
		[
			{<<"id">>, Record#animateMotion.id},
			{<<"class">>, Record#animateMotion.class},
			{<<"style">>, Record#animateMotion.style},
			{<<"path">>, Record#animateMotion.path},
			{<<"keyPoints">>, Record#animateMotion.keyPoints},
			{<<"rotate">>, Record#animateMotion.rotate},
			{<<"origin">>, Record#animateMotion.origin},
			{<<"externalResourcesRequired">>, Record#animateMotion.externalResourcesRequired}
		],
		svg_animation_event(Record),
		svg_animation_timing(Record),
		svg_animation_value(Record),
		svg_animation_addition(Record),
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_xlink(Record),
		Record#animateMotion.data_fields,
		Record#animateMotion.aria_states
	])).

svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#animateMotion.requiredExtensions},
	{<<"requiredFeatures">>, Record#animateMotion.requiredFeatures},
	{<<"systemLanguage">>, Record#animateMotion.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#animateMotion.xmlbase},
	{<<"xml:lang">>, Record#animateMotion.xmllang},
	{<<"xml:space">>, Record#animateMotion.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#animateMotion.xlinkhref},
	{<<"xlink:type">>, Record#animateMotion.xlinktype},
	{<<"xlink:role">>, Record#animateMotion.xlinkrole},
	{<<"xlink:arcrole">>, Record#animateMotion.xlinkarcrole},
	{<<"xlink:title">>, Record#animateMotion.xlinktitle},
	{<<"xlink:show">>, Record#animateMotion.xlinkshow},
	{<<"xlink:actuate">>, Record#animateMotion.xlinkactuate}
].

% Common SVG animateMotion attributes
svg_animation_event(Record) -> [
	{<<"onbegin">>, Record#animateMotion.onbegin},
	{<<"onend">>, Record#animateMotion.onend},
	{<<"onload">>, Record#animateMotion.onload_animation},
	{<<"onrepeat">>, Record#animateMotion.onrepeat}
].
svg_animation_timing(Record) -> [
	{<<"begin">>, Record#animateMotion.svgbegin},
	{<<"dur">>, Record#animateMotion.dur},
	{<<"end">>, Record#animateMotion.svgend},
	{<<"min">>, Record#animateMotion.min},
	{<<"max">>, Record#animateMotion.max},
	{<<"restart">>, Record#animateMotion.restart},
	{<<"repeatCount">>, Record#animateMotion.repeatCount},
	{<<"repeatDur">>, Record#animateMotion.repeatDur},
	{<<"fill">>, Record#animateMotion.fill}
].
svg_animation_value(Record) -> [
	{<<"calcMode">>, Record#animateMotion.calcMode},
	{<<"values">>, Record#animateMotion.values},
	{<<"keyTimes">>, Record#animateMotion.keyTimes},
	{<<"keySplines">>, Record#animateMotion.keySplines},
	{<<"from">>, Record#animateMotion.from},
	{<<"to">>, Record#animateMotion.to},
	{<<"by">>, Record#animateMotion.by},
	{<<"autoReverse">>, Record#animateMotion.autoReverse},
	{<<"accelerate">>, Record#animateMotion.accelerate},
	{<<"decelerate">>, Record#animateMotion.decelerate}
].
svg_animation_addition(Record) -> [
	{<<"additive">>, Record#animateMotion.additive},
	{<<"accumulate">>, Record#animateMotion.accumulate}
].
