-module(element_glyph).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"glyph">>, nitro:render(Record#glyph.body),
	lists:append([
		[
			{<<"id">>, Record#glyph.id},
			{<<"class">>, Record#glyph.class},
			{<<"style">>, Record#glyph.style},
			{<<"d">>, Record#glyph.d},
			{<<"horiz-adv-x">>, Record#glyph.horiz_adv_x},
			{<<"vert-origin-x">>, Record#glyph.vert_origin_x},
			{<<"vert-origin-y">>, Record#glyph.vert_origin_y},
			{<<"vert-adv-y">>, Record#glyph.vert_adv_y},
			{<<"unicode">>, Record#glyph.unicode},
			{<<"glyph-name">>, Record#glyph.glyph_name},
			{<<"orientation">>, Record#glyph.orientation},
			{<<"arabic-form">>, Record#glyph.arabic_form},
			{<<"lang">>, Record#glyph.lang}
		],
		svg_core(Record),
		svg_presentation(Record),
		Record#glyph.data_fields,
		Record#glyph.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#glyph.xmlbase},
	{<<"xml:lang">>, Record#glyph.xmllang},
	{<<"xml:space">>, Record#glyph.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#glyph.alignment_baseline},
	{<<"baseline-shift">>, Record#glyph.baseline_shift},
	{<<"clip">>, Record#glyph.clip},
	{<<"clip-path">>, Record#glyph.clip_path},
	{<<"clip-rule">>, Record#glyph.clip_rule},
	{<<"color">>, Record#glyph.color},
	{<<"color-interpolation">>, Record#glyph.color_interpolation},
	{<<"color-interpolation-filters">>, Record#glyph.color_interpolation_filters},
	{<<"color-profile">>, Record#glyph.color_profile},
	{<<"color-rendering">>, Record#glyph.color_rendering},
	{<<"cursor">>, Record#glyph.cursor},
	{<<"direction">>, Record#glyph.direction},
	{<<"display">>, Record#glyph.display},
	{<<"dominant-baseline">>, Record#glyph.dominant_baseline},
	{<<"enable-background">>, Record#glyph.enable_background},
	{<<"fill">>, Record#glyph.fill},
	{<<"fill-opacity">>, Record#glyph.fill_opacity},
	{<<"fill-rule">>, Record#glyph.fill_rule},
	{<<"filter">>, Record#glyph.filter},
	{<<"flood-color">>, Record#glyph.flood_color},
	{<<"flood-opacity">>, Record#glyph.flood_opacity},
	{<<"font-family">>, Record#glyph.font_family},
	{<<"font-size">>, Record#glyph.font_size},
	{<<"font-size-adjust">>, Record#glyph.font_size_adjust},
	{<<"font-stretch">>, Record#glyph.font_stretch},
	{<<"font-style">>, Record#glyph.font_style},
	{<<"font-variant">>, Record#glyph.font_variant},
	{<<"font-weight">>, Record#glyph.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#glyph.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#glyph.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#glyph.image_rendering},
	{<<"kerning">>, Record#glyph.kerning},
	{<<"letter-spacing">>, Record#glyph.letter_spacing},
	{<<"lighting-color">>, Record#glyph.lighting_color},
	{<<"marker-end">>, Record#glyph.marker_end},
	{<<"marker-mid">>, Record#glyph.marker_mid},
	{<<"marker-start">>, Record#glyph.marker_start},
	{<<"mask">>, Record#glyph.mask},
	{<<"opacity">>, Record#glyph.opacity},
	{<<"overflow">>, Record#glyph.overflow},
	{<<"pointer-events">>, Record#glyph.pointer_events},
	{<<"shape-rendering">>, Record#glyph.shape_rendering},
	{<<"stop-color">>, Record#glyph.stop_color},
	{<<"stop-opacity">>, Record#glyph.stop_opacity},
	{<<"stroke">>, Record#glyph.stroke},
	{<<"stroke-dasharray">>, Record#glyph.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#glyph.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#glyph.stroke_linecap},
	{<<"stroke-linejoin">>, Record#glyph.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#glyph.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#glyph.stroke_opacity},
	{<<"stroke-width">>, Record#glyph.stroke_width},
	{<<"text-anchor">>, Record#glyph.text_anchor},
	{<<"text-decoration">>, Record#glyph.text_decoration},
	{<<"text-rendering">>, Record#glyph.text_rendering},
	{<<"unicode-bidi">>, Record#glyph.unicode_bidi},
	{<<"visibility">>, Record#glyph.visibility},
	{<<"word-spacing">>, Record#glyph.word_spacing},
	{<<"writing-mode">>, Record#glyph.writing_mode}
].