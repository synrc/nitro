-module(element_feimage).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feImage">>, nitro:render(Record#feImage.body),
	lists:append([
		[
			{<<"id">>, Record#feImage.id},
			{<<"class">>, Record#feImage.class},
			{<<"style">>, Record#feImage.style},
			{<<"preserveAspectRatio">>, Record#feImage.preserveAspectRatio},
			{<<"externalResourcesRequired">>, Record#feImage.externalResourcesRequired}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#feImage.data_fields,
		Record#feImage.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feImage.xmlbase},
	{<<"xml:lang">>, Record#feImage.xmllang},
	{<<"xml:space">>, Record#feImage.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feImage.height},
	{<<"result">>, Record#feImage.result},
	{<<"width">>, Record#feImage.width},
	{<<"x">>, Record#feImage.x},
	{<<"y">>, Record#feImage.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feImage.alignment_baseline},
	{<<"baseline-shift">>, Record#feImage.baseline_shift},
	{<<"clip">>, Record#feImage.clip},
	{<<"clip-path">>, Record#feImage.clip_path},
	{<<"clip-rule">>, Record#feImage.clip_rule},
	{<<"color">>, Record#feImage.color},
	{<<"color-interpolation">>, Record#feImage.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feImage.color_interpolation_filters},
	{<<"color-profile">>, Record#feImage.color_profile},
	{<<"color-rendering">>, Record#feImage.color_rendering},
	{<<"cursor">>, Record#feImage.cursor},
	{<<"direction">>, Record#feImage.direction},
	{<<"display">>, Record#feImage.display},
	{<<"dominant-baseline">>, Record#feImage.dominant_baseline},
	{<<"enable-background">>, Record#feImage.enable_background},
	{<<"fill">>, Record#feImage.fill},
	{<<"fill-opacity">>, Record#feImage.fill_opacity},
	{<<"fill-rule">>, Record#feImage.fill_rule},
	{<<"filter">>, Record#feImage.filter},
	{<<"flood-color">>, Record#feImage.flood_color},
	{<<"flood-opacity">>, Record#feImage.flood_opacity},
	{<<"font-family">>, Record#feImage.font_family},
	{<<"font-size">>, Record#feImage.font_size},
	{<<"font-size-adjust">>, Record#feImage.font_size_adjust},
	{<<"font-stretch">>, Record#feImage.font_stretch},
	{<<"font-style">>, Record#feImage.font_style},
	{<<"font-variant">>, Record#feImage.font_variant},
	{<<"font-weight">>, Record#feImage.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feImage.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feImage.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feImage.image_rendering},
	{<<"kerning">>, Record#feImage.kerning},
	{<<"letter-spacing">>, Record#feImage.letter_spacing},
	{<<"lighting-color">>, Record#feImage.lighting_color},
	{<<"marker-end">>, Record#feImage.marker_end},
	{<<"marker-mid">>, Record#feImage.marker_mid},
	{<<"marker-start">>, Record#feImage.marker_start},
	{<<"mask">>, Record#feImage.mask},
	{<<"opacity">>, Record#feImage.opacity},
	{<<"overflow">>, Record#feImage.overflow},
	{<<"pointer-events">>, Record#feImage.pointer_events},
	{<<"shape-rendering">>, Record#feImage.shape_rendering},
	{<<"stop-color">>, Record#feImage.stop_color},
	{<<"stop-opacity">>, Record#feImage.stop_opacity},
	{<<"stroke">>, Record#feImage.stroke},
	{<<"stroke-dasharray">>, Record#feImage.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feImage.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feImage.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feImage.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feImage.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feImage.stroke_opacity},
	{<<"stroke-width">>, Record#feImage.stroke_width},
	{<<"text-anchor">>, Record#feImage.text_anchor},
	{<<"text-decoration">>, Record#feImage.text_decoration},
	{<<"text-rendering">>, Record#feImage.text_rendering},
	{<<"unicode-bidi">>, Record#feImage.unicode_bidi},
	{<<"visibility">>, Record#feImage.visibility},
	{<<"word-spacing">>, Record#feImage.word_spacing},
	{<<"writing-mode">>, Record#feImage.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#feImage.xlinkhref},
	{<<"xlink:type">>, Record#feImage.xlinktype},
	{<<"xlink:role">>, Record#feImage.xlinkrole},
	{<<"xlink:arcrole">>, Record#feImage.xlinkarcrole},
	{<<"xlink:title">>, Record#feImage.xlinktitle},
	{<<"xlink:show">>, Record#feImage.xlinkshow},
	{<<"xlink:actuate">>, Record#feImage.xlinkactuate}
].