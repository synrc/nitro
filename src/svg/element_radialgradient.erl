-module(element_radialgradient).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"radialGradient">>, nitro:render(Record#radialGradient.body),
	lists:append([
		[
			{<<"id">>, Record#radialGradient.id},
			{<<"class">>, Record#radialGradient.class},
			{<<"style">>, Record#radialGradient.style},
			{<<"gradientUnits">>, Record#radialGradient.gradientUnits},
			{<<"gradientTransform">>, Record#radialGradient.gradientTransform},
			{<<"cx">>, Record#radialGradient.cx},
			{<<"cy">>, Record#radialGradient.cy},
			{<<"r">>, Record#radialGradient.r},
			{<<"fx">>, Record#radialGradient.fx},
			{<<"fy">>, Record#radialGradient.fy},
			{<<"spreadMethod">>, Record#radialGradient.spreadMethod},
			{<<"externalResourcesRequired">>, Record#radialGradient.externalResourcesRequired}
		],
		svg_core(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#radialGradient.data_fields,
		Record#radialGradient.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#radialGradient.xmlbase},
	{<<"xml:lang">>, Record#radialGradient.xmllang},
	{<<"xml:space">>, Record#radialGradient.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#radialGradient.alignment_baseline},
	{<<"baseline-shift">>, Record#radialGradient.baseline_shift},
	{<<"clip">>, Record#radialGradient.clip},
	{<<"clip-path">>, Record#radialGradient.clip_path},
	{<<"clip-rule">>, Record#radialGradient.clip_rule},
	{<<"color">>, Record#radialGradient.color},
	{<<"color-interpolation">>, Record#radialGradient.color_interpolation},
	{<<"color-interpolation-filters">>, Record#radialGradient.color_interpolation_filters},
	{<<"color-profile">>, Record#radialGradient.color_profile},
	{<<"color-rendering">>, Record#radialGradient.color_rendering},
	{<<"cursor">>, Record#radialGradient.cursor},
	{<<"direction">>, Record#radialGradient.direction},
	{<<"display">>, Record#radialGradient.display},
	{<<"dominant-baseline">>, Record#radialGradient.dominant_baseline},
	{<<"enable-background">>, Record#radialGradient.enable_background},
	{<<"fill">>, Record#radialGradient.fill},
	{<<"fill-opacity">>, Record#radialGradient.fill_opacity},
	{<<"fill-rule">>, Record#radialGradient.fill_rule},
	{<<"filter">>, Record#radialGradient.filter},
	{<<"flood-color">>, Record#radialGradient.flood_color},
	{<<"flood-opacity">>, Record#radialGradient.flood_opacity},
	{<<"font-family">>, Record#radialGradient.font_family},
	{<<"font-size">>, Record#radialGradient.font_size},
	{<<"font-size-adjust">>, Record#radialGradient.font_size_adjust},
	{<<"font-stretch">>, Record#radialGradient.font_stretch},
	{<<"font-style">>, Record#radialGradient.font_style},
	{<<"font-variant">>, Record#radialGradient.font_variant},
	{<<"font-weight">>, Record#radialGradient.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#radialGradient.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#radialGradient.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#radialGradient.image_rendering},
	{<<"kerning">>, Record#radialGradient.kerning},
	{<<"letter-spacing">>, Record#radialGradient.letter_spacing},
	{<<"lighting-color">>, Record#radialGradient.lighting_color},
	{<<"marker-end">>, Record#radialGradient.marker_end},
	{<<"marker-mid">>, Record#radialGradient.marker_mid},
	{<<"marker-start">>, Record#radialGradient.marker_start},
	{<<"mask">>, Record#radialGradient.mask},
	{<<"opacity">>, Record#radialGradient.opacity},
	{<<"overflow">>, Record#radialGradient.overflow},
	{<<"pointer-events">>, Record#radialGradient.pointer_events},
	{<<"shape-rendering">>, Record#radialGradient.shape_rendering},
	{<<"stop-color">>, Record#radialGradient.stop_color},
	{<<"stop-opacity">>, Record#radialGradient.stop_opacity},
	{<<"stroke">>, Record#radialGradient.stroke},
	{<<"stroke-dasharray">>, Record#radialGradient.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#radialGradient.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#radialGradient.stroke_linecap},
	{<<"stroke-linejoin">>, Record#radialGradient.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#radialGradient.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#radialGradient.stroke_opacity},
	{<<"stroke-width">>, Record#radialGradient.stroke_width},
	{<<"text-anchor">>, Record#radialGradient.text_anchor},
	{<<"text-decoration">>, Record#radialGradient.text_decoration},
	{<<"text-rendering">>, Record#radialGradient.text_rendering},
	{<<"unicode-bidi">>, Record#radialGradient.unicode_bidi},
	{<<"visibility">>, Record#radialGradient.visibility},
	{<<"word-spacing">>, Record#radialGradient.word_spacing},
	{<<"writing-mode">>, Record#radialGradient.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#radialGradient.xlinkhref},
	{<<"xlink:type">>, Record#radialGradient.xlinktype},
	{<<"xlink:role">>, Record#radialGradient.xlinkrole},
	{<<"xlink:arcrole">>, Record#radialGradient.xlinkarcrole},
	{<<"xlink:title">>, Record#radialGradient.xlinktitle},
	{<<"xlink:show">>, Record#radialGradient.xlinkshow},
	{<<"xlink:actuate">>, Record#radialGradient.xlinkactuate}
].