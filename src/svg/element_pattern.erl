-module(element_pattern).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"pattern">>, nitro:render(Record#pattern.body),
	lists:append([
		[
			{<<"id">>, Record#pattern.id},
			{<<"class">>, Record#pattern.class},
			{<<"style">>, Record#pattern.style},
			{<<"patternUnits">>, Record#pattern.patternUnits},
			{<<"patternContentUnits">>, Record#pattern.patternContentUnits},
			{<<"patternTransform">>, Record#pattern.patternTransform},
			{<<"x">>, Record#pattern.x},
			{<<"y">>, Record#pattern.y},
			{<<"width">>, Record#pattern.width},
			{<<"height">>, Record#pattern.height},
			{<<"preserveAspectRatio">>, Record#pattern.preserveAspectRatio},
			{<<"viewBox">>, Record#pattern.viewBox},
			{<<"externalResourcesRequired">>, Record#pattern.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#pattern.data_fields,
		Record#pattern.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#pattern.requiredExtensions},
	{<<"requiredFeatures">>, Record#pattern.requiredFeatures},
	{<<"systemLanguage">>, Record#pattern.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#pattern.xmlbase},
	{<<"xml:lang">>, Record#pattern.xmllang},
	{<<"xml:space">>, Record#pattern.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#pattern.alignment_baseline},
	{<<"baseline-shift">>, Record#pattern.baseline_shift},
	{<<"clip">>, Record#pattern.clip},
	{<<"clip-path">>, Record#pattern.clip_path},
	{<<"clip-rule">>, Record#pattern.clip_rule},
	{<<"color">>, Record#pattern.color},
	{<<"color-interpolation">>, Record#pattern.color_interpolation},
	{<<"color-interpolation-filters">>, Record#pattern.color_interpolation_filters},
	{<<"color-profile">>, Record#pattern.color_profile},
	{<<"color-rendering">>, Record#pattern.color_rendering},
	{<<"cursor">>, Record#pattern.cursor},
	{<<"direction">>, Record#pattern.direction},
	{<<"display">>, Record#pattern.display},
	{<<"dominant-baseline">>, Record#pattern.dominant_baseline},
	{<<"enable-background">>, Record#pattern.enable_background},
	{<<"fill">>, Record#pattern.fill},
	{<<"fill-opacity">>, Record#pattern.fill_opacity},
	{<<"fill-rule">>, Record#pattern.fill_rule},
	{<<"filter">>, Record#pattern.filter},
	{<<"flood-color">>, Record#pattern.flood_color},
	{<<"flood-opacity">>, Record#pattern.flood_opacity},
	{<<"font-family">>, Record#pattern.font_family},
	{<<"font-size">>, Record#pattern.font_size},
	{<<"font-size-adjust">>, Record#pattern.font_size_adjust},
	{<<"font-stretch">>, Record#pattern.font_stretch},
	{<<"font-style">>, Record#pattern.font_style},
	{<<"font-variant">>, Record#pattern.font_variant},
	{<<"font-weight">>, Record#pattern.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#pattern.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#pattern.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#pattern.image_rendering},
	{<<"kerning">>, Record#pattern.kerning},
	{<<"letter-spacing">>, Record#pattern.letter_spacing},
	{<<"lighting-color">>, Record#pattern.lighting_color},
	{<<"marker-end">>, Record#pattern.marker_end},
	{<<"marker-mid">>, Record#pattern.marker_mid},
	{<<"marker-start">>, Record#pattern.marker_start},
	{<<"mask">>, Record#pattern.mask},
	{<<"opacity">>, Record#pattern.opacity},
	{<<"overflow">>, Record#pattern.overflow},
	{<<"pointer-events">>, Record#pattern.pointer_events},
	{<<"shape-rendering">>, Record#pattern.shape_rendering},
	{<<"stop-color">>, Record#pattern.stop_color},
	{<<"stop-opacity">>, Record#pattern.stop_opacity},
	{<<"stroke">>, Record#pattern.stroke},
	{<<"stroke-dasharray">>, Record#pattern.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#pattern.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#pattern.stroke_linecap},
	{<<"stroke-linejoin">>, Record#pattern.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#pattern.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#pattern.stroke_opacity},
	{<<"stroke-width">>, Record#pattern.stroke_width},
	{<<"text-anchor">>, Record#pattern.text_anchor},
	{<<"text-decoration">>, Record#pattern.text_decoration},
	{<<"text-rendering">>, Record#pattern.text_rendering},
	{<<"unicode-bidi">>, Record#pattern.unicode_bidi},
	{<<"visibility">>, Record#pattern.visibility},
	{<<"word-spacing">>, Record#pattern.word_spacing},
	{<<"writing-mode">>, Record#pattern.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#pattern.xlinkhref},
	{<<"xlink:type">>, Record#pattern.xlinktype},
	{<<"xlink:role">>, Record#pattern.xlinkrole},
	{<<"xlink:arcrole">>, Record#pattern.xlinkarcrole},
	{<<"xlink:title">>, Record#pattern.xlinktitle},
	{<<"xlink:show">>, Record#pattern.xlinkshow},
	{<<"xlink:actuate">>, Record#pattern.xlinkactuate}
].