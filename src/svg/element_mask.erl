-module(element_mask).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"mask">>, nitro:render(Record#mask.body),
	lists:append([
		[
			{<<"id">>, Record#mask.id},
			{<<"class">>, Record#mask.class},
			{<<"style">>, Record#mask.style},
			{<<"maskUnits">>, Record#mask.maskUnits},
			{<<"maskContentUnits">>, Record#mask.maskContentUnits},
			{<<"x">>, Record#mask.x},
			{<<"y">>, Record#mask.y},
			{<<"width">>, Record#mask.width},
			{<<"height">>, Record#mask.height},
			{<<"externalResourcesRequired">>, Record#mask.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_presentation(Record),
		Record#mask.data_fields,
		Record#mask.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#mask.requiredExtensions},
	{<<"requiredFeatures">>, Record#mask.requiredFeatures},
	{<<"systemLanguage">>, Record#mask.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#mask.xmlbase},
	{<<"xml:lang">>, Record#mask.xmllang},
	{<<"xml:space">>, Record#mask.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#mask.alignment_baseline},
	{<<"baseline-shift">>, Record#mask.baseline_shift},
	{<<"clip">>, Record#mask.clip},
	{<<"clip-path">>, Record#mask.clip_path},
	{<<"clip-rule">>, Record#mask.clip_rule},
	{<<"color">>, Record#mask.color},
	{<<"color-interpolation">>, Record#mask.color_interpolation},
	{<<"color-interpolation-filters">>, Record#mask.color_interpolation_filters},
	{<<"color-profile">>, Record#mask.color_profile},
	{<<"color-rendering">>, Record#mask.color_rendering},
	{<<"cursor">>, Record#mask.cursor},
	{<<"direction">>, Record#mask.direction},
	{<<"display">>, Record#mask.display},
	{<<"dominant-baseline">>, Record#mask.dominant_baseline},
	{<<"enable-background">>, Record#mask.enable_background},
	{<<"fill">>, Record#mask.fill},
	{<<"fill-opacity">>, Record#mask.fill_opacity},
	{<<"fill-rule">>, Record#mask.fill_rule},
	{<<"filter">>, Record#mask.filter},
	{<<"flood-color">>, Record#mask.flood_color},
	{<<"flood-opacity">>, Record#mask.flood_opacity},
	{<<"font-family">>, Record#mask.font_family},
	{<<"font-size">>, Record#mask.font_size},
	{<<"font-size-adjust">>, Record#mask.font_size_adjust},
	{<<"font-stretch">>, Record#mask.font_stretch},
	{<<"font-style">>, Record#mask.font_style},
	{<<"font-variant">>, Record#mask.font_variant},
	{<<"font-weight">>, Record#mask.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#mask.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#mask.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#mask.image_rendering},
	{<<"kerning">>, Record#mask.kerning},
	{<<"letter-spacing">>, Record#mask.letter_spacing},
	{<<"lighting-color">>, Record#mask.lighting_color},
	{<<"marker-end">>, Record#mask.marker_end},
	{<<"marker-mid">>, Record#mask.marker_mid},
	{<<"marker-start">>, Record#mask.marker_start},
	{<<"mask">>, Record#mask.mask},
	{<<"opacity">>, Record#mask.opacity},
	{<<"overflow">>, Record#mask.overflow},
	{<<"pointer-events">>, Record#mask.pointer_events},
	{<<"shape-rendering">>, Record#mask.shape_rendering},
	{<<"stop-color">>, Record#mask.stop_color},
	{<<"stop-opacity">>, Record#mask.stop_opacity},
	{<<"stroke">>, Record#mask.stroke},
	{<<"stroke-dasharray">>, Record#mask.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#mask.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#mask.stroke_linecap},
	{<<"stroke-linejoin">>, Record#mask.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#mask.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#mask.stroke_opacity},
	{<<"stroke-width">>, Record#mask.stroke_width},
	{<<"text-anchor">>, Record#mask.text_anchor},
	{<<"text-decoration">>, Record#mask.text_decoration},
	{<<"text-rendering">>, Record#mask.text_rendering},
	{<<"unicode-bidi">>, Record#mask.unicode_bidi},
	{<<"visibility">>, Record#mask.visibility},
	{<<"word-spacing">>, Record#mask.word_spacing},
	{<<"writing-mode">>, Record#mask.writing_mode}
].