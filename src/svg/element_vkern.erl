-module(element_vkern).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"vkern">>, nitro:render(Record#vkern.body),
	lists:append([
		[
			{<<"id">>, Record#vkern.id},
			{<<"class">>, Record#vkern.class},
			{<<"style">>, Record#vkern.style},
			{<<"u1">>, Record#vkern.u1},
			{<<"g1">>, Record#vkern.g1},
			{<<"u2">>, Record#vkern.u2},
			{<<"g2">>, Record#vkern.g2},
			{<<"k">>, Record#vkern.k}
		],
		svg_core(Record),
		Record#vkern.data_fields,
		Record#vkern.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#vkern.xmlbase},
	{<<"xml:lang">>, Record#vkern.xmllang},
	{<<"xml:space">>, Record#vkern.xmlspace}
].