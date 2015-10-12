-module(element_fontfaceformat).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font-face-format">>, nitro:render(Record#font_face_format.body),
	lists:append([
		[
			{<<"id">>, Record#font_face_format.id},
			{<<"class">>, Record#font_face_format.class},
			{<<"style">>, Record#font_face_format.style},
			{<<"string">>, Record#font_face_format.string}
		],
		svg_core(Record),
		Record#font_face_format.data_fields,
		Record#font_face_format.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font_face_format.xmlbase},
	{<<"xml:lang">>, Record#font_face_format.xmllang},
	{<<"xml:space">>, Record#font_face_format.xmlspace}
].