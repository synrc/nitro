-module(element_g).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"g">>, nitro:render(Record#g.body),
	lists:append([
		[
			{<<"id">>, Record#g.id},
			{<<"class">>, Record#g.class},
			{<<"style">>, Record#g.style},
			{<<"transform">>, Record#g.transform},
			{<<"externalResourcesRequired">>, Record#g.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#g.data_fields,
		Record#g.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#g.requiredExtensions},
	{<<"requiredFeatures">>, Record#g.requiredFeatures},
	{<<"systemLanguage">>, Record#g.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#g.xmlbase},
	{<<"xml:lang">>, Record#g.xmllang},
	{<<"xml:space">>, Record#g.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#g.onactivate},
	{<<"onclick">>, Record#g.onclick},
	{<<"onfocusin">>, Record#g.onfocusin},
	{<<"onfocusout">>, Record#g.onfocusout},
	{<<"onload">>, Record#g.onload_graphical},
	{<<"onmousedown">>, Record#g.onmousedown},
	{<<"onmousemove">>, Record#g.onmousemove},
	{<<"onmouseout">>, Record#g.onmouseout},
	{<<"onmouseover">>, Record#g.onmouseover},
	{<<"onmouseup">>, Record#g.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#g.alignment_baseline},
	{<<"baseline-shift">>, Record#g.baseline_shift},
	{<<"clip">>, Record#g.clip},
	{<<"clip-path">>, Record#g.clip_path},
	{<<"clip-rule">>, Record#g.clip_rule},
	{<<"color">>, Record#g.color},
	{<<"color-interpolation">>, Record#g.color_interpolation},
	{<<"color-interpolation-filters">>, Record#g.color_interpolation_filters},
	{<<"color-profile">>, Record#g.color_profile},
	{<<"color-rendering">>, Record#g.color_rendering},
	{<<"cursor">>, Record#g.cursor},
	{<<"direction">>, Record#g.direction},
	{<<"display">>, Record#g.display},
	{<<"dominant-baseline">>, Record#g.dominant_baseline},
	{<<"enable-background">>, Record#g.enable_background},
	{<<"fill">>, Record#g.fill},
	{<<"fill-opacity">>, Record#g.fill_opacity},
	{<<"fill-rule">>, Record#g.fill_rule},
	{<<"filter">>, Record#g.filter},
	{<<"flood-color">>, Record#g.flood_color},
	{<<"flood-opacity">>, Record#g.flood_opacity},
	{<<"font-family">>, Record#g.font_family},
	{<<"font-size">>, Record#g.font_size},
	{<<"font-size-adjust">>, Record#g.font_size_adjust},
	{<<"font-stretch">>, Record#g.font_stretch},
	{<<"font-style">>, Record#g.font_style},
	{<<"font-variant">>, Record#g.font_variant},
	{<<"font-weight">>, Record#g.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#g.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#g.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#g.image_rendering},
	{<<"kerning">>, Record#g.kerning},
	{<<"letter-spacing">>, Record#g.letter_spacing},
	{<<"lighting-color">>, Record#g.lighting_color},
	{<<"marker-end">>, Record#g.marker_end},
	{<<"marker-mid">>, Record#g.marker_mid},
	{<<"marker-start">>, Record#g.marker_start},
	{<<"mask">>, Record#g.mask},
	{<<"opacity">>, Record#g.opacity},
	{<<"overflow">>, Record#g.overflow},
	{<<"pointer-events">>, Record#g.pointer_events},
	{<<"shape-rendering">>, Record#g.shape_rendering},
	{<<"stop-color">>, Record#g.stop_color},
	{<<"stop-opacity">>, Record#g.stop_opacity},
	{<<"stroke">>, Record#g.stroke},
	{<<"stroke-dasharray">>, Record#g.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#g.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#g.stroke_linecap},
	{<<"stroke-linejoin">>, Record#g.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#g.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#g.stroke_opacity},
	{<<"stroke-width">>, Record#g.stroke_width},
	{<<"text-anchor">>, Record#g.text_anchor},
	{<<"text-decoration">>, Record#g.text_decoration},
	{<<"text-rendering">>, Record#g.text_rendering},
	{<<"unicode-bidi">>, Record#g.unicode_bidi},
	{<<"visibility">>, Record#g.visibility},
	{<<"word-spacing">>, Record#g.word_spacing},
	{<<"writing-mode">>, Record#g.writing_mode}
].