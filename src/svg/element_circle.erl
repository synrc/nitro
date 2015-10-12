-module(element_circle).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"circle">>, nitro:render(Record#circle.body),
	lists:append([
		[
			{<<"id">>, Record#circle.id},
			{<<"class">>, Record#circle.class},
			{<<"style">>, Record#circle.style},
			{<<"cx">>, Record#circle.cx},
			{<<"cy">>, Record#circle.cy},
			{<<"r">>, Record#circle.r},
			{<<"transform">>, Record#circle.transform},
			{<<"externalResourcesRequired">>, Record#circle.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#circle.data_fields,
		Record#circle.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#circle.requiredExtensions},
	{<<"requiredFeatures">>, Record#circle.requiredFeatures},
	{<<"systemLanguage">>, Record#circle.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#circle.xmlbase},
	{<<"xml:lang">>, Record#circle.xmllang},
	{<<"xml:space">>, Record#circle.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#circle.onactivate},
	{<<"onclick">>, Record#circle.onclick},
	{<<"onfocusin">>, Record#circle.onfocusin},
	{<<"onfocusout">>, Record#circle.onfocusout},
	{<<"onload">>, Record#circle.onload_graphical},
	{<<"onmousedown">>, Record#circle.onmousedown},
	{<<"onmousemove">>, Record#circle.onmousemove},
	{<<"onmouseout">>, Record#circle.onmouseout},
	{<<"onmouseover">>, Record#circle.onmouseover},
	{<<"onmouseup">>, Record#circle.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#circle.alignment_baseline},
	{<<"baseline-shift">>, Record#circle.baseline_shift},
	{<<"clip">>, Record#circle.clip},
	{<<"clip-path">>, Record#circle.clip_path},
	{<<"clip-rule">>, Record#circle.clip_rule},
	{<<"color">>, Record#circle.color},
	{<<"color-interpolation">>, Record#circle.color_interpolation},
	{<<"color-interpolation-filters">>, Record#circle.color_interpolation_filters},
	{<<"color-profile">>, Record#circle.color_profile},
	{<<"color-rendering">>, Record#circle.color_rendering},
	{<<"cursor">>, Record#circle.cursor},
	{<<"direction">>, Record#circle.direction},
	{<<"display">>, Record#circle.display},
	{<<"dominant-baseline">>, Record#circle.dominant_baseline},
	{<<"enable-background">>, Record#circle.enable_background},
	{<<"fill">>, Record#circle.fill},
	{<<"fill-opacity">>, Record#circle.fill_opacity},
	{<<"fill-rule">>, Record#circle.fill_rule},
	{<<"filter">>, Record#circle.filter},
	{<<"flood-color">>, Record#circle.flood_color},
	{<<"flood-opacity">>, Record#circle.flood_opacity},
	{<<"font-family">>, Record#circle.font_family},
	{<<"font-size">>, Record#circle.font_size},
	{<<"font-size-adjust">>, Record#circle.font_size_adjust},
	{<<"font-stretch">>, Record#circle.font_stretch},
	{<<"font-style">>, Record#circle.font_style},
	{<<"font-variant">>, Record#circle.font_variant},
	{<<"font-weight">>, Record#circle.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#circle.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#circle.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#circle.image_rendering},
	{<<"kerning">>, Record#circle.kerning},
	{<<"letter-spacing">>, Record#circle.letter_spacing},
	{<<"lighting-color">>, Record#circle.lighting_color},
	{<<"marker-end">>, Record#circle.marker_end},
	{<<"marker-mid">>, Record#circle.marker_mid},
	{<<"marker-start">>, Record#circle.marker_start},
	{<<"mask">>, Record#circle.mask},
	{<<"opacity">>, Record#circle.opacity},
	{<<"overflow">>, Record#circle.overflow},
	{<<"pointer-events">>, Record#circle.pointer_events},
	{<<"shape-rendering">>, Record#circle.shape_rendering},
	{<<"stop-color">>, Record#circle.stop_color},
	{<<"stop-opacity">>, Record#circle.stop_opacity},
	{<<"stroke">>, Record#circle.stroke},
	{<<"stroke-dasharray">>, Record#circle.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#circle.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#circle.stroke_linecap},
	{<<"stroke-linejoin">>, Record#circle.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#circle.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#circle.stroke_opacity},
	{<<"stroke-width">>, Record#circle.stroke_width},
	{<<"text-anchor">>, Record#circle.text_anchor},
	{<<"text-decoration">>, Record#circle.text_decoration},
	{<<"text-rendering">>, Record#circle.text_rendering},
	{<<"unicode-bidi">>, Record#circle.unicode_bidi},
	{<<"visibility">>, Record#circle.visibility},
	{<<"word-spacing">>, Record#circle.word_spacing},
	{<<"writing-mode">>, Record#circle.writing_mode}
].