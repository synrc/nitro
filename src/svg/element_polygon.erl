-module(element_polygon).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"polygon">>, nitro:render(Record#polygon.body),
	lists:append([
		[
			{<<"id">>, Record#polygon.id},
			{<<"class">>, Record#polygon.class},
			{<<"style">>, Record#polygon.style},
			{<<"points">>, Record#polygon.points},
			{<<"transform">>, Record#polygon.transform},
			{<<"externalResourcesRequired">>, Record#polygon.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#polygon.data_fields,
		Record#polygon.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#polygon.requiredExtensions},
	{<<"requiredFeatures">>, Record#polygon.requiredFeatures},
	{<<"systemLanguage">>, Record#polygon.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#polygon.xmlbase},
	{<<"xml:lang">>, Record#polygon.xmllang},
	{<<"xml:space">>, Record#polygon.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#polygon.onactivate},
	{<<"onclick">>, Record#polygon.onclick},
	{<<"onfocusin">>, Record#polygon.onfocusin},
	{<<"onfocusout">>, Record#polygon.onfocusout},
	{<<"onload">>, Record#polygon.onload_graphical},
	{<<"onmousedown">>, Record#polygon.onmousedown},
	{<<"onmousemove">>, Record#polygon.onmousemove},
	{<<"onmouseout">>, Record#polygon.onmouseout},
	{<<"onmouseover">>, Record#polygon.onmouseover},
	{<<"onmouseup">>, Record#polygon.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#polygon.alignment_baseline},
	{<<"baseline-shift">>, Record#polygon.baseline_shift},
	{<<"clip">>, Record#polygon.clip},
	{<<"clip-path">>, Record#polygon.clip_path},
	{<<"clip-rule">>, Record#polygon.clip_rule},
	{<<"color">>, Record#polygon.color},
	{<<"color-interpolation">>, Record#polygon.color_interpolation},
	{<<"color-interpolation-filters">>, Record#polygon.color_interpolation_filters},
	{<<"color-profile">>, Record#polygon.color_profile},
	{<<"color-rendering">>, Record#polygon.color_rendering},
	{<<"cursor">>, Record#polygon.cursor},
	{<<"direction">>, Record#polygon.direction},
	{<<"display">>, Record#polygon.display},
	{<<"dominant-baseline">>, Record#polygon.dominant_baseline},
	{<<"enable-background">>, Record#polygon.enable_background},
	{<<"fill">>, Record#polygon.fill},
	{<<"fill-opacity">>, Record#polygon.fill_opacity},
	{<<"fill-rule">>, Record#polygon.fill_rule},
	{<<"filter">>, Record#polygon.filter},
	{<<"flood-color">>, Record#polygon.flood_color},
	{<<"flood-opacity">>, Record#polygon.flood_opacity},
	{<<"font-family">>, Record#polygon.font_family},
	{<<"font-size">>, Record#polygon.font_size},
	{<<"font-size-adjust">>, Record#polygon.font_size_adjust},
	{<<"font-stretch">>, Record#polygon.font_stretch},
	{<<"font-style">>, Record#polygon.font_style},
	{<<"font-variant">>, Record#polygon.font_variant},
	{<<"font-weight">>, Record#polygon.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#polygon.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#polygon.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#polygon.image_rendering},
	{<<"kerning">>, Record#polygon.kerning},
	{<<"letter-spacing">>, Record#polygon.letter_spacing},
	{<<"lighting-color">>, Record#polygon.lighting_color},
	{<<"marker-end">>, Record#polygon.marker_end},
	{<<"marker-mid">>, Record#polygon.marker_mid},
	{<<"marker-start">>, Record#polygon.marker_start},
	{<<"mask">>, Record#polygon.mask},
	{<<"opacity">>, Record#polygon.opacity},
	{<<"overflow">>, Record#polygon.overflow},
	{<<"pointer-events">>, Record#polygon.pointer_events},
	{<<"shape-rendering">>, Record#polygon.shape_rendering},
	{<<"stop-color">>, Record#polygon.stop_color},
	{<<"stop-opacity">>, Record#polygon.stop_opacity},
	{<<"stroke">>, Record#polygon.stroke},
	{<<"stroke-dasharray">>, Record#polygon.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#polygon.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#polygon.stroke_linecap},
	{<<"stroke-linejoin">>, Record#polygon.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#polygon.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#polygon.stroke_opacity},
	{<<"stroke-width">>, Record#polygon.stroke_width},
	{<<"text-anchor">>, Record#polygon.text_anchor},
	{<<"text-decoration">>, Record#polygon.text_decoration},
	{<<"text-rendering">>, Record#polygon.text_rendering},
	{<<"unicode-bidi">>, Record#polygon.unicode_bidi},
	{<<"visibility">>, Record#polygon.visibility},
	{<<"word-spacing">>, Record#polygon.word_spacing},
	{<<"writing-mode">>, Record#polygon.writing_mode}
].