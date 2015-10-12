-module(element_feblend).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feBlend">>, nitro:render(Record#feBlend.body),
	lists:append([
		[
			{<<"id">>, Record#feBlend.id},
			{<<"class">>, Record#feBlend.class},
			{<<"style">>, Record#feBlend.style},
			{<<"in">>, Record#feBlend.in},
			{<<"in2">>, Record#feBlend.in2},
			{<<"mode">>, Record#feBlend.mode}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feBlend.data_fields,
		Record#feBlend.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feBlend.xmlbase},
	{<<"xml:lang">>, Record#feBlend.xmllang},
	{<<"xml:space">>, Record#feBlend.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feBlend.height},
	{<<"result">>, Record#feBlend.result},
	{<<"width">>, Record#feBlend.width},
	{<<"x">>, Record#feBlend.x},
	{<<"y">>, Record#feBlend.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feBlend.alignment_baseline},
	{<<"baseline-shift">>, Record#feBlend.baseline_shift},
	{<<"clip">>, Record#feBlend.clip},
	{<<"clip-path">>, Record#feBlend.clip_path},
	{<<"clip-rule">>, Record#feBlend.clip_rule},
	{<<"color">>, Record#feBlend.color},
	{<<"color-interpolation">>, Record#feBlend.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feBlend.color_interpolation_filters},
	{<<"color-profile">>, Record#feBlend.color_profile},
	{<<"color-rendering">>, Record#feBlend.color_rendering},
	{<<"cursor">>, Record#feBlend.cursor},
	{<<"direction">>, Record#feBlend.direction},
	{<<"display">>, Record#feBlend.display},
	{<<"dominant-baseline">>, Record#feBlend.dominant_baseline},
	{<<"enable-background">>, Record#feBlend.enable_background},
	{<<"fill">>, Record#feBlend.fill},
	{<<"fill-opacity">>, Record#feBlend.fill_opacity},
	{<<"fill-rule">>, Record#feBlend.fill_rule},
	{<<"filter">>, Record#feBlend.filter},
	{<<"flood-color">>, Record#feBlend.flood_color},
	{<<"flood-opacity">>, Record#feBlend.flood_opacity},
	{<<"font-family">>, Record#feBlend.font_family},
	{<<"font-size">>, Record#feBlend.font_size},
	{<<"font-size-adjust">>, Record#feBlend.font_size_adjust},
	{<<"font-stretch">>, Record#feBlend.font_stretch},
	{<<"font-style">>, Record#feBlend.font_style},
	{<<"font-variant">>, Record#feBlend.font_variant},
	{<<"font-weight">>, Record#feBlend.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feBlend.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feBlend.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feBlend.image_rendering},
	{<<"kerning">>, Record#feBlend.kerning},
	{<<"letter-spacing">>, Record#feBlend.letter_spacing},
	{<<"lighting-color">>, Record#feBlend.lighting_color},
	{<<"marker-end">>, Record#feBlend.marker_end},
	{<<"marker-mid">>, Record#feBlend.marker_mid},
	{<<"marker-start">>, Record#feBlend.marker_start},
	{<<"mask">>, Record#feBlend.mask},
	{<<"opacity">>, Record#feBlend.opacity},
	{<<"overflow">>, Record#feBlend.overflow},
	{<<"pointer-events">>, Record#feBlend.pointer_events},
	{<<"shape-rendering">>, Record#feBlend.shape_rendering},
	{<<"stop-color">>, Record#feBlend.stop_color},
	{<<"stop-opacity">>, Record#feBlend.stop_opacity},
	{<<"stroke">>, Record#feBlend.stroke},
	{<<"stroke-dasharray">>, Record#feBlend.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feBlend.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feBlend.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feBlend.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feBlend.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feBlend.stroke_opacity},
	{<<"stroke-width">>, Record#feBlend.stroke_width},
	{<<"text-anchor">>, Record#feBlend.text_anchor},
	{<<"text-decoration">>, Record#feBlend.text_decoration},
	{<<"text-rendering">>, Record#feBlend.text_rendering},
	{<<"unicode-bidi">>, Record#feBlend.unicode_bidi},
	{<<"visibility">>, Record#feBlend.visibility},
	{<<"word-spacing">>, Record#feBlend.word_spacing},
	{<<"writing-mode">>, Record#feBlend.writing_mode}
].