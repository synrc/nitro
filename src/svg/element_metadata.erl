-module(element_metadata).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"metadata">>, nitro:render(Record#metadata.body),
	lists:append([
		[
			{<<"id">>, Record#metadata.id},
			{<<"class">>, Record#metadata.class},
			{<<"style">>, Record#metadata.style}
		],
		svg_core(Record),
		Record#metadata.data_fields,
		Record#metadata.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#metadata.xmlbase},
	{<<"xml:lang">>, Record#metadata.xmllang},
	{<<"xml:space">>, Record#metadata.xmlspace}
].