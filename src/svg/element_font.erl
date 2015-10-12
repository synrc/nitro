-module(element_font).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"font">>, nitro:render(Record#font.body),
	lists:append([
		[
			{<<"id">>, Record#font.id},
			{<<"class">>, Record#font.class},
			{<<"style">>, Record#font.style},
			{<<"horiz-origin-x">>, Record#font.horiz_origin_x},
			{<<"horiz-origin-y">>, Record#font.horiz_origin_y},
			{<<"horiz-adv-x">>, Record#font.horiz_adv_x},
			{<<"vert-origin-x">>, Record#font.vert_origin_x},
			{<<"vert-origin-y">>, Record#font.vert_origin_y},
			{<<"vert-adv-y">>, Record#font.vert_adv_y},
			{<<"externalResourcesRequired">>, Record#font.externalResourcesRequired}
		],
		svg_core(Record),
		svg_presentation(Record),
		Record#font.data_fields,
		Record#font.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#font.xmlbase},
	{<<"xml:lang">>, Record#font.xmllang},
	{<<"xml:space">>, Record#font.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#font.alignment_baseline},
	{<<"baseline-shift">>, Record#font.baseline_shift},
	{<<"clip">>, Record#font.clip},
	{<<"clip-path">>, Record#font.clip_path},
	{<<"clip-rule">>, Record#font.clip_rule},
	{<<"color">>, Record#font.color},
	{<<"color-interpolation">>, Record#font.color_interpolation},
	{<<"color-interpolation-filters">>, Record#font.color_interpolation_filters},
	{<<"color-profile">>, Record#font.color_profile},
	{<<"color-rendering">>, Record#font.color_rendering},
	{<<"cursor">>, Record#font.cursor},
	{<<"direction">>, Record#font.direction},
	{<<"display">>, Record#font.display},
	{<<"dominant-baseline">>, Record#font.dominant_baseline},
	{<<"enable-background">>, Record#font.enable_background},
	{<<"fill">>, Record#font.fill},
	{<<"fill-opacity">>, Record#font.fill_opacity},
	{<<"fill-rule">>, Record#font.fill_rule},
	{<<"filter">>, Record#font.filter},
	{<<"flood-color">>, Record#font.flood_color},
	{<<"flood-opacity">>, Record#font.flood_opacity},
	{<<"font-family">>, Record#font.font_family},
	{<<"font-size">>, Record#font.font_size},
	{<<"font-size-adjust">>, Record#font.font_size_adjust},
	{<<"font-stretch">>, Record#font.font_stretch},
	{<<"font-style">>, Record#font.font_style},
	{<<"font-variant">>, Record#font.font_variant},
	{<<"font-weight">>, Record#font.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#font.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#font.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#font.image_rendering},
	{<<"kerning">>, Record#font.kerning},
	{<<"letter-spacing">>, Record#font.letter_spacing},
	{<<"lighting-color">>, Record#font.lighting_color},
	{<<"marker-end">>, Record#font.marker_end},
	{<<"marker-mid">>, Record#font.marker_mid},
	{<<"marker-start">>, Record#font.marker_start},
	{<<"mask">>, Record#font.mask},
	{<<"opacity">>, Record#font.opacity},
	{<<"overflow">>, Record#font.overflow},
	{<<"pointer-events">>, Record#font.pointer_events},
	{<<"shape-rendering">>, Record#font.shape_rendering},
	{<<"stop-color">>, Record#font.stop_color},
	{<<"stop-opacity">>, Record#font.stop_opacity},
	{<<"stroke">>, Record#font.stroke},
	{<<"stroke-dasharray">>, Record#font.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#font.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#font.stroke_linecap},
	{<<"stroke-linejoin">>, Record#font.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#font.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#font.stroke_opacity},
	{<<"stroke-width">>, Record#font.stroke_width},
	{<<"text-anchor">>, Record#font.text_anchor},
	{<<"text-decoration">>, Record#font.text_decoration},
	{<<"text-rendering">>, Record#font.text_rendering},
	{<<"unicode-bidi">>, Record#font.unicode_bidi},
	{<<"visibility">>, Record#font.visibility},
	{<<"word-spacing">>, Record#font.word_spacing},
	{<<"writing-mode">>, Record#font.writing_mode}
].