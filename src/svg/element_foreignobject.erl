-module(element_foreignobject).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"foreignObject">>, nitro:render(Record#foreignObject.body),
	lists:append([
		[
			{<<"id">>, Record#foreignObject.id},
			{<<"class">>, Record#foreignObject.class},
			{<<"style">>, Record#foreignObject.style},
			{<<"x">>, Record#foreignObject.x},
			{<<"y">>, Record#foreignObject.y},
			{<<"width">>, Record#foreignObject.width},
			{<<"height">>, Record#foreignObject.height},
			{<<"transform">>, Record#foreignObject.transform},
			{<<"externalResourcesRequired">>, Record#foreignObject.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#foreignObject.data_fields,
		Record#foreignObject.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#foreignObject.requiredExtensions},
	{<<"requiredFeatures">>, Record#foreignObject.requiredFeatures},
	{<<"systemLanguage">>, Record#foreignObject.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#foreignObject.xmlbase},
	{<<"xml:lang">>, Record#foreignObject.xmllang},
	{<<"xml:space">>, Record#foreignObject.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#foreignObject.onactivate},
	{<<"onclick">>, Record#foreignObject.onclick},
	{<<"onfocusin">>, Record#foreignObject.onfocusin},
	{<<"onfocusout">>, Record#foreignObject.onfocusout},
	{<<"onload">>, Record#foreignObject.onload_graphical},
	{<<"onmousedown">>, Record#foreignObject.onmousedown},
	{<<"onmousemove">>, Record#foreignObject.onmousemove},
	{<<"onmouseout">>, Record#foreignObject.onmouseout},
	{<<"onmouseover">>, Record#foreignObject.onmouseover},
	{<<"onmouseup">>, Record#foreignObject.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#foreignObject.alignment_baseline},
	{<<"baseline-shift">>, Record#foreignObject.baseline_shift},
	{<<"clip">>, Record#foreignObject.clip},
	{<<"clip-path">>, Record#foreignObject.clip_path},
	{<<"clip-rule">>, Record#foreignObject.clip_rule},
	{<<"color">>, Record#foreignObject.color},
	{<<"color-interpolation">>, Record#foreignObject.color_interpolation},
	{<<"color-interpolation-filters">>, Record#foreignObject.color_interpolation_filters},
	{<<"color-profile">>, Record#foreignObject.color_profile},
	{<<"color-rendering">>, Record#foreignObject.color_rendering},
	{<<"cursor">>, Record#foreignObject.cursor},
	{<<"direction">>, Record#foreignObject.direction},
	{<<"display">>, Record#foreignObject.display},
	{<<"dominant-baseline">>, Record#foreignObject.dominant_baseline},
	{<<"enable-background">>, Record#foreignObject.enable_background},
	{<<"fill">>, Record#foreignObject.fill},
	{<<"fill-opacity">>, Record#foreignObject.fill_opacity},
	{<<"fill-rule">>, Record#foreignObject.fill_rule},
	{<<"filter">>, Record#foreignObject.filter},
	{<<"flood-color">>, Record#foreignObject.flood_color},
	{<<"flood-opacity">>, Record#foreignObject.flood_opacity},
	{<<"font-family">>, Record#foreignObject.font_family},
	{<<"font-size">>, Record#foreignObject.font_size},
	{<<"font-size-adjust">>, Record#foreignObject.font_size_adjust},
	{<<"font-stretch">>, Record#foreignObject.font_stretch},
	{<<"font-style">>, Record#foreignObject.font_style},
	{<<"font-variant">>, Record#foreignObject.font_variant},
	{<<"font-weight">>, Record#foreignObject.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#foreignObject.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#foreignObject.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#foreignObject.image_rendering},
	{<<"kerning">>, Record#foreignObject.kerning},
	{<<"letter-spacing">>, Record#foreignObject.letter_spacing},
	{<<"lighting-color">>, Record#foreignObject.lighting_color},
	{<<"marker-end">>, Record#foreignObject.marker_end},
	{<<"marker-mid">>, Record#foreignObject.marker_mid},
	{<<"marker-start">>, Record#foreignObject.marker_start},
	{<<"mask">>, Record#foreignObject.mask},
	{<<"opacity">>, Record#foreignObject.opacity},
	{<<"overflow">>, Record#foreignObject.overflow},
	{<<"pointer-events">>, Record#foreignObject.pointer_events},
	{<<"shape-rendering">>, Record#foreignObject.shape_rendering},
	{<<"stop-color">>, Record#foreignObject.stop_color},
	{<<"stop-opacity">>, Record#foreignObject.stop_opacity},
	{<<"stroke">>, Record#foreignObject.stroke},
	{<<"stroke-dasharray">>, Record#foreignObject.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#foreignObject.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#foreignObject.stroke_linecap},
	{<<"stroke-linejoin">>, Record#foreignObject.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#foreignObject.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#foreignObject.stroke_opacity},
	{<<"stroke-width">>, Record#foreignObject.stroke_width},
	{<<"text-anchor">>, Record#foreignObject.text_anchor},
	{<<"text-decoration">>, Record#foreignObject.text_decoration},
	{<<"text-rendering">>, Record#foreignObject.text_rendering},
	{<<"unicode-bidi">>, Record#foreignObject.unicode_bidi},
	{<<"visibility">>, Record#foreignObject.visibility},
	{<<"word-spacing">>, Record#foreignObject.word_spacing},
	{<<"writing-mode">>, Record#foreignObject.writing_mode}
].