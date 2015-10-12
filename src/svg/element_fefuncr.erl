-module(element_fefuncr).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feFuncR">>, nitro:render(Record#feFuncR.body),
	lists:append([
		[
			{<<"id">>, Record#feFuncR.id},
			{<<"class">>, Record#feFuncR.class},
			{<<"style">>, Record#feFuncR.style}
		],
		svg_core(Record),
		svg_transfert_function(Record),
		Record#feFuncR.data_fields,
		Record#feFuncR.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feFuncR.xmlbase},
	{<<"xml:lang">>, Record#feFuncR.xmllang},
	{<<"xml:space">>, Record#feFuncR.xmlspace}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#feFuncR.type},
	{<<"tableValues">>, Record#feFuncR.tableValues},
	{<<"slope">>, Record#feFuncR.slope},
	{<<"intercept">>, Record#feFuncR.intercept},
	{<<"amplitude">>, Record#feFuncR.amplitude},
	{<<"exponent">>, Record#feFuncR.exponent},
	{<<"offset">>, Record#feFuncR.offset}
].