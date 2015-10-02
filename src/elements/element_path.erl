-module(element_path).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"path">>, nitro:render(Record#path.body),
	lists:append([
		[
			{<<"id">>, Record#path.id},
			{<<"class">>, Record#path.class},
			{<<"style">>, Record#path.style},
			{<<"d">>, Record#path.d},
			{<<"pathLength">>, Record#path.pathLength},
			{<<"transform">>, Record#path.transform},
			{<<"externalResourcesRequired">>, Record#path.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#path.data_fields,
		Record#path.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#path.requiredExtensions},
	{<<"requiredFeatures">>, Record#path.requiredFeatures},
	{<<"systemLanguage">>, Record#path.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#path.xmlbase},
	{<<"xml:lang">>, Record#path.xmllang},
	{<<"xml:space">>, Record#path.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#path.onactivate},
	{<<"onclick">>, Record#path.onclick},
	{<<"onfocusin">>, Record#path.onfocusin},
	{<<"onfocusout">>, Record#path.onfocusout},
	{<<"onload">>, Record#path.onload_graphical},
	{<<"onmousedown">>, Record#path.onmousedown},
	{<<"onmousemove">>, Record#path.onmousemove},
	{<<"onmouseout">>, Record#path.onmouseout},
	{<<"onmouseover">>, Record#path.onmouseover},
	{<<"onmouseup">>, Record#path.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#path.alignment_baseline},
	{<<"baseline-shift">>, Record#path.baseline_shift},
	{<<"clip">>, Record#path.clip},
	{<<"clip-path">>, Record#path.clip_path},
	{<<"clip-rule">>, Record#path.clip_rule},
	{<<"color">>, Record#path.color},
	{<<"color-interpolation">>, Record#path.color_interpolation},
	{<<"color-interpolation-filters">>, Record#path.color_interpolation_filters},
	{<<"color-profile">>, Record#path.color_profile},
	{<<"color-rendering">>, Record#path.color_rendering},
	{<<"cursor">>, Record#path.cursor},
	{<<"direction">>, Record#path.direction},
	{<<"display">>, Record#path.display},
	{<<"dominant-baseline">>, Record#path.dominant_baseline},
	{<<"enable-background">>, Record#path.enable_background},
	{<<"fill">>, Record#path.fill},
	{<<"fill-opacity">>, Record#path.fill_opacity},
	{<<"fill-rule">>, Record#path.fill_rule},
	{<<"filter">>, Record#path.filter},
	{<<"flood-color">>, Record#path.flood_color},
	{<<"flood-opacity">>, Record#path.flood_opacity},
	{<<"font-family">>, Record#path.font_family},
	{<<"font-size">>, Record#path.font_size},
	{<<"font-size-adjust">>, Record#path.font_size_adjust},
	{<<"font-stretch">>, Record#path.font_stretch},
	{<<"font-style">>, Record#path.font_style},
	{<<"font-variant">>, Record#path.font_variant},
	{<<"font-weight">>, Record#path.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#path.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#path.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#path.image_rendering},
	{<<"kerning">>, Record#path.kerning},
	{<<"letter-spacing">>, Record#path.letter_spacing},
	{<<"lighting-color">>, Record#path.lighting_color},
	{<<"marker-end">>, Record#path.marker_end},
	{<<"marker-mid">>, Record#path.marker_mid},
	{<<"marker-start">>, Record#path.marker_start},
	{<<"mask">>, Record#path.mask},
	{<<"opacity">>, Record#path.opacity},
	{<<"overflow">>, Record#path.overflow},
	{<<"pointer-events">>, Record#path.pointer_events},
	{<<"shape-rendering">>, Record#path.shape_rendering},
	{<<"stop-color">>, Record#path.stop_color},
	{<<"stop-opacity">>, Record#path.stop_opacity},
	{<<"stroke">>, Record#path.stroke},
	{<<"stroke-dasharray">>, Record#path.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#path.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#path.stroke_linecap},
	{<<"stroke-linejoin">>, Record#path.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#path.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#path.stroke_opacity},
	{<<"stroke-width">>, Record#path.stroke_width},
	{<<"text-anchor">>, Record#path.text_anchor},
	{<<"text-decoration">>, Record#path.text_decoration},
	{<<"text-rendering">>, Record#path.text_rendering},
	{<<"unicode-bidi">>, Record#path.unicode_bidi},
	{<<"visibility">>, Record#path.visibility},
	{<<"word-spacing">>, Record#path.word_spacing},
	{<<"writing-mode">>, Record#path.writing_mode}
].