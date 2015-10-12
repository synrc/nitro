-module(element_svg).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"svg">>, nitro:render(Record#svg.body),
	lists:append([
		[
			{<<"id">>, Record#svg.id},
			{<<"class">>, Record#svg.class},
			{<<"style">>, Record#svg.style},
			{<<"version">>, Record#svg.version},
			{<<"baseProfile">>, Record#svg.baseProfile},
			{<<"xmlns">>, Record#svg.xmlns},
			{<<"xmlns:xlink">>, Record#svg.xmlnsxlink},
			{<<"xmlns:ev">>, Record#svg.xmlnsev},
			{<<"preserveAspectRatio">>, Record#svg.preserveAspectRatio},
			{<<"contentScriptType">>, Record#svg.contentScriptType},
			{<<"contentStyleType">>, Record#svg.contentStyleType},
			{<<"viewBox">>, Record#svg.viewBox},
			{<<"externalResourcesRequired">>, Record#svg.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_document_event(Record),
		svg_filter_primitive(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_transfert_function(Record),
		svg_xlink(Record),
		Record#svg.data_fields,
		Record#svg.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#svg.requiredExtensions},
	{<<"requiredFeatures">>, Record#svg.requiredFeatures},
	{<<"systemLanguage">>, Record#svg.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#svg.xmlbase},
	{<<"xml:lang">>, Record#svg.xmllang},
	{<<"xml:space">>, Record#svg.xmlspace}
].

svg_document_event(Record)-> [
	{<<"onabort">>, Record#svg.onabort},
	{<<"onerror">>, Record#svg.onerror},
	{<<"onresize">>, Record#svg.onresize},
	{<<"onscroll">>, Record#svg.onscroll},
	{<<"onunload">>, Record#svg.onunload_document},
	{<<"onzoom">>, Record#svg.onzoom}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#svg.height},
	{<<"result">>, Record#svg.result},
	{<<"width">>, Record#svg.width},
	{<<"x">>, Record#svg.x},
	{<<"y">>, Record#svg.y}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#svg.onactivate},
	{<<"onclick">>, Record#svg.onclick},
	{<<"onfocusin">>, Record#svg.onfocusin},
	{<<"onfocusout">>, Record#svg.onfocusout},
	{<<"onload">>, Record#svg.onload_graphical},
	{<<"onmousedown">>, Record#svg.onmousedown},
	{<<"onmousemove">>, Record#svg.onmousemove},
	{<<"onmouseout">>, Record#svg.onmouseout},
	{<<"onmouseover">>, Record#svg.onmouseover},
	{<<"onmouseup">>, Record#svg.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#svg.alignment_baseline},
	{<<"baseline-shift">>, Record#svg.baseline_shift},
	{<<"clip">>, Record#svg.clip},
	{<<"clip-path">>, Record#svg.clip_path},
	{<<"clip-rule">>, Record#svg.clip_rule},
	{<<"color">>, Record#svg.color},
	{<<"color-interpolation">>, Record#svg.color_interpolation},
	{<<"color-interpolation-filters">>, Record#svg.color_interpolation_filters},
	{<<"color-profile">>, Record#svg.color_profile},
	{<<"color-rendering">>, Record#svg.color_rendering},
	{<<"cursor">>, Record#svg.cursor},
	{<<"direction">>, Record#svg.direction},
	{<<"display">>, Record#svg.display},
	{<<"dominant-baseline">>, Record#svg.dominant_baseline},
	{<<"enable-background">>, Record#svg.enable_background},
	{<<"fill">>, Record#svg.fill},
	{<<"fill-opacity">>, Record#svg.fill_opacity},
	{<<"fill-rule">>, Record#svg.fill_rule},
	{<<"filter">>, Record#svg.filter},
	{<<"flood-color">>, Record#svg.flood_color},
	{<<"flood-opacity">>, Record#svg.flood_opacity},
	{<<"font-family">>, Record#svg.font_family},
	{<<"font-size">>, Record#svg.font_size},
	{<<"font-size-adjust">>, Record#svg.font_size_adjust},
	{<<"font-stretch">>, Record#svg.font_stretch},
	{<<"font-style">>, Record#svg.font_style},
	{<<"font-variant">>, Record#svg.font_variant},
	{<<"font-weight">>, Record#svg.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#svg.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#svg.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#svg.image_rendering},
	{<<"kerning">>, Record#svg.kerning},
	{<<"letter-spacing">>, Record#svg.letter_spacing},
	{<<"lighting-color">>, Record#svg.lighting_color},
	{<<"marker-end">>, Record#svg.marker_end},
	{<<"marker-mid">>, Record#svg.marker_mid},
	{<<"marker-start">>, Record#svg.marker_start},
	{<<"mask">>, Record#svg.mask},
	{<<"opacity">>, Record#svg.opacity},
	{<<"overflow">>, Record#svg.overflow},
	{<<"pointer-events">>, Record#svg.pointer_events},
	{<<"shape-rendering">>, Record#svg.shape_rendering},
	{<<"stop-color">>, Record#svg.stop_color},
	{<<"stop-opacity">>, Record#svg.stop_opacity},
	{<<"stroke">>, Record#svg.stroke},
	{<<"stroke-dasharray">>, Record#svg.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#svg.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#svg.stroke_linecap},
	{<<"stroke-linejoin">>, Record#svg.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#svg.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#svg.stroke_opacity},
	{<<"stroke-width">>, Record#svg.stroke_width},
	{<<"text-anchor">>, Record#svg.text_anchor},
	{<<"text-decoration">>, Record#svg.text_decoration},
	{<<"text-rendering">>, Record#svg.text_rendering},
	{<<"unicode-bidi">>, Record#svg.unicode_bidi},
	{<<"visibility">>, Record#svg.visibility},
	{<<"word-spacing">>, Record#svg.word_spacing},
	{<<"writing-mode">>, Record#svg.writing_mode}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#svg.type},
	{<<"tableValues">>, Record#svg.tableValues},
	{<<"slope">>, Record#svg.slope},
	{<<"intercept">>, Record#svg.intercept},
	{<<"amplitude">>, Record#svg.amplitude},
	{<<"exponent">>, Record#svg.exponent},
	{<<"offset">>, Record#svg.offset}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#svg.xlinkhref},
	{<<"xlink:type">>, Record#svg.xlinktype},
	{<<"xlink:role">>, Record#svg.xlinkrole},
	{<<"xlink:arcrole">>, Record#svg.xlinkarcrole},
	{<<"xlink:title">>, Record#svg.xlinktitle},
	{<<"xlink:show">>, Record#svg.xlinkshow},
	{<<"xlink:actuate">>, Record#svg.xlinkactuate}
].