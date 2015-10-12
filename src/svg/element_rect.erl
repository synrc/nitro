-module(element_rect).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"rect">>, nitro:render(Record#rect.body),
	lists:append([
		[
			{<<"id">>, Record#rect.id},
			{<<"class">>, Record#rect.class},
			{<<"style">>, Record#rect.style},
			{<<"x">>, Record#rect.x},
			{<<"y">>, Record#rect.y},
			{<<"width">>, Record#rect.width},
			{<<"height">>, Record#rect.height},
			{<<"rx">>, Record#rect.rx},
			{<<"ry">>, Record#rect.ry},
			{<<"transform">>, Record#rect.transform},
			{<<"externalResourcesRequired">>, Record#rect.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#rect.data_fields,
		Record#rect.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#rect.requiredExtensions},
	{<<"requiredFeatures">>, Record#rect.requiredFeatures},
	{<<"systemLanguage">>, Record#rect.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#rect.xmlbase},
	{<<"xml:lang">>, Record#rect.xmllang},
	{<<"xml:space">>, Record#rect.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#rect.onactivate},
	{<<"onclick">>, Record#rect.onclick},
	{<<"onfocusin">>, Record#rect.onfocusin},
	{<<"onfocusout">>, Record#rect.onfocusout},
	{<<"onload">>, Record#rect.onload_graphical},
	{<<"onmousedown">>, Record#rect.onmousedown},
	{<<"onmousemove">>, Record#rect.onmousemove},
	{<<"onmouseout">>, Record#rect.onmouseout},
	{<<"onmouseover">>, Record#rect.onmouseover},
	{<<"onmouseup">>, Record#rect.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#rect.alignment_baseline},
	{<<"baseline-shift">>, Record#rect.baseline_shift},
	{<<"clip">>, Record#rect.clip},
	{<<"clip-path">>, Record#rect.clip_path},
	{<<"clip-rule">>, Record#rect.clip_rule},
	{<<"color">>, Record#rect.color},
	{<<"color-interpolation">>, Record#rect.color_interpolation},
	{<<"color-interpolation-filters">>, Record#rect.color_interpolation_filters},
	{<<"color-profile">>, Record#rect.color_profile},
	{<<"color-rendering">>, Record#rect.color_rendering},
	{<<"cursor">>, Record#rect.cursor},
	{<<"direction">>, Record#rect.direction},
	{<<"display">>, Record#rect.display},
	{<<"dominant-baseline">>, Record#rect.dominant_baseline},
	{<<"enable-background">>, Record#rect.enable_background},
	{<<"fill">>, Record#rect.fill},
	{<<"fill-opacity">>, Record#rect.fill_opacity},
	{<<"fill-rule">>, Record#rect.fill_rule},
	{<<"filter">>, Record#rect.filter},
	{<<"flood-color">>, Record#rect.flood_color},
	{<<"flood-opacity">>, Record#rect.flood_opacity},
	{<<"font-family">>, Record#rect.font_family},
	{<<"font-size">>, Record#rect.font_size},
	{<<"font-size-adjust">>, Record#rect.font_size_adjust},
	{<<"font-stretch">>, Record#rect.font_stretch},
	{<<"font-style">>, Record#rect.font_style},
	{<<"font-variant">>, Record#rect.font_variant},
	{<<"font-weight">>, Record#rect.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#rect.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#rect.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#rect.image_rendering},
	{<<"kerning">>, Record#rect.kerning},
	{<<"letter-spacing">>, Record#rect.letter_spacing},
	{<<"lighting-color">>, Record#rect.lighting_color},
	{<<"marker-end">>, Record#rect.marker_end},
	{<<"marker-mid">>, Record#rect.marker_mid},
	{<<"marker-start">>, Record#rect.marker_start},
	{<<"mask">>, Record#rect.mask},
	{<<"opacity">>, Record#rect.opacity},
	{<<"overflow">>, Record#rect.overflow},
	{<<"pointer-events">>, Record#rect.pointer_events},
	{<<"shape-rendering">>, Record#rect.shape_rendering},
	{<<"stop-color">>, Record#rect.stop_color},
	{<<"stop-opacity">>, Record#rect.stop_opacity},
	{<<"stroke">>, Record#rect.stroke},
	{<<"stroke-dasharray">>, Record#rect.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#rect.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#rect.stroke_linecap},
	{<<"stroke-linejoin">>, Record#rect.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#rect.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#rect.stroke_opacity},
	{<<"stroke-width">>, Record#rect.stroke_width},
	{<<"text-anchor">>, Record#rect.text_anchor},
	{<<"text-decoration">>, Record#rect.text_decoration},
	{<<"text-rendering">>, Record#rect.text_rendering},
	{<<"unicode-bidi">>, Record#rect.unicode_bidi},
	{<<"visibility">>, Record#rect.visibility},
	{<<"word-spacing">>, Record#rect.word_spacing},
	{<<"writing-mode">>, Record#rect.writing_mode}
].