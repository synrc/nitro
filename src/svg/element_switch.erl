-module(element_switch).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"switch">>, nitro:render(Record#switch.body),
	lists:append([
		[
			{<<"id">>, Record#switch.id},
			{<<"class">>, Record#switch.class},
			{<<"style">>, Record#switch.style},
			{<<"allowReorderm">>, Record#switch.allowReorderm},
			{<<"transform">>, Record#switch.transform},
			{<<"externalResourcesRequired">>, Record#switch.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#switch.data_fields,
		Record#switch.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#switch.requiredExtensions},
	{<<"requiredFeatures">>, Record#switch.requiredFeatures},
	{<<"systemLanguage">>, Record#switch.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#switch.xmlbase},
	{<<"xml:lang">>, Record#switch.xmllang},
	{<<"xml:space">>, Record#switch.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#switch.onactivate},
	{<<"onclick">>, Record#switch.onclick},
	{<<"onfocusin">>, Record#switch.onfocusin},
	{<<"onfocusout">>, Record#switch.onfocusout},
	{<<"onload">>, Record#switch.onload_graphical},
	{<<"onmousedown">>, Record#switch.onmousedown},
	{<<"onmousemove">>, Record#switch.onmousemove},
	{<<"onmouseout">>, Record#switch.onmouseout},
	{<<"onmouseover">>, Record#switch.onmouseover},
	{<<"onmouseup">>, Record#switch.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#switch.alignment_baseline},
	{<<"baseline-shift">>, Record#switch.baseline_shift},
	{<<"clip">>, Record#switch.clip},
	{<<"clip-path">>, Record#switch.clip_path},
	{<<"clip-rule">>, Record#switch.clip_rule},
	{<<"color">>, Record#switch.color},
	{<<"color-interpolation">>, Record#switch.color_interpolation},
	{<<"color-interpolation-filters">>, Record#switch.color_interpolation_filters},
	{<<"color-profile">>, Record#switch.color_profile},
	{<<"color-rendering">>, Record#switch.color_rendering},
	{<<"cursor">>, Record#switch.cursor},
	{<<"direction">>, Record#switch.direction},
	{<<"display">>, Record#switch.display},
	{<<"dominant-baseline">>, Record#switch.dominant_baseline},
	{<<"enable-background">>, Record#switch.enable_background},
	{<<"fill">>, Record#switch.fill},
	{<<"fill-opacity">>, Record#switch.fill_opacity},
	{<<"fill-rule">>, Record#switch.fill_rule},
	{<<"filter">>, Record#switch.filter},
	{<<"flood-color">>, Record#switch.flood_color},
	{<<"flood-opacity">>, Record#switch.flood_opacity},
	{<<"font-family">>, Record#switch.font_family},
	{<<"font-size">>, Record#switch.font_size},
	{<<"font-size-adjust">>, Record#switch.font_size_adjust},
	{<<"font-stretch">>, Record#switch.font_stretch},
	{<<"font-style">>, Record#switch.font_style},
	{<<"font-variant">>, Record#switch.font_variant},
	{<<"font-weight">>, Record#switch.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#switch.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#switch.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#switch.image_rendering},
	{<<"kerning">>, Record#switch.kerning},
	{<<"letter-spacing">>, Record#switch.letter_spacing},
	{<<"lighting-color">>, Record#switch.lighting_color},
	{<<"marker-end">>, Record#switch.marker_end},
	{<<"marker-mid">>, Record#switch.marker_mid},
	{<<"marker-start">>, Record#switch.marker_start},
	{<<"mask">>, Record#switch.mask},
	{<<"opacity">>, Record#switch.opacity},
	{<<"overflow">>, Record#switch.overflow},
	{<<"pointer-events">>, Record#switch.pointer_events},
	{<<"shape-rendering">>, Record#switch.shape_rendering},
	{<<"stop-color">>, Record#switch.stop_color},
	{<<"stop-opacity">>, Record#switch.stop_opacity},
	{<<"stroke">>, Record#switch.stroke},
	{<<"stroke-dasharray">>, Record#switch.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#switch.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#switch.stroke_linecap},
	{<<"stroke-linejoin">>, Record#switch.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#switch.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#switch.stroke_opacity},
	{<<"stroke-width">>, Record#switch.stroke_width},
	{<<"text-anchor">>, Record#switch.text_anchor},
	{<<"text-decoration">>, Record#switch.text_decoration},
	{<<"text-rendering">>, Record#switch.text_rendering},
	{<<"unicode-bidi">>, Record#switch.unicode_bidi},
	{<<"visibility">>, Record#switch.visibility},
	{<<"word-spacing">>, Record#switch.word_spacing},
	{<<"writing-mode">>, Record#switch.writing_mode}
].