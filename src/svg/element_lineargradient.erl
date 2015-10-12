-module(element_lineargradient).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"linearGradient">>, nitro:render(Record#linearGradient.body),
	lists:append([
		[
			{<<"id">>, Record#linearGradient.id},
			{<<"class">>, Record#linearGradient.class},
			{<<"style">>, Record#linearGradient.style},
			{<<"gradientUnits">>, Record#linearGradient.gradientUnits},
			{<<"gradientTransform">>, Record#linearGradient.gradientTransform},
			{<<"x1">>, Record#linearGradient.x1},
			{<<"x2">>, Record#linearGradient.x2},
			{<<"y1">>, Record#linearGradient.y1},
			{<<"y2">>, Record#linearGradient.y2},
			{<<"spreadMethod">>, Record#linearGradient.spreadMethod},
			{<<"externalResourcesRequired">>, Record#linearGradient.externalResourcesRequired}
		],
		svg_core(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#linearGradient.data_fields,
		Record#linearGradient.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#linearGradient.xmlbase},
	{<<"xml:lang">>, Record#linearGradient.xmllang},
	{<<"xml:space">>, Record#linearGradient.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#linearGradient.alignment_baseline},
	{<<"baseline-shift">>, Record#linearGradient.baseline_shift},
	{<<"clip">>, Record#linearGradient.clip},
	{<<"clip-path">>, Record#linearGradient.clip_path},
	{<<"clip-rule">>, Record#linearGradient.clip_rule},
	{<<"color">>, Record#linearGradient.color},
	{<<"color-interpolation">>, Record#linearGradient.color_interpolation},
	{<<"color-interpolation-filters">>, Record#linearGradient.color_interpolation_filters},
	{<<"color-profile">>, Record#linearGradient.color_profile},
	{<<"color-rendering">>, Record#linearGradient.color_rendering},
	{<<"cursor">>, Record#linearGradient.cursor},
	{<<"direction">>, Record#linearGradient.direction},
	{<<"display">>, Record#linearGradient.display},
	{<<"dominant-baseline">>, Record#linearGradient.dominant_baseline},
	{<<"enable-background">>, Record#linearGradient.enable_background},
	{<<"fill">>, Record#linearGradient.fill},
	{<<"fill-opacity">>, Record#linearGradient.fill_opacity},
	{<<"fill-rule">>, Record#linearGradient.fill_rule},
	{<<"filter">>, Record#linearGradient.filter},
	{<<"flood-color">>, Record#linearGradient.flood_color},
	{<<"flood-opacity">>, Record#linearGradient.flood_opacity},
	{<<"font-family">>, Record#linearGradient.font_family},
	{<<"font-size">>, Record#linearGradient.font_size},
	{<<"font-size-adjust">>, Record#linearGradient.font_size_adjust},
	{<<"font-stretch">>, Record#linearGradient.font_stretch},
	{<<"font-style">>, Record#linearGradient.font_style},
	{<<"font-variant">>, Record#linearGradient.font_variant},
	{<<"font-weight">>, Record#linearGradient.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#linearGradient.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#linearGradient.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#linearGradient.image_rendering},
	{<<"kerning">>, Record#linearGradient.kerning},
	{<<"letter-spacing">>, Record#linearGradient.letter_spacing},
	{<<"lighting-color">>, Record#linearGradient.lighting_color},
	{<<"marker-end">>, Record#linearGradient.marker_end},
	{<<"marker-mid">>, Record#linearGradient.marker_mid},
	{<<"marker-start">>, Record#linearGradient.marker_start},
	{<<"mask">>, Record#linearGradient.mask},
	{<<"opacity">>, Record#linearGradient.opacity},
	{<<"overflow">>, Record#linearGradient.overflow},
	{<<"pointer-events">>, Record#linearGradient.pointer_events},
	{<<"shape-rendering">>, Record#linearGradient.shape_rendering},
	{<<"stop-color">>, Record#linearGradient.stop_color},
	{<<"stop-opacity">>, Record#linearGradient.stop_opacity},
	{<<"stroke">>, Record#linearGradient.stroke},
	{<<"stroke-dasharray">>, Record#linearGradient.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#linearGradient.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#linearGradient.stroke_linecap},
	{<<"stroke-linejoin">>, Record#linearGradient.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#linearGradient.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#linearGradient.stroke_opacity},
	{<<"stroke-width">>, Record#linearGradient.stroke_width},
	{<<"text-anchor">>, Record#linearGradient.text_anchor},
	{<<"text-decoration">>, Record#linearGradient.text_decoration},
	{<<"text-rendering">>, Record#linearGradient.text_rendering},
	{<<"unicode-bidi">>, Record#linearGradient.unicode_bidi},
	{<<"visibility">>, Record#linearGradient.visibility},
	{<<"word-spacing">>, Record#linearGradient.word_spacing},
	{<<"writing-mode">>, Record#linearGradient.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#linearGradient.xlinkhref},
	{<<"xlink:type">>, Record#linearGradient.xlinktype},
	{<<"xlink:role">>, Record#linearGradient.xlinkrole},
	{<<"xlink:arcrole">>, Record#linearGradient.xlinkarcrole},
	{<<"xlink:title">>, Record#linearGradient.xlinktitle},
	{<<"xlink:show">>, Record#linearGradient.xlinkshow},
	{<<"xlink:actuate">>, Record#linearGradient.xlinkactuate}
].