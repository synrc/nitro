-module(element_fefuncg).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feFuncG">>, nitro:render(Record#feFuncG.body),
	lists:append([
		[
			{<<"id">>, Record#feFuncG.id},
			{<<"class">>, Record#feFuncG.class},
			{<<"style">>, Record#feFuncG.style}
		],
		svg_core(Record),
		svg_transfert_function(Record),
		Record#feFuncG.data_fields,
		Record#feFuncG.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feFuncG.xmlbase},
	{<<"xml:lang">>, Record#feFuncG.xmllang},
	{<<"xml:space">>, Record#feFuncG.xmlspace}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#feFuncG.type},
	{<<"tableValues">>, Record#feFuncG.tableValues},
	{<<"slope">>, Record#feFuncG.slope},
	{<<"intercept">>, Record#feFuncG.intercept},
	{<<"amplitude">>, Record#feFuncG.amplitude},
	{<<"exponent">>, Record#feFuncG.exponent},
	{<<"offset">>, Record#feFuncG.offset}
].