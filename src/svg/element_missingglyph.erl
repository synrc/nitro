-module(element_missingglyph).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"missing-glyph">>, nitro:render(Record#missing_glyph.body),
	lists:append([
		[
			{<<"id">>, Record#missing_glyph.id},
			{<<"class">>, Record#missing_glyph.class},
			{<<"style">>, Record#missing_glyph.style},
			{<<"d">>, Record#missing_glyph.d},
			{<<"horiz-adv-x">>, Record#missing_glyph.horiz_adv_x},
			{<<"vert-origin-x">>, Record#missing_glyph.vert_origin_x},
			{<<"vert-origin-y">>, Record#missing_glyph.vert_origin_y},
			{<<"vert-adv-y">>, Record#missing_glyph.vert_adv_y}
		],
		svg_core(Record),
		svg_presentation(Record),
		Record#missing_glyph.data_fields,
		Record#missing_glyph.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#missing_glyph.xmlbase},
	{<<"xml:lang">>, Record#missing_glyph.xmllang},
	{<<"xml:space">>, Record#missing_glyph.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#missing_glyph.alignment_baseline},
	{<<"baseline-shift">>, Record#missing_glyph.baseline_shift},
	{<<"clip">>, Record#missing_glyph.clip},
	{<<"clip-path">>, Record#missing_glyph.clip_path},
	{<<"clip-rule">>, Record#missing_glyph.clip_rule},
	{<<"color">>, Record#missing_glyph.color},
	{<<"color-interpolation">>, Record#missing_glyph.color_interpolation},
	{<<"color-interpolation-filters">>, Record#missing_glyph.color_interpolation_filters},
	{<<"color-profile">>, Record#missing_glyph.color_profile},
	{<<"color-rendering">>, Record#missing_glyph.color_rendering},
	{<<"cursor">>, Record#missing_glyph.cursor},
	{<<"direction">>, Record#missing_glyph.direction},
	{<<"display">>, Record#missing_glyph.display},
	{<<"dominant-baseline">>, Record#missing_glyph.dominant_baseline},
	{<<"enable-background">>, Record#missing_glyph.enable_background},
	{<<"fill">>, Record#missing_glyph.fill},
	{<<"fill-opacity">>, Record#missing_glyph.fill_opacity},
	{<<"fill-rule">>, Record#missing_glyph.fill_rule},
	{<<"filter">>, Record#missing_glyph.filter},
	{<<"flood-color">>, Record#missing_glyph.flood_color},
	{<<"flood-opacity">>, Record#missing_glyph.flood_opacity},
	{<<"font-family">>, Record#missing_glyph.font_family},
	{<<"font-size">>, Record#missing_glyph.font_size},
	{<<"font-size-adjust">>, Record#missing_glyph.font_size_adjust},
	{<<"font-stretch">>, Record#missing_glyph.font_stretch},
	{<<"font-style">>, Record#missing_glyph.font_style},
	{<<"font-variant">>, Record#missing_glyph.font_variant},
	{<<"font-weight">>, Record#missing_glyph.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#missing_glyph.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#missing_glyph.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#missing_glyph.image_rendering},
	{<<"kerning">>, Record#missing_glyph.kerning},
	{<<"letter-spacing">>, Record#missing_glyph.letter_spacing},
	{<<"lighting-color">>, Record#missing_glyph.lighting_color},
	{<<"marker-end">>, Record#missing_glyph.marker_end},
	{<<"marker-mid">>, Record#missing_glyph.marker_mid},
	{<<"marker-start">>, Record#missing_glyph.marker_start},
	{<<"mask">>, Record#missing_glyph.mask},
	{<<"opacity">>, Record#missing_glyph.opacity},
	{<<"overflow">>, Record#missing_glyph.overflow},
	{<<"pointer-events">>, Record#missing_glyph.pointer_events},
	{<<"shape-rendering">>, Record#missing_glyph.shape_rendering},
	{<<"stop-color">>, Record#missing_glyph.stop_color},
	{<<"stop-opacity">>, Record#missing_glyph.stop_opacity},
	{<<"stroke">>, Record#missing_glyph.stroke},
	{<<"stroke-dasharray">>, Record#missing_glyph.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#missing_glyph.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#missing_glyph.stroke_linecap},
	{<<"stroke-linejoin">>, Record#missing_glyph.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#missing_glyph.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#missing_glyph.stroke_opacity},
	{<<"stroke-width">>, Record#missing_glyph.stroke_width},
	{<<"text-anchor">>, Record#missing_glyph.text_anchor},
	{<<"text-decoration">>, Record#missing_glyph.text_decoration},
	{<<"text-rendering">>, Record#missing_glyph.text_rendering},
	{<<"unicode-bidi">>, Record#missing_glyph.unicode_bidi},
	{<<"visibility">>, Record#missing_glyph.visibility},
	{<<"word-spacing">>, Record#missing_glyph.word_spacing},
	{<<"writing-mode">>, Record#missing_glyph.writing_mode}
].