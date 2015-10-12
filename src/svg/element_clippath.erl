-module(element_clippath).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"clipPath">>, nitro:render(Record#clipPath.body),
	lists:append([
		[
			{<<"id">>, Record#clipPath.id},
			{<<"class">>, Record#clipPath.class},
			{<<"style">>, Record#clipPath.style},
			{<<"clipPathUnits">>, Record#clipPath.clipPathUnits},
			{<<"transform">>, Record#clipPath.transform},
			{<<"externalResourcesRequired">>, Record#clipPath.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_presentation(Record),
		Record#clipPath.data_fields,
		Record#clipPath.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#clipPath.requiredExtensions},
	{<<"requiredFeatures">>, Record#clipPath.requiredFeatures},
	{<<"systemLanguage">>, Record#clipPath.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#clipPath.xmlbase},
	{<<"xml:lang">>, Record#clipPath.xmllang},
	{<<"xml:space">>, Record#clipPath.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#clipPath.alignment_baseline},
	{<<"baseline-shift">>, Record#clipPath.baseline_shift},
	{<<"clip">>, Record#clipPath.clip},
	{<<"clip-path">>, Record#clipPath.clip_path},
	{<<"clip-rule">>, Record#clipPath.clip_rule},
	{<<"color">>, Record#clipPath.color},
	{<<"color-interpolation">>, Record#clipPath.color_interpolation},
	{<<"color-interpolation-filters">>, Record#clipPath.color_interpolation_filters},
	{<<"color-profile">>, Record#clipPath.color_profile},
	{<<"color-rendering">>, Record#clipPath.color_rendering},
	{<<"cursor">>, Record#clipPath.cursor},
	{<<"direction">>, Record#clipPath.direction},
	{<<"display">>, Record#clipPath.display},
	{<<"dominant-baseline">>, Record#clipPath.dominant_baseline},
	{<<"enable-background">>, Record#clipPath.enable_background},
	{<<"fill">>, Record#clipPath.fill},
	{<<"fill-opacity">>, Record#clipPath.fill_opacity},
	{<<"fill-rule">>, Record#clipPath.fill_rule},
	{<<"filter">>, Record#clipPath.filter},
	{<<"flood-color">>, Record#clipPath.flood_color},
	{<<"flood-opacity">>, Record#clipPath.flood_opacity},
	{<<"font-family">>, Record#clipPath.font_family},
	{<<"font-size">>, Record#clipPath.font_size},
	{<<"font-size-adjust">>, Record#clipPath.font_size_adjust},
	{<<"font-stretch">>, Record#clipPath.font_stretch},
	{<<"font-style">>, Record#clipPath.font_style},
	{<<"font-variant">>, Record#clipPath.font_variant},
	{<<"font-weight">>, Record#clipPath.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#clipPath.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#clipPath.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#clipPath.image_rendering},
	{<<"kerning">>, Record#clipPath.kerning},
	{<<"letter-spacing">>, Record#clipPath.letter_spacing},
	{<<"lighting-color">>, Record#clipPath.lighting_color},
	{<<"marker-end">>, Record#clipPath.marker_end},
	{<<"marker-mid">>, Record#clipPath.marker_mid},
	{<<"marker-start">>, Record#clipPath.marker_start},
	{<<"mask">>, Record#clipPath.mask},
	{<<"opacity">>, Record#clipPath.opacity},
	{<<"overflow">>, Record#clipPath.overflow},
	{<<"pointer-events">>, Record#clipPath.pointer_events},
	{<<"shape-rendering">>, Record#clipPath.shape_rendering},
	{<<"stop-color">>, Record#clipPath.stop_color},
	{<<"stop-opacity">>, Record#clipPath.stop_opacity},
	{<<"stroke">>, Record#clipPath.stroke},
	{<<"stroke-dasharray">>, Record#clipPath.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#clipPath.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#clipPath.stroke_linecap},
	{<<"stroke-linejoin">>, Record#clipPath.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#clipPath.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#clipPath.stroke_opacity},
	{<<"stroke-width">>, Record#clipPath.stroke_width},
	{<<"text-anchor">>, Record#clipPath.text_anchor},
	{<<"text-decoration">>, Record#clipPath.text_decoration},
	{<<"text-rendering">>, Record#clipPath.text_rendering},
	{<<"unicode-bidi">>, Record#clipPath.unicode_bidi},
	{<<"visibility">>, Record#clipPath.visibility},
	{<<"word-spacing">>, Record#clipPath.word_spacing},
	{<<"writing-mode">>, Record#clipPath.writing_mode}
].