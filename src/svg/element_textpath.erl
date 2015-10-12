-module(element_textpath).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"textPath">>, nitro:render(Record#textPath.body),
	lists:append([
		[
			{<<"id">>, Record#textPath.id},
			{<<"class">>, Record#textPath.class},
			{<<"style">>, Record#textPath.style},
			{<<"startOffset">>, Record#textPath.startOffset},
			{<<"method">>, Record#textPath.method},
			{<<"spacing">>, Record#textPath.spacing},
			{<<"externalResourcesRequired">>, Record#textPath.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#textPath.data_fields,
		Record#textPath.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#textPath.requiredExtensions},
	{<<"requiredFeatures">>, Record#textPath.requiredFeatures},
	{<<"systemLanguage">>, Record#textPath.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#textPath.xmlbase},
	{<<"xml:lang">>, Record#textPath.xmllang},
	{<<"xml:space">>, Record#textPath.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#textPath.onactivate},
	{<<"onclick">>, Record#textPath.onclick},
	{<<"onfocusin">>, Record#textPath.onfocusin},
	{<<"onfocusout">>, Record#textPath.onfocusout},
	{<<"onload">>, Record#textPath.onload_graphical},
	{<<"onmousedown">>, Record#textPath.onmousedown},
	{<<"onmousemove">>, Record#textPath.onmousemove},
	{<<"onmouseout">>, Record#textPath.onmouseout},
	{<<"onmouseover">>, Record#textPath.onmouseover},
	{<<"onmouseup">>, Record#textPath.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#textPath.alignment_baseline},
	{<<"baseline-shift">>, Record#textPath.baseline_shift},
	{<<"clip">>, Record#textPath.clip},
	{<<"clip-path">>, Record#textPath.clip_path},
	{<<"clip-rule">>, Record#textPath.clip_rule},
	{<<"color">>, Record#textPath.color},
	{<<"color-interpolation">>, Record#textPath.color_interpolation},
	{<<"color-interpolation-filters">>, Record#textPath.color_interpolation_filters},
	{<<"color-profile">>, Record#textPath.color_profile},
	{<<"color-rendering">>, Record#textPath.color_rendering},
	{<<"cursor">>, Record#textPath.cursor},
	{<<"direction">>, Record#textPath.direction},
	{<<"display">>, Record#textPath.display},
	{<<"dominant-baseline">>, Record#textPath.dominant_baseline},
	{<<"enable-background">>, Record#textPath.enable_background},
	{<<"fill">>, Record#textPath.fill},
	{<<"fill-opacity">>, Record#textPath.fill_opacity},
	{<<"fill-rule">>, Record#textPath.fill_rule},
	{<<"filter">>, Record#textPath.filter},
	{<<"flood-color">>, Record#textPath.flood_color},
	{<<"flood-opacity">>, Record#textPath.flood_opacity},
	{<<"font-family">>, Record#textPath.font_family},
	{<<"font-size">>, Record#textPath.font_size},
	{<<"font-size-adjust">>, Record#textPath.font_size_adjust},
	{<<"font-stretch">>, Record#textPath.font_stretch},
	{<<"font-style">>, Record#textPath.font_style},
	{<<"font-variant">>, Record#textPath.font_variant},
	{<<"font-weight">>, Record#textPath.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#textPath.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#textPath.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#textPath.image_rendering},
	{<<"kerning">>, Record#textPath.kerning},
	{<<"letter-spacing">>, Record#textPath.letter_spacing},
	{<<"lighting-color">>, Record#textPath.lighting_color},
	{<<"marker-end">>, Record#textPath.marker_end},
	{<<"marker-mid">>, Record#textPath.marker_mid},
	{<<"marker-start">>, Record#textPath.marker_start},
	{<<"mask">>, Record#textPath.mask},
	{<<"opacity">>, Record#textPath.opacity},
	{<<"overflow">>, Record#textPath.overflow},
	{<<"pointer-events">>, Record#textPath.pointer_events},
	{<<"shape-rendering">>, Record#textPath.shape_rendering},
	{<<"stop-color">>, Record#textPath.stop_color},
	{<<"stop-opacity">>, Record#textPath.stop_opacity},
	{<<"stroke">>, Record#textPath.stroke},
	{<<"stroke-dasharray">>, Record#textPath.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#textPath.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#textPath.stroke_linecap},
	{<<"stroke-linejoin">>, Record#textPath.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#textPath.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#textPath.stroke_opacity},
	{<<"stroke-width">>, Record#textPath.stroke_width},
	{<<"text-anchor">>, Record#textPath.text_anchor},
	{<<"text-decoration">>, Record#textPath.text_decoration},
	{<<"text-rendering">>, Record#textPath.text_rendering},
	{<<"unicode-bidi">>, Record#textPath.unicode_bidi},
	{<<"visibility">>, Record#textPath.visibility},
	{<<"word-spacing">>, Record#textPath.word_spacing},
	{<<"writing-mode">>, Record#textPath.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#textPath.xlinkhref},
	{<<"xlink:type">>, Record#textPath.xlinktype},
	{<<"xlink:role">>, Record#textPath.xlinkrole},
	{<<"xlink:arcrole">>, Record#textPath.xlinkarcrole},
	{<<"xlink:title">>, Record#textPath.xlinktitle},
	{<<"xlink:show">>, Record#textPath.xlinkshow},
	{<<"xlink:actuate">>, Record#textPath.xlinkactuate}
].