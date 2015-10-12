-module(element_polyline).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"polyline">>, nitro:render(Record#polyline.body),
	lists:append([
		[
			{<<"id">>, Record#polyline.id},
			{<<"class">>, Record#polyline.class},
			{<<"style">>, Record#polyline.style},
			{<<"points">>, Record#polyline.points},
			{<<"transform">>, Record#polyline.transform},
			{<<"externalResourcesRequired">>, Record#polyline.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#polyline.data_fields,
		Record#polyline.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#polyline.requiredExtensions},
	{<<"requiredFeatures">>, Record#polyline.requiredFeatures},
	{<<"systemLanguage">>, Record#polyline.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#polyline.xmlbase},
	{<<"xml:lang">>, Record#polyline.xmllang},
	{<<"xml:space">>, Record#polyline.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#polyline.onactivate},
	{<<"onclick">>, Record#polyline.onclick},
	{<<"onfocusin">>, Record#polyline.onfocusin},
	{<<"onfocusout">>, Record#polyline.onfocusout},
	{<<"onload">>, Record#polyline.onload_graphical},
	{<<"onmousedown">>, Record#polyline.onmousedown},
	{<<"onmousemove">>, Record#polyline.onmousemove},
	{<<"onmouseout">>, Record#polyline.onmouseout},
	{<<"onmouseover">>, Record#polyline.onmouseover},
	{<<"onmouseup">>, Record#polyline.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#polyline.alignment_baseline},
	{<<"baseline-shift">>, Record#polyline.baseline_shift},
	{<<"clip">>, Record#polyline.clip},
	{<<"clip-path">>, Record#polyline.clip_path},
	{<<"clip-rule">>, Record#polyline.clip_rule},
	{<<"color">>, Record#polyline.color},
	{<<"color-interpolation">>, Record#polyline.color_interpolation},
	{<<"color-interpolation-filters">>, Record#polyline.color_interpolation_filters},
	{<<"color-profile">>, Record#polyline.color_profile},
	{<<"color-rendering">>, Record#polyline.color_rendering},
	{<<"cursor">>, Record#polyline.cursor},
	{<<"direction">>, Record#polyline.direction},
	{<<"display">>, Record#polyline.display},
	{<<"dominant-baseline">>, Record#polyline.dominant_baseline},
	{<<"enable-background">>, Record#polyline.enable_background},
	{<<"fill">>, Record#polyline.fill},
	{<<"fill-opacity">>, Record#polyline.fill_opacity},
	{<<"fill-rule">>, Record#polyline.fill_rule},
	{<<"filter">>, Record#polyline.filter},
	{<<"flood-color">>, Record#polyline.flood_color},
	{<<"flood-opacity">>, Record#polyline.flood_opacity},
	{<<"font-family">>, Record#polyline.font_family},
	{<<"font-size">>, Record#polyline.font_size},
	{<<"font-size-adjust">>, Record#polyline.font_size_adjust},
	{<<"font-stretch">>, Record#polyline.font_stretch},
	{<<"font-style">>, Record#polyline.font_style},
	{<<"font-variant">>, Record#polyline.font_variant},
	{<<"font-weight">>, Record#polyline.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#polyline.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#polyline.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#polyline.image_rendering},
	{<<"kerning">>, Record#polyline.kerning},
	{<<"letter-spacing">>, Record#polyline.letter_spacing},
	{<<"lighting-color">>, Record#polyline.lighting_color},
	{<<"marker-end">>, Record#polyline.marker_end},
	{<<"marker-mid">>, Record#polyline.marker_mid},
	{<<"marker-start">>, Record#polyline.marker_start},
	{<<"mask">>, Record#polyline.mask},
	{<<"opacity">>, Record#polyline.opacity},
	{<<"overflow">>, Record#polyline.overflow},
	{<<"pointer-events">>, Record#polyline.pointer_events},
	{<<"shape-rendering">>, Record#polyline.shape_rendering},
	{<<"stop-color">>, Record#polyline.stop_color},
	{<<"stop-opacity">>, Record#polyline.stop_opacity},
	{<<"stroke">>, Record#polyline.stroke},
	{<<"stroke-dasharray">>, Record#polyline.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#polyline.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#polyline.stroke_linecap},
	{<<"stroke-linejoin">>, Record#polyline.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#polyline.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#polyline.stroke_opacity},
	{<<"stroke-width">>, Record#polyline.stroke_width},
	{<<"text-anchor">>, Record#polyline.text_anchor},
	{<<"text-decoration">>, Record#polyline.text_decoration},
	{<<"text-rendering">>, Record#polyline.text_rendering},
	{<<"unicode-bidi">>, Record#polyline.unicode_bidi},
	{<<"visibility">>, Record#polyline.visibility},
	{<<"word-spacing">>, Record#polyline.word_spacing},
	{<<"writing-mode">>, Record#polyline.writing_mode}
].