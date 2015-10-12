-module(element_fespotlight).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feSpotLight">>, nitro:render(Record#feSpotLight.body),
	lists:append([
		[
			{<<"id">>, Record#feSpotLight.id},
			{<<"class">>, Record#feSpotLight.class},
			{<<"style">>, Record#feSpotLight.style},
			{<<"x">>, Record#feSpotLight.x},
			{<<"y">>, Record#feSpotLight.y},
			{<<"z">>, Record#feSpotLight.z},
			{<<"pointsAtX">>, Record#feSpotLight.pointsAtX},
			{<<"pointsAtY">>, Record#feSpotLight.pointsAtY},
			{<<"pointsAtZ">>, Record#feSpotLight.pointsAtZ},
			{<<"specularExponent">>, Record#feSpotLight.specularExponent},
			{<<"limitingConeAngle">>, Record#feSpotLight.limitingConeAngle}
		],
		svg_core(Record),
		Record#feSpotLight.data_fields,
		Record#feSpotLight.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feSpotLight.xmlbase},
	{<<"xml:lang">>, Record#feSpotLight.xmllang},
	{<<"xml:space">>, Record#feSpotLight.xmlspace}
].