-module(element_svgimage).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"image">>, nitro:render(Record#svgimage.body),
	lists:append([
		[
			{<<"id">>, Record#svgimage.id},
			{<<"class">>, Record#svgimage.class},
			{<<"style">>, Record#svgimage.style},
			{<<"x">>, Record#svgimage.x},
			{<<"y">>, Record#svgimage.y},
			{<<"width">>, Record#svgimage.width},
			{<<"height">>, Record#svgimage.height},
			{<<"preserveAspectRatio">>, Record#svgimage.preserveAspectRatio},
			{<<"transform">>, Record#svgimage.transform},
			{<<"externalResourcesRequired">>, Record#svgimage.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#svgimage.data_fields,
		Record#svgimage.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#svgimage.requiredExtensions},
	{<<"requiredFeatures">>, Record#svgimage.requiredFeatures},
	{<<"systemLanguage">>, Record#svgimage.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#svgimage.xmlbase},
	{<<"xml:lang">>, Record#svgimage.xmllang},
	{<<"xml:space">>, Record#svgimage.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#svgimage.onactivate},
	{<<"onclick">>, Record#svgimage.onclick},
	{<<"onfocusin">>, Record#svgimage.onfocusin},
	{<<"onfocusout">>, Record#svgimage.onfocusout},
	{<<"onload">>, Record#svgimage.onload_graphical},
	{<<"onmousedown">>, Record#svgimage.onmousedown},
	{<<"onmousemove">>, Record#svgimage.onmousemove},
	{<<"onmouseout">>, Record#svgimage.onmouseout},
	{<<"onmouseover">>, Record#svgimage.onmouseover},
	{<<"onmouseup">>, Record#svgimage.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#svgimage.alignment_baseline},
	{<<"baseline-shift">>, Record#svgimage.baseline_shift},
	{<<"clip">>, Record#svgimage.clip},
	{<<"clip-path">>, Record#svgimage.clip_path},
	{<<"clip-rule">>, Record#svgimage.clip_rule},
	{<<"color">>, Record#svgimage.color},
	{<<"color-interpolation">>, Record#svgimage.color_interpolation},
	{<<"color-interpolation-filters">>, Record#svgimage.color_interpolation_filters},
	{<<"color-profile">>, Record#svgimage.color_profile},
	{<<"color-rendering">>, Record#svgimage.color_rendering},
	{<<"cursor">>, Record#svgimage.cursor},
	{<<"direction">>, Record#svgimage.direction},
	{<<"display">>, Record#svgimage.display},
	{<<"dominant-baseline">>, Record#svgimage.dominant_baseline},
	{<<"enable-background">>, Record#svgimage.enable_background},
	{<<"fill">>, Record#svgimage.fill},
	{<<"fill-opacity">>, Record#svgimage.fill_opacity},
	{<<"fill-rule">>, Record#svgimage.fill_rule},
	{<<"filter">>, Record#svgimage.filter},
	{<<"flood-color">>, Record#svgimage.flood_color},
	{<<"flood-opacity">>, Record#svgimage.flood_opacity},
	{<<"font-family">>, Record#svgimage.font_family},
	{<<"font-size">>, Record#svgimage.font_size},
	{<<"font-size-adjust">>, Record#svgimage.font_size_adjust},
	{<<"font-stretch">>, Record#svgimage.font_stretch},
	{<<"font-style">>, Record#svgimage.font_style},
	{<<"font-variant">>, Record#svgimage.font_variant},
	{<<"font-weight">>, Record#svgimage.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#svgimage.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#svgimage.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#svgimage.image_rendering},
	{<<"kerning">>, Record#svgimage.kerning},
	{<<"letter-spacing">>, Record#svgimage.letter_spacing},
	{<<"lighting-color">>, Record#svgimage.lighting_color},
	{<<"marker-end">>, Record#svgimage.marker_end},
	{<<"marker-mid">>, Record#svgimage.marker_mid},
	{<<"marker-start">>, Record#svgimage.marker_start},
	{<<"mask">>, Record#svgimage.mask},
	{<<"opacity">>, Record#svgimage.opacity},
	{<<"overflow">>, Record#svgimage.overflow},
	{<<"pointer-events">>, Record#svgimage.pointer_events},
	{<<"shape-rendering">>, Record#svgimage.shape_rendering},
	{<<"stop-color">>, Record#svgimage.stop_color},
	{<<"stop-opacity">>, Record#svgimage.stop_opacity},
	{<<"stroke">>, Record#svgimage.stroke},
	{<<"stroke-dasharray">>, Record#svgimage.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#svgimage.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#svgimage.stroke_linecap},
	{<<"stroke-linejoin">>, Record#svgimage.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#svgimage.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#svgimage.stroke_opacity},
	{<<"stroke-width">>, Record#svgimage.stroke_width},
	{<<"text-anchor">>, Record#svgimage.text_anchor},
	{<<"text-decoration">>, Record#svgimage.text_decoration},
	{<<"text-rendering">>, Record#svgimage.text_rendering},
	{<<"unicode-bidi">>, Record#svgimage.unicode_bidi},
	{<<"visibility">>, Record#svgimage.visibility},
	{<<"word-spacing">>, Record#svgimage.word_spacing},
	{<<"writing-mode">>, Record#svgimage.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#svgimage.xlinkhref},
	{<<"xlink:type">>, Record#svgimage.xlinktype},
	{<<"xlink:role">>, Record#svgimage.xlinkrole},
	{<<"xlink:arcrole">>, Record#svgimage.xlinkarcrole},
	{<<"xlink:title">>, Record#svgimage.xlinktitle},
	{<<"xlink:show">>, Record#svgimage.xlinkshow},
	{<<"xlink:actuate">>, Record#svgimage.xlinkactuate}
].