-module(element_line).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"line">>, nitro:render(Record#line.body),
	lists:append([
		[
			{<<"id">>, Record#line.id},
			{<<"class">>, Record#line.class},
			{<<"style">>, Record#line.style},
			{<<"x1">>, Record#line.x1},
			{<<"x2">>, Record#line.x2},
			{<<"y1">>, Record#line.y1},
			{<<"y2">>, Record#line.y2},
			{<<"transform">>, Record#line.transform},
			{<<"externalResourcesRequired">>, Record#line.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#line.data_fields,
		Record#line.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#line.requiredExtensions},
	{<<"requiredFeatures">>, Record#line.requiredFeatures},
	{<<"systemLanguage">>, Record#line.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#line.xmlbase},
	{<<"xml:lang">>, Record#line.xmllang},
	{<<"xml:space">>, Record#line.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#line.onactivate},
	{<<"onclick">>, Record#line.onclick},
	{<<"onfocusin">>, Record#line.onfocusin},
	{<<"onfocusout">>, Record#line.onfocusout},
	{<<"onload">>, Record#line.onload_graphical},
	{<<"onmousedown">>, Record#line.onmousedown},
	{<<"onmousemove">>, Record#line.onmousemove},
	{<<"onmouseout">>, Record#line.onmouseout},
	{<<"onmouseover">>, Record#line.onmouseover},
	{<<"onmouseup">>, Record#line.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#line.alignment_baseline},
	{<<"baseline-shift">>, Record#line.baseline_shift},
	{<<"clip">>, Record#line.clip},
	{<<"clip-path">>, Record#line.clip_path},
	{<<"clip-rule">>, Record#line.clip_rule},
	{<<"color">>, Record#line.color},
	{<<"color-interpolation">>, Record#line.color_interpolation},
	{<<"color-interpolation-filters">>, Record#line.color_interpolation_filters},
	{<<"color-profile">>, Record#line.color_profile},
	{<<"color-rendering">>, Record#line.color_rendering},
	{<<"cursor">>, Record#line.cursor},
	{<<"direction">>, Record#line.direction},
	{<<"display">>, Record#line.display},
	{<<"dominant-baseline">>, Record#line.dominant_baseline},
	{<<"enable-background">>, Record#line.enable_background},
	{<<"fill">>, Record#line.fill},
	{<<"fill-opacity">>, Record#line.fill_opacity},
	{<<"fill-rule">>, Record#line.fill_rule},
	{<<"filter">>, Record#line.filter},
	{<<"flood-color">>, Record#line.flood_color},
	{<<"flood-opacity">>, Record#line.flood_opacity},
	{<<"font-family">>, Record#line.font_family},
	{<<"font-size">>, Record#line.font_size},
	{<<"font-size-adjust">>, Record#line.font_size_adjust},
	{<<"font-stretch">>, Record#line.font_stretch},
	{<<"font-style">>, Record#line.font_style},
	{<<"font-variant">>, Record#line.font_variant},
	{<<"font-weight">>, Record#line.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#line.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#line.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#line.image_rendering},
	{<<"kerning">>, Record#line.kerning},
	{<<"letter-spacing">>, Record#line.letter_spacing},
	{<<"lighting-color">>, Record#line.lighting_color},
	{<<"marker-end">>, Record#line.marker_end},
	{<<"marker-mid">>, Record#line.marker_mid},
	{<<"marker-start">>, Record#line.marker_start},
	{<<"mask">>, Record#line.mask},
	{<<"opacity">>, Record#line.opacity},
	{<<"overflow">>, Record#line.overflow},
	{<<"pointer-events">>, Record#line.pointer_events},
	{<<"shape-rendering">>, Record#line.shape_rendering},
	{<<"stop-color">>, Record#line.stop_color},
	{<<"stop-opacity">>, Record#line.stop_opacity},
	{<<"stroke">>, Record#line.stroke},
	{<<"stroke-dasharray">>, Record#line.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#line.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#line.stroke_linecap},
	{<<"stroke-linejoin">>, Record#line.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#line.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#line.stroke_opacity},
	{<<"stroke-width">>, Record#line.stroke_width},
	{<<"text-anchor">>, Record#line.text_anchor},
	{<<"text-decoration">>, Record#line.text_decoration},
	{<<"text-rendering">>, Record#line.text_rendering},
	{<<"unicode-bidi">>, Record#line.unicode_bidi},
	{<<"visibility">>, Record#line.visibility},
	{<<"word-spacing">>, Record#line.word_spacing},
	{<<"writing-mode">>, Record#line.writing_mode}
].