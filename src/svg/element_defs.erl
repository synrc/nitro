-module(element_defs).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"defs">>, nitro:render(Record#defs.body),
	lists:append([
		[
			{<<"id">>, Record#defs.id},
			{<<"class">>, Record#defs.class},
			{<<"style">>, Record#defs.style},
			{<<"transform">>, Record#defs.transform},
			{<<"externalResourcesRequired">>, Record#defs.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#defs.data_fields,
		Record#defs.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#defs.requiredExtensions},
	{<<"requiredFeatures">>, Record#defs.requiredFeatures},
	{<<"systemLanguage">>, Record#defs.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#defs.xmlbase},
	{<<"xml:lang">>, Record#defs.xmllang},
	{<<"xml:space">>, Record#defs.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#defs.onactivate},
	{<<"onclick">>, Record#defs.onclick},
	{<<"onfocusin">>, Record#defs.onfocusin},
	{<<"onfocusout">>, Record#defs.onfocusout},
	{<<"onload">>, Record#defs.onload_graphical},
	{<<"onmousedown">>, Record#defs.onmousedown},
	{<<"onmousemove">>, Record#defs.onmousemove},
	{<<"onmouseout">>, Record#defs.onmouseout},
	{<<"onmouseover">>, Record#defs.onmouseover},
	{<<"onmouseup">>, Record#defs.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#defs.alignment_baseline},
	{<<"baseline-shift">>, Record#defs.baseline_shift},
	{<<"clip">>, Record#defs.clip},
	{<<"clip-path">>, Record#defs.clip_path},
	{<<"clip-rule">>, Record#defs.clip_rule},
	{<<"color">>, Record#defs.color},
	{<<"color-interpolation">>, Record#defs.color_interpolation},
	{<<"color-interpolation-filters">>, Record#defs.color_interpolation_filters},
	{<<"color-profile">>, Record#defs.color_profile},
	{<<"color-rendering">>, Record#defs.color_rendering},
	{<<"cursor">>, Record#defs.cursor},
	{<<"direction">>, Record#defs.direction},
	{<<"display">>, Record#defs.display},
	{<<"dominant-baseline">>, Record#defs.dominant_baseline},
	{<<"enable-background">>, Record#defs.enable_background},
	{<<"fill">>, Record#defs.fill},
	{<<"fill-opacity">>, Record#defs.fill_opacity},
	{<<"fill-rule">>, Record#defs.fill_rule},
	{<<"filter">>, Record#defs.filter},
	{<<"flood-color">>, Record#defs.flood_color},
	{<<"flood-opacity">>, Record#defs.flood_opacity},
	{<<"font-family">>, Record#defs.font_family},
	{<<"font-size">>, Record#defs.font_size},
	{<<"font-size-adjust">>, Record#defs.font_size_adjust},
	{<<"font-stretch">>, Record#defs.font_stretch},
	{<<"font-style">>, Record#defs.font_style},
	{<<"font-variant">>, Record#defs.font_variant},
	{<<"font-weight">>, Record#defs.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#defs.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#defs.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#defs.image_rendering},
	{<<"kerning">>, Record#defs.kerning},
	{<<"letter-spacing">>, Record#defs.letter_spacing},
	{<<"lighting-color">>, Record#defs.lighting_color},
	{<<"marker-end">>, Record#defs.marker_end},
	{<<"marker-mid">>, Record#defs.marker_mid},
	{<<"marker-start">>, Record#defs.marker_start},
	{<<"mask">>, Record#defs.mask},
	{<<"opacity">>, Record#defs.opacity},
	{<<"overflow">>, Record#defs.overflow},
	{<<"pointer-events">>, Record#defs.pointer_events},
	{<<"shape-rendering">>, Record#defs.shape_rendering},
	{<<"stop-color">>, Record#defs.stop_color},
	{<<"stop-opacity">>, Record#defs.stop_opacity},
	{<<"stroke">>, Record#defs.stroke},
	{<<"stroke-dasharray">>, Record#defs.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#defs.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#defs.stroke_linecap},
	{<<"stroke-linejoin">>, Record#defs.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#defs.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#defs.stroke_opacity},
	{<<"stroke-width">>, Record#defs.stroke_width},
	{<<"text-anchor">>, Record#defs.text_anchor},
	{<<"text-decoration">>, Record#defs.text_decoration},
	{<<"text-rendering">>, Record#defs.text_rendering},
	{<<"unicode-bidi">>, Record#defs.unicode_bidi},
	{<<"visibility">>, Record#defs.visibility},
	{<<"word-spacing">>, Record#defs.word_spacing},
	{<<"writing-mode">>, Record#defs.writing_mode}
].