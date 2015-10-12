-module(element_fepointlight).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"fePointLight">>, nitro:render(Record#fePointLight.body),
	lists:append([
		[
			{<<"id">>, Record#fePointLight.id},
			{<<"class">>, Record#fePointLight.class},
			{<<"style">>, Record#fePointLight.style},
			{<<"x">>, Record#fePointLight.x},
			{<<"y">>, Record#fePointLight.y},
			{<<"z">>, Record#fePointLight.z}
		],
		svg_core(Record),
		Record#fePointLight.data_fields,
		Record#fePointLight.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#fePointLight.xmlbase},
	{<<"xml:lang">>, Record#fePointLight.xmllang},
	{<<"xml:space">>, Record#fePointLight.xmlspace}
].