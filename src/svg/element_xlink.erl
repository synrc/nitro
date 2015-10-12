-module(element_xlink).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	Id = case Record#xlink.postback of
		undefined -> Record#xlink.id;
		Postback ->
			ID = case Record#xlink.id of undefined ->
				nitro:temp_id();
				I -> I
			end,
			nitro:wire(#event{ type=click,postback=Postback,target=ID, source=Record#xlink.source,delegate=Record#xlink.delegate,validation=Record#xlink.validate}),
			ID
	end,
	wf_tags:emit_tag(<<"a">>, nitro:render(Record#xlink.body),
	lists:append([
		[
			{<<"id">>, Id},
			{<<"class">>, Record#xlink.class},
			{<<"style">>, Record#xlink.style},
			{<<"transform">>, Record#xlink.transform},
			{<<"target">>, Record#xlink.target},
			{<<"externalResourcesRequired">>, Record#xlink.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_transfert_function(Record),
		svg_xlink(Record),
		Record#xlink.data_fields,
		Record#xlink.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#xlink.requiredExtensions},
	{<<"requiredFeatures">>, Record#xlink.requiredFeatures},
	{<<"systemLanguage">>, Record#xlink.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#xlink.xmlbase},
	{<<"xml:lang">>, Record#xlink.xmllang},
	{<<"xml:space">>, Record#xlink.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#xlink.height},
	{<<"result">>, Record#xlink.result},
	{<<"width">>, Record#xlink.width},
	{<<"x">>, Record#xlink.x},
	{<<"y">>, Record#xlink.y}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#xlink.onactivate},
	{<<"onclick">>, Record#xlink.onclick},
	{<<"onfocusin">>, Record#xlink.onfocusin},
	{<<"onfocusout">>, Record#xlink.onfocusout},
	{<<"onload">>, Record#xlink.onload_graphical},
	{<<"onmousedown">>, Record#xlink.onmousedown},
	{<<"onmousemove">>, Record#xlink.onmousemove},
	{<<"onmouseout">>, Record#xlink.onmouseout},
	{<<"onmouseover">>, Record#xlink.onmouseover},
	{<<"onmouseup">>, Record#xlink.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#xlink.alignment_baseline},
	{<<"baseline-shift">>, Record#xlink.baseline_shift},
	{<<"clip">>, Record#xlink.clip},
	{<<"clip-path">>, Record#xlink.clip_path},
	{<<"clip-rule">>, Record#xlink.clip_rule},
	{<<"color">>, Record#xlink.color},
	{<<"color-interpolation">>, Record#xlink.color_interpolation},
	{<<"color-interpolation-filters">>, Record#xlink.color_interpolation_filters},
	{<<"color-profile">>, Record#xlink.color_profile},
	{<<"color-rendering">>, Record#xlink.color_rendering},
	{<<"cursor">>, Record#xlink.cursor},
	{<<"direction">>, Record#xlink.direction},
	{<<"display">>, Record#xlink.display},
	{<<"dominant-baseline">>, Record#xlink.dominant_baseline},
	{<<"enable-background">>, Record#xlink.enable_background},
	{<<"fill">>, Record#xlink.fill},
	{<<"fill-opacity">>, Record#xlink.fill_opacity},
	{<<"fill-rule">>, Record#xlink.fill_rule},
	{<<"filter">>, Record#xlink.filter},
	{<<"flood-color">>, Record#xlink.flood_color},
	{<<"flood-opacity">>, Record#xlink.flood_opacity},
	{<<"font-family">>, Record#xlink.font_family},
	{<<"font-size">>, Record#xlink.font_size},
	{<<"font-size-adjust">>, Record#xlink.font_size_adjust},
	{<<"font-stretch">>, Record#xlink.font_stretch},
	{<<"font-style">>, Record#xlink.font_style},
	{<<"font-variant">>, Record#xlink.font_variant},
	{<<"font-weight">>, Record#xlink.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#xlink.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#xlink.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#xlink.image_rendering},
	{<<"kerning">>, Record#xlink.kerning},
	{<<"letter-spacing">>, Record#xlink.letter_spacing},
	{<<"lighting-color">>, Record#xlink.lighting_color},
	{<<"marker-end">>, Record#xlink.marker_end},
	{<<"marker-mid">>, Record#xlink.marker_mid},
	{<<"marker-start">>, Record#xlink.marker_start},
	{<<"mask">>, Record#xlink.mask},
	{<<"opacity">>, Record#xlink.opacity},
	{<<"overflow">>, Record#xlink.overflow},
	{<<"pointer-events">>, Record#xlink.pointer_events},
	{<<"shape-rendering">>, Record#xlink.shape_rendering},
	{<<"stop-color">>, Record#xlink.stop_color},
	{<<"stop-opacity">>, Record#xlink.stop_opacity},
	{<<"stroke">>, Record#xlink.stroke},
	{<<"stroke-dasharray">>, Record#xlink.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#xlink.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#xlink.stroke_linecap},
	{<<"stroke-linejoin">>, Record#xlink.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#xlink.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#xlink.stroke_opacity},
	{<<"stroke-width">>, Record#xlink.stroke_width},
	{<<"text-anchor">>, Record#xlink.text_anchor},
	{<<"text-decoration">>, Record#xlink.text_decoration},
	{<<"text-rendering">>, Record#xlink.text_rendering},
	{<<"unicode-bidi">>, Record#xlink.unicode_bidi},
	{<<"visibility">>, Record#xlink.visibility},
	{<<"word-spacing">>, Record#xlink.word_spacing},
	{<<"writing-mode">>, Record#xlink.writing_mode}
].

svg_transfert_function(Record)-> [
	{<<"type">>, Record#xlink.type},
	{<<"tableValues">>, Record#xlink.tableValues},
	{<<"slope">>, Record#xlink.slope},
	{<<"intercept">>, Record#xlink.intercept},
	{<<"amplitude">>, Record#xlink.amplitude},
	{<<"exponent">>, Record#xlink.exponent},
	{<<"offset">>, Record#xlink.offset}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#xlink.xlinkhref},
	{<<"xlink:type">>, Record#xlink.xlinktype},
	{<<"xlink:role">>, Record#xlink.xlinkrole},
	{<<"xlink:arcrole">>, Record#xlink.xlinkarcrole},
	{<<"xlink:title">>, Record#xlink.xlinktitle},
	{<<"xlink:show">>, Record#xlink.xlinkshow},
	{<<"xlink:actuate">>, Record#xlink.xlinkactuate}
].