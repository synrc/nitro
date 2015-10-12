-module(element_fontfacesrc).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font-face-src">>, nitro:render(Record#font_face_src.body),
	lists:append([
		[
			{<<"id">>, Record#font_face_src.id},
			{<<"class">>, Record#font_face_src.class},
			{<<"style">>, Record#font_face_src.style}
		],
		svg_core(Record),
		Record#font_face_src.data_fields,
		Record#font_face_src.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font_face_src.xmlbase},
	{<<"xml:lang">>, Record#font_face_src.xmllang},
	{<<"xml:space">>, Record#font_face_src.xmlspace}
].