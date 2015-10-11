-module(element_use).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"use">>, nitro:render(Record#use.body),
	lists:append([
		[
			{<<"id">>, Record#use.id},
			{<<"class">>, Record#use.class},
			{<<"style">>, Record#use.style},
			{<<"x">>, Record#use.x},
			{<<"y">>, Record#use.y},
			{<<"width">>, Record#use.width},
			{<<"height">>, Record#use.height},
			{<<"transform">>, Record#use.transform},
			{<<"externalResourcesRequired">>, Record#use.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#use.data_fields,
		Record#use.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#use.requiredExtensions},
	{<<"requiredFeatures">>, Record#use.requiredFeatures},
	{<<"systemLanguage">>, Record#use.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#use.xmlbase},
	{<<"xml:lang">>, Record#use.xmllang},
	{<<"xml:space">>, Record#use.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#use.onactivate},
	{<<"onclick">>, Record#use.onclick},
	{<<"onfocusin">>, Record#use.onfocusin},
	{<<"onfocusout">>, Record#use.onfocusout},
	{<<"onload">>, Record#use.onload_graphical},
	{<<"onmousedown">>, Record#use.onmousedown},
	{<<"onmousemove">>, Record#use.onmousemove},
	{<<"onmouseout">>, Record#use.onmouseout},
	{<<"onmouseover">>, Record#use.onmouseover},
	{<<"onmouseup">>, Record#use.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#use.alignment_baseline},
	{<<"baseline-shift">>, Record#use.baseline_shift},
	{<<"clip">>, Record#use.clip},
	{<<"clip-path">>, Record#use.clip_path},
	{<<"clip-rule">>, Record#use.clip_rule},
	{<<"color">>, Record#use.color},
	{<<"color-interpolation">>, Record#use.color_interpolation},
	{<<"color-interpolation-filters">>, Record#use.color_interpolation_filters},
	{<<"color-profile">>, Record#use.color_profile},
	{<<"color-rendering">>, Record#use.color_rendering},
	{<<"cursor">>, Record#use.cursor},
	{<<"direction">>, Record#use.direction},
	{<<"display">>, Record#use.display},
	{<<"dominant-baseline">>, Record#use.dominant_baseline},
	{<<"enable-background">>, Record#use.enable_background},
	{<<"fill">>, Record#use.fill},
	{<<"fill-opacity">>, Record#use.fill_opacity},
	{<<"fill-rule">>, Record#use.fill_rule},
	{<<"filter">>, Record#use.filter},
	{<<"flood-color">>, Record#use.flood_color},
	{<<"flood-opacity">>, Record#use.flood_opacity},
	{<<"font-family">>, Record#use.font_family},
	{<<"font-size">>, Record#use.font_size},
	{<<"font-size-adjust">>, Record#use.font_size_adjust},
	{<<"font-stretch">>, Record#use.font_stretch},
	{<<"font-style">>, Record#use.font_style},
	{<<"font-variant">>, Record#use.font_variant},
	{<<"font-weight">>, Record#use.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#use.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#use.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#use.image_rendering},
	{<<"kerning">>, Record#use.kerning},
	{<<"letter-spacing">>, Record#use.letter_spacing},
	{<<"lighting-color">>, Record#use.lighting_color},
	{<<"marker-end">>, Record#use.marker_end},
	{<<"marker-mid">>, Record#use.marker_mid},
	{<<"marker-start">>, Record#use.marker_start},
	{<<"mask">>, Record#use.mask},
	{<<"opacity">>, Record#use.opacity},
	{<<"overflow">>, Record#use.overflow},
	{<<"pointer-events">>, Record#use.pointer_events},
	{<<"shape-rendering">>, Record#use.shape_rendering},
	{<<"stop-color">>, Record#use.stop_color},
	{<<"stop-opacity">>, Record#use.stop_opacity},
	{<<"stroke">>, Record#use.stroke},
	{<<"stroke-dasharray">>, Record#use.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#use.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#use.stroke_linecap},
	{<<"stroke-linejoin">>, Record#use.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#use.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#use.stroke_opacity},
	{<<"stroke-width">>, Record#use.stroke_width},
	{<<"text-anchor">>, Record#use.text_anchor},
	{<<"text-decoration">>, Record#use.text_decoration},
	{<<"text-rendering">>, Record#use.text_rendering},
	{<<"unicode-bidi">>, Record#use.unicode_bidi},
	{<<"visibility">>, Record#use.visibility},
	{<<"word-spacing">>, Record#use.word_spacing},
	{<<"writing-mode">>, Record#use.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#use.xlinkhref},
	{<<"xlink:type">>, Record#use.xlinktype},
	{<<"xlink:role">>, Record#use.xlinkrole},
	{<<"xlink:arcrole">>, Record#use.xlinkarcrole},
	{<<"xlink:title">>, Record#use.xlinktitle},
	{<<"xlink:show">>, Record#use.xlinkshow},
	{<<"xlink:actuate">>, Record#use.xlinkactuate}
].