-module(element_ellipse).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"ellipse">>, nitro:render(Record#ellipse.body),
	lists:append([
		[
			{<<"id">>, Record#ellipse.id},
			{<<"class">>, Record#ellipse.class},
			{<<"style">>, Record#ellipse.style},
			{<<"cx">>, Record#ellipse.cx},
			{<<"cy">>, Record#ellipse.cy},
			{<<"rx">>, Record#ellipse.rx},
			{<<"ry">>, Record#ellipse.ry},
			{<<"transform">>, Record#ellipse.transform},
			{<<"externalResourcesRequired">>, Record#ellipse.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#ellipse.data_fields,
		Record#ellipse.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#ellipse.requiredExtensions},
	{<<"requiredFeatures">>, Record#ellipse.requiredFeatures},
	{<<"systemLanguage">>, Record#ellipse.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#ellipse.xmlbase},
	{<<"xml:lang">>, Record#ellipse.xmllang},
	{<<"xml:space">>, Record#ellipse.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#ellipse.onactivate},
	{<<"onclick">>, Record#ellipse.onclick},
	{<<"onfocusin">>, Record#ellipse.onfocusin},
	{<<"onfocusout">>, Record#ellipse.onfocusout},
	{<<"onload">>, Record#ellipse.onload_graphical},
	{<<"onmousedown">>, Record#ellipse.onmousedown},
	{<<"onmousemove">>, Record#ellipse.onmousemove},
	{<<"onmouseout">>, Record#ellipse.onmouseout},
	{<<"onmouseover">>, Record#ellipse.onmouseover},
	{<<"onmouseup">>, Record#ellipse.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#ellipse.alignment_baseline},
	{<<"baseline-shift">>, Record#ellipse.baseline_shift},
	{<<"clip">>, Record#ellipse.clip},
	{<<"clip-path">>, Record#ellipse.clip_path},
	{<<"clip-rule">>, Record#ellipse.clip_rule},
	{<<"color">>, Record#ellipse.color},
	{<<"color-interpolation">>, Record#ellipse.color_interpolation},
	{<<"color-interpolation-filters">>, Record#ellipse.color_interpolation_filters},
	{<<"color-profile">>, Record#ellipse.color_profile},
	{<<"color-rendering">>, Record#ellipse.color_rendering},
	{<<"cursor">>, Record#ellipse.cursor},
	{<<"direction">>, Record#ellipse.direction},
	{<<"display">>, Record#ellipse.display},
	{<<"dominant-baseline">>, Record#ellipse.dominant_baseline},
	{<<"enable-background">>, Record#ellipse.enable_background},
	{<<"fill">>, Record#ellipse.fill},
	{<<"fill-opacity">>, Record#ellipse.fill_opacity},
	{<<"fill-rule">>, Record#ellipse.fill_rule},
	{<<"filter">>, Record#ellipse.filter},
	{<<"flood-color">>, Record#ellipse.flood_color},
	{<<"flood-opacity">>, Record#ellipse.flood_opacity},
	{<<"font-family">>, Record#ellipse.font_family},
	{<<"font-size">>, Record#ellipse.font_size},
	{<<"font-size-adjust">>, Record#ellipse.font_size_adjust},
	{<<"font-stretch">>, Record#ellipse.font_stretch},
	{<<"font-style">>, Record#ellipse.font_style},
	{<<"font-variant">>, Record#ellipse.font_variant},
	{<<"font-weight">>, Record#ellipse.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#ellipse.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#ellipse.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#ellipse.image_rendering},
	{<<"kerning">>, Record#ellipse.kerning},
	{<<"letter-spacing">>, Record#ellipse.letter_spacing},
	{<<"lighting-color">>, Record#ellipse.lighting_color},
	{<<"marker-end">>, Record#ellipse.marker_end},
	{<<"marker-mid">>, Record#ellipse.marker_mid},
	{<<"marker-start">>, Record#ellipse.marker_start},
	{<<"mask">>, Record#ellipse.mask},
	{<<"opacity">>, Record#ellipse.opacity},
	{<<"overflow">>, Record#ellipse.overflow},
	{<<"pointer-events">>, Record#ellipse.pointer_events},
	{<<"shape-rendering">>, Record#ellipse.shape_rendering},
	{<<"stop-color">>, Record#ellipse.stop_color},
	{<<"stop-opacity">>, Record#ellipse.stop_opacity},
	{<<"stroke">>, Record#ellipse.stroke},
	{<<"stroke-dasharray">>, Record#ellipse.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#ellipse.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#ellipse.stroke_linecap},
	{<<"stroke-linejoin">>, Record#ellipse.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#ellipse.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#ellipse.stroke_opacity},
	{<<"stroke-width">>, Record#ellipse.stroke_width},
	{<<"text-anchor">>, Record#ellipse.text_anchor},
	{<<"text-decoration">>, Record#ellipse.text_decoration},
	{<<"text-rendering">>, Record#ellipse.text_rendering},
	{<<"unicode-bidi">>, Record#ellipse.unicode_bidi},
	{<<"visibility">>, Record#ellipse.visibility},
	{<<"word-spacing">>, Record#ellipse.word_spacing},
	{<<"writing-mode">>, Record#ellipse.writing_mode}
].