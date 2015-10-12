-module(element_colorprofile).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"color-profile">>, nitro:render(Record#color_profile.body),
	lists:append([
		[
			{<<"id">>, Record#color_profile.id},
			{<<"class">>, Record#color_profile.class},
			{<<"style">>, Record#color_profile.style},
			{<<"local">>, Record#color_profile.local},
			{<<"name">>, Record#color_profile.name},
			{<<"rendering-intent">>, Record#color_profile.rendering_intent}
		],
		svg_core(Record),
		svg_xlink(Record),
		Record#color_profile.data_fields,
		Record#color_profile.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#color_profile.xmlbase},
	{<<"xml:lang">>, Record#color_profile.xmllang},
	{<<"xml:space">>, Record#color_profile.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#color_profile.xlinkhref},
	{<<"xlink:type">>, Record#color_profile.xlinktype},
	{<<"xlink:role">>, Record#color_profile.xlinkrole},
	{<<"xlink:arcrole">>, Record#color_profile.xlinkarcrole},
	{<<"xlink:title">>, Record#color_profile.xlinktitle},
	{<<"xlink:show">>, Record#color_profile.xlinkshow},
	{<<"xlink:actuate">>, Record#color_profile.xlinkactuate}
].