-module(element_text).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"text">>, nitro:render(Record#text.body),
	lists:append([
		[
			{<<"id">>, Record#text.id},
			{<<"class">>, Record#text.class},
			{<<"style">>, Record#text.style},
			{<<"x">>, Record#text.x},
			{<<"y">>, Record#text.y},
			{<<"dx">>, Record#text.dx},
			{<<"dy">>, Record#text.dy},
			{<<"rotate">>, Record#text.rotate},
			{<<"textLength">>, Record#text.textLength},
			{<<"lengthAdjust">>, Record#text.lengthAdjust},
			{<<"transform">>, Record#text.transform},
			{<<"externalResourcesRequired">>, Record#text.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#text.data_fields,
		Record#text.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#text.requiredExtensions},
	{<<"requiredFeatures">>, Record#text.requiredFeatures},
	{<<"systemLanguage">>, Record#text.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#text.xmlbase},
	{<<"xml:lang">>, Record#text.xmllang},
	{<<"xml:space">>, Record#text.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#text.onactivate},
	{<<"onclick">>, Record#text.onclick},
	{<<"onfocusin">>, Record#text.onfocusin},
	{<<"onfocusout">>, Record#text.onfocusout},
	{<<"onload">>, Record#text.onload_graphical},
	{<<"onmousedown">>, Record#text.onmousedown},
	{<<"onmousemove">>, Record#text.onmousemove},
	{<<"onmouseout">>, Record#text.onmouseout},
	{<<"onmouseover">>, Record#text.onmouseover},
	{<<"onmouseup">>, Record#text.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#text.alignment_baseline},
	{<<"baseline-shift">>, Record#text.baseline_shift},
	{<<"clip">>, Record#text.clip},
	{<<"clip-path">>, Record#text.clip_path},
	{<<"clip-rule">>, Record#text.clip_rule},
	{<<"color">>, Record#text.color},
	{<<"color-interpolation">>, Record#text.color_interpolation},
	{<<"color-interpolation-filters">>, Record#text.color_interpolation_filters},
	{<<"color-profile">>, Record#text.color_profile},
	{<<"color-rendering">>, Record#text.color_rendering},
	{<<"cursor">>, Record#text.cursor},
	{<<"direction">>, Record#text.direction},
	{<<"display">>, Record#text.display},
	{<<"dominant-baseline">>, Record#text.dominant_baseline},
	{<<"enable-background">>, Record#text.enable_background},
	{<<"fill">>, Record#text.fill},
	{<<"fill-opacity">>, Record#text.fill_opacity},
	{<<"fill-rule">>, Record#text.fill_rule},
	{<<"filter">>, Record#text.filter},
	{<<"flood-color">>, Record#text.flood_color},
	{<<"flood-opacity">>, Record#text.flood_opacity},
	{<<"font-family">>, Record#text.font_family},
	{<<"font-size">>, Record#text.font_size},
	{<<"font-size-adjust">>, Record#text.font_size_adjust},
	{<<"font-stretch">>, Record#text.font_stretch},
	{<<"font-style">>, Record#text.font_style},
	{<<"font-variant">>, Record#text.font_variant},
	{<<"font-weight">>, Record#text.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#text.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#text.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#text.image_rendering},
	{<<"kerning">>, Record#text.kerning},
	{<<"letter-spacing">>, Record#text.letter_spacing},
	{<<"lighting-color">>, Record#text.lighting_color},
	{<<"marker-end">>, Record#text.marker_end},
	{<<"marker-mid">>, Record#text.marker_mid},
	{<<"marker-start">>, Record#text.marker_start},
	{<<"mask">>, Record#text.mask},
	{<<"opacity">>, Record#text.opacity},
	{<<"overflow">>, Record#text.overflow},
	{<<"pointer-events">>, Record#text.pointer_events},
	{<<"shape-rendering">>, Record#text.shape_rendering},
	{<<"stop-color">>, Record#text.stop_color},
	{<<"stop-opacity">>, Record#text.stop_opacity},
	{<<"stroke">>, Record#text.stroke},
	{<<"stroke-dasharray">>, Record#text.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#text.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#text.stroke_linecap},
	{<<"stroke-linejoin">>, Record#text.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#text.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#text.stroke_opacity},
	{<<"stroke-width">>, Record#text.stroke_width},
	{<<"text-anchor">>, Record#text.text_anchor},
	{<<"text-decoration">>, Record#text.text_decoration},
	{<<"text-rendering">>, Record#text.text_rendering},
	{<<"unicode-bidi">>, Record#text.unicode_bidi},
	{<<"visibility">>, Record#text.visibility},
	{<<"word-spacing">>, Record#text.word_spacing},
	{<<"writing-mode">>, Record#text.writing_mode}
].