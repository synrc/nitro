-module(element_tspan).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"tspan">>, nitro:render(Record#tspan.body),
	lists:append([
		[
			{<<"id">>, Record#tspan.id},
			{<<"class">>, Record#tspan.class},
			{<<"style">>, Record#tspan.style},
			{<<"x">>, Record#tspan.x},
			{<<"y">>, Record#tspan.y},
			{<<"dx">>, Record#tspan.dx},
			{<<"dy">>, Record#tspan.dy},
			{<<"rotate">>, Record#tspan.rotate},
			{<<"textLength">>, Record#tspan.textLength},
			{<<"lengthAdjust">>, Record#tspan.lengthAdjust},
			{<<"externalResourcesRequired">>, Record#tspan.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#tspan.data_fields,
		Record#tspan.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#tspan.requiredExtensions},
	{<<"requiredFeatures">>, Record#tspan.requiredFeatures},
	{<<"systemLanguage">>, Record#tspan.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#tspan.xmlbase},
	{<<"xml:lang">>, Record#tspan.xmllang},
	{<<"xml:space">>, Record#tspan.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#tspan.onactivate},
	{<<"onclick">>, Record#tspan.onclick},
	{<<"onfocusin">>, Record#tspan.onfocusin},
	{<<"onfocusout">>, Record#tspan.onfocusout},
	{<<"onload">>, Record#tspan.onload_graphical},
	{<<"onmousedown">>, Record#tspan.onmousedown},
	{<<"onmousemove">>, Record#tspan.onmousemove},
	{<<"onmouseout">>, Record#tspan.onmouseout},
	{<<"onmouseover">>, Record#tspan.onmouseover},
	{<<"onmouseup">>, Record#tspan.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#tspan.alignment_baseline},
	{<<"baseline-shift">>, Record#tspan.baseline_shift},
	{<<"clip">>, Record#tspan.clip},
	{<<"clip-path">>, Record#tspan.clip_path},
	{<<"clip-rule">>, Record#tspan.clip_rule},
	{<<"color">>, Record#tspan.color},
	{<<"color-interpolation">>, Record#tspan.color_interpolation},
	{<<"color-interpolation-filters">>, Record#tspan.color_interpolation_filters},
	{<<"color-profile">>, Record#tspan.color_profile},
	{<<"color-rendering">>, Record#tspan.color_rendering},
	{<<"cursor">>, Record#tspan.cursor},
	{<<"direction">>, Record#tspan.direction},
	{<<"display">>, Record#tspan.display},
	{<<"dominant-baseline">>, Record#tspan.dominant_baseline},
	{<<"enable-background">>, Record#tspan.enable_background},
	{<<"fill">>, Record#tspan.fill},
	{<<"fill-opacity">>, Record#tspan.fill_opacity},
	{<<"fill-rule">>, Record#tspan.fill_rule},
	{<<"filter">>, Record#tspan.filter},
	{<<"flood-color">>, Record#tspan.flood_color},
	{<<"flood-opacity">>, Record#tspan.flood_opacity},
	{<<"font-family">>, Record#tspan.font_family},
	{<<"font-size">>, Record#tspan.font_size},
	{<<"font-size-adjust">>, Record#tspan.font_size_adjust},
	{<<"font-stretch">>, Record#tspan.font_stretch},
	{<<"font-style">>, Record#tspan.font_style},
	{<<"font-variant">>, Record#tspan.font_variant},
	{<<"font-weight">>, Record#tspan.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#tspan.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#tspan.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#tspan.image_rendering},
	{<<"kerning">>, Record#tspan.kerning},
	{<<"letter-spacing">>, Record#tspan.letter_spacing},
	{<<"lighting-color">>, Record#tspan.lighting_color},
	{<<"marker-end">>, Record#tspan.marker_end},
	{<<"marker-mid">>, Record#tspan.marker_mid},
	{<<"marker-start">>, Record#tspan.marker_start},
	{<<"mask">>, Record#tspan.mask},
	{<<"opacity">>, Record#tspan.opacity},
	{<<"overflow">>, Record#tspan.overflow},
	{<<"pointer-events">>, Record#tspan.pointer_events},
	{<<"shape-rendering">>, Record#tspan.shape_rendering},
	{<<"stop-color">>, Record#tspan.stop_color},
	{<<"stop-opacity">>, Record#tspan.stop_opacity},
	{<<"stroke">>, Record#tspan.stroke},
	{<<"stroke-dasharray">>, Record#tspan.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#tspan.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#tspan.stroke_linecap},
	{<<"stroke-linejoin">>, Record#tspan.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#tspan.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#tspan.stroke_opacity},
	{<<"stroke-width">>, Record#tspan.stroke_width},
	{<<"text-anchor">>, Record#tspan.text_anchor},
	{<<"text-decoration">>, Record#tspan.text_decoration},
	{<<"text-rendering">>, Record#tspan.text_rendering},
	{<<"unicode-bidi">>, Record#tspan.unicode_bidi},
	{<<"visibility">>, Record#tspan.visibility},
	{<<"word-spacing">>, Record#tspan.word_spacing},
	{<<"writing-mode">>, Record#tspan.writing_mode}
].