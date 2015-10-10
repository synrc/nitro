-module(element_fontfaceuri).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font_face-uri">>, nitro:render(Record#font_face_uri.body),
	lists:append([
		[
			{<<"id">>, Record#font_face_uri.id},
			{<<"class">>, Record#font_face_uri.class},
			{<<"style">>, Record#font_face_uri.style}
		],
		svg_core(Record),
		svg_xlink(Record),
		Record#font_face_uri.data_fields,
		Record#font_face_uri.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font_face_uri.xmlbase},
	{<<"xml:lang">>, Record#font_face_uri.xmllang},
	{<<"xml:space">>, Record#font_face_uri.xmlspace}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#font_face_uri.xlinkhref},
	{<<"xlink:type">>, Record#font_face_uri.xlinktype},
	{<<"xlink:role">>, Record#font_face_uri.xlinkrole},
	{<<"xlink:arcrole">>, Record#font_face_uri.xlinkarcrole},
	{<<"xlink:title">>, Record#font_face_uri.xlinktitle},
	{<<"xlink:show">>, Record#font_face_uri.xlinkshow},
	{<<"xlink:actuate">>, Record#font_face_uri.xlinkactuate}
].