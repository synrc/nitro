-module(element_fedistantlight).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feDistantLight">>, nitro:render(Record#feDistantLight.body),
	lists:append([
		[
			{<<"id">>, Record#feDistantLight.id},
			{<<"class">>, Record#feDistantLight.class},
			{<<"style">>, Record#feDistantLight.style},
			{<<"azimuth">>, Record#feDistantLight.azimuth},
			{<<"elevation">>, Record#feDistantLight.elevation}
		],
		svg_core(Record),
		Record#feDistantLight.data_fields,
		Record#feDistantLight.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feDistantLight.xmlbase},
	{<<"xml:lang">>, Record#feDistantLight.xmllang},
	{<<"xml:space">>, Record#feDistantLight.xmlspace}
].