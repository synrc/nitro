-module(element_femergenode).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feMergeNode">>, nitro:render(Record#feMergeNode.body),
	lists:append([
		[
			{<<"id">>, Record#feMergeNode.id},
			{<<"class">>, Record#feMergeNode.class},
			{<<"style">>, Record#feMergeNode.style},
			{<<"in">>, Record#feMergeNode.in}
		],
		svg_core(Record),
		Record#feMergeNode.data_fields,
		Record#feMergeNode.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feMergeNode.xmlbase},
	{<<"xml:lang">>, Record#feMergeNode.xmllang},
	{<<"xml:space">>, Record#feMergeNode.xmlspace}
].