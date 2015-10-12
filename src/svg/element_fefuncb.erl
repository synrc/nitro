-module(element_fefuncb).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feFuncB">>, nitro:render(Record#feFuncB.body),
	lists:append([
		[
			{<<"id">>, Record#feFuncB.id},
			{<<"class">>, Record#feFuncB.class},
			{<<"style">>, Record#feFuncB.style}
		],
		svg_core(Record),
		svg_transfert_function(Record),
		Record#feFuncB.data_fields,
		Record#feFuncB.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feFuncB.xmlbase},
	{<<"xml:lang">>, Record#feFuncB.xmllang},
	{<<"xml:space">>, Record#feFuncB.xmlspace}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#feFuncB.type},
	{<<"tableValues">>, Record#feFuncB.tableValues},
	{<<"slope">>, Record#feFuncB.slope},
	{<<"intercept">>, Record#feFuncB.intercept},
	{<<"amplitude">>, Record#feFuncB.amplitude},
	{<<"exponent">>, Record#feFuncB.exponent},
	{<<"offset">>, Record#feFuncB.offset}
].