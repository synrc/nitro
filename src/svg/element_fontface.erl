-module(element_fontface).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font-face">>, nitro:render(Record#font_face.body),
	lists:append([
		[
			{<<"id">>, Record#font_face.id},
			{<<"class">>, Record#font_face.class},
			{<<"style">>, Record#font_face.style},
			{<<"font-family">>, Record#font_face.font_family},
			{<<"font-style">>, Record#font_face.font_style},
			{<<"font-variant">>, Record#font_face.font_variant},
			{<<"font-weight">>, Record#font_face.font_weight},
			{<<"font-stretch">>, Record#font_face.font_stretch},
			{<<"font-size">>, Record#font_face.font_size},
			{<<"unicode-range">>, Record#font_face.unicode_range},
			{<<"units-per-em">>, Record#font_face.units_per_em},
			{<<"panose-1">>, Record#font_face.panose_1},
			{<<"stemv">>, Record#font_face.stemv},
			{<<"stemh">>, Record#font_face.stemh},
			{<<"slope">>, Record#font_face.slope},
			{<<"cap-height">>, Record#font_face.cap_height},
			{<<"x-height">>, Record#font_face.x_height},
			{<<"accent-height">>, Record#font_face.accent_height},
			{<<"ascent">>, Record#font_face.ascent},
			{<<"descent">>, Record#font_face.descent},
			{<<"widths">>, Record#font_face.widths},
			{<<"bbox">>, Record#font_face.bbox},
			{<<"ideographic">>, Record#font_face.ideographic},
			{<<"alphabetic">>, Record#font_face.alphabetic},
			{<<"mathematical">>, Record#font_face.mathematical},
			{<<"hanging">>, Record#font_face.hanging},
			{<<"v-ideographic">>, Record#font_face.v_ideographic},
			{<<"v-alphabetic">>, Record#font_face.v_alphabetic},
			{<<"v-mathematical">>, Record#font_face.v_mathematical},
			{<<"v-hanging">>, Record#font_face.v_hanging},
			{<<"underline-position">>, Record#font_face.underline_position},
			{<<"underline-thickness">>, Record#font_face.underline_thickness},
			{<<"strikethrough-position">>, Record#font_face.strikethrough_position},
			{<<"strikethrough-thickness">>, Record#font_face.strikethrough_thickness},
			{<<"overline-position">>, Record#font_face.overline_position},
			{<<"overline-thickness">>, Record#font_face.overline_thickness}
		],
		svg_core(Record),
		Record#font_face.data_fields,
		Record#font_face.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font_face.xmlbase},
	{<<"xml:lang">>, Record#font_face.xmllang},
	{<<"xml:space">>, Record#font_face.xmlspace}
].