-module(element_svgtitle).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"title">>, nitro:render(Record#svgtitle.body),
	lists:append([
		[
			{<<"id">>, Record#svgtitle.id},
			{<<"class">>, Record#svgtitle.class},
			{<<"style">>, Record#svgtitle.style}
		],
		svg_core(Record),
		Record#svgtitle.data_fields,
		Record#svgtitle.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#svgtitle.xmlbase},
	{<<"xml:lang">>, Record#svgtitle.xmllang},
	{<<"xml:space">>, Record#svgtitle.xmlspace}
].