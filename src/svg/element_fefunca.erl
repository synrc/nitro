-module(element_fefunca).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feFuncA">>, nitro:render(Record#feFuncA.body),
	lists:append([
		[
			{<<"id">>, Record#feFuncA.id},
			{<<"class">>, Record#feFuncA.class},
			{<<"style">>, Record#feFuncA.style}
		],
		svg_core(Record),
		svg_transfert_function(Record),
		Record#feFuncA.data_fields,
		Record#feFuncA.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feFuncA.xmlbase},
	{<<"xml:lang">>, Record#feFuncA.xmllang},
	{<<"xml:space">>, Record#feFuncA.xmlspace}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#feFuncA.type},
	{<<"tableValues">>, Record#feFuncA.tableValues},
	{<<"slope">>, Record#feFuncA.slope},
	{<<"intercept">>, Record#feFuncA.intercept},
	{<<"amplitude">>, Record#feFuncA.amplitude},
	{<<"exponent">>, Record#feFuncA.exponent},
	{<<"offset">>, Record#feFuncA.offset}
].