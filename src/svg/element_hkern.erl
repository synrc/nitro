-module(element_hkern).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"hkern">>, nitro:render(Record#hkern.body),
	lists:append([
		[
			{<<"id">>, Record#hkern.id},
			{<<"class">>, Record#hkern.class},
			{<<"style">>, Record#hkern.style},
			{<<"u1">>, Record#hkern.u1},
			{<<"g1">>, Record#hkern.g1},
			{<<"u2">>, Record#hkern.u2},
			{<<"g2">>, Record#hkern.g2},
			{<<"k">>, Record#hkern.k}
		],
		svg_core(Record),
		Record#hkern.data_fields,
		Record#hkern.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#hkern.xmlbase},
	{<<"xml:lang">>, Record#hkern.xmllang},
	{<<"xml:space">>, Record#hkern.xmlspace}
].