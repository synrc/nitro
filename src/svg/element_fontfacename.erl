-module(element_fontfacename).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font-face-name">>, nitro:render(Record#font_face_name.body),
	lists:append([
		[
			{<<"id">>, Record#font_face_name.id},
			{<<"class">>, Record#font_face_name.class},
			{<<"style">>, Record#font_face_name.style},
			{<<"name">>, Record#font_face_name.name}
		],
		svg_core(Record),
		Record#font_face_name.data_fields,
		Record#font_face_name.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font_face_name.xmlbase},
	{<<"xml:lang">>, Record#font_face_name.xmllang},
	{<<"xml:space">>, Record#font_face_name.xmlspace}
].