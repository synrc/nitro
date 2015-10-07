-module(element_filter).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"filter">>, nitro:render(Record#filter.body),
	lists:append([
		[
			{<<"id">>, Record#filter.id},
			{<<"class">>, Record#filter.class},
			{<<"style">>, Record#filter.style},
			{<<"x">>, Record#filter.x},
			{<<"y">>, Record#filter.y},
			{<<"width">>, Record#filter.width},
			{<<"height">>, Record#filter.height},
			{<<"filterRes">>, Record#filter.filterRes},
			{<<"filterUnits">>, Record#filter.filterUnits},
			{<<"primitiveUnits">>, Record#filter.primitiveUnits},
			{<<"externalResourcesRequired">>, Record#filter.externalResourcesRequired}
		],
		svg_core(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#filter.data_fields,
		Record#filter.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#filter.xmlbase},
	{<<"xml:lang">>, Record#filter.xmllang},
	{<<"xml:space">>, Record#filter.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#filter.alignment_baseline},
	{<<"baseline-shift">>, Record#filter.baseline_shift},
	{<<"clip">>, Record#filter.clip},
	{<<"clip-path">>, Record#filter.clip_path},
	{<<"clip-rule">>, Record#filter.clip_rule},
	{<<"color">>, Record#filter.color},
	{<<"color-interpolation">>, Record#filter.color_interpolation},
	{<<"color-interpolation-filters">>, Record#filter.color_interpolation_filters},
	{<<"color-profile">>, Record#filter.color_profile},
	{<<"color-rendering">>, Record#filter.color_rendering},
	{<<"cursor">>, Record#filter.cursor},
	{<<"direction">>, Record#filter.direction},
	{<<"display">>, Record#filter.display},
	{<<"dominant-baseline">>, Record#filter.dominant_baseline},
	{<<"enable-background">>, Record#filter.enable_background},
	{<<"fill">>, Record#filter.fill},
	{<<"fill-opacity">>, Record#filter.fill_opacity},
	{<<"fill-rule">>, Record#filter.fill_rule},
	{<<"filter">>, Record#filter.filter},
	{<<"flood-color">>, Record#filter.flood_color},
	{<<"flood-opacity">>, Record#filter.flood_opacity},
	{<<"font-family">>, Record#filter.font_family},
	{<<"font-size">>, Record#filter.font_size},
	{<<"font-size-adjust">>, Record#filter.font_size_adjust},
	{<<"font-stretch">>, Record#filter.font_stretch},
	{<<"font-style">>, Record#filter.font_style},
	{<<"font-variant">>, Record#filter.font_variant},
	{<<"font-weight">>, Record#filter.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#filter.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#filter.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#filter.image_rendering},
	{<<"kerning">>, Record#filter.kerning},
	{<<"letter-spacing">>, Record#filter.letter_spacing},
	{<<"lighting-color">>, Record#filter.lighting_color},
	{<<"marker-end">>, Record#filter.marker_end},
	{<<"marker-mid">>, Record#filter.marker_mid},
	{<<"marker-start">>, Record#filter.marker_start},
	{<<"mask">>, Record#filter.mask},
	{<<"opacity">>, Record#filter.opacity},
	{<<"overflow">>, Record#filter.overflow},
	{<<"pointer-events">>, Record#filter.pointer_events},
	{<<"shape-rendering">>, Record#filter.shape_rendering},
	{<<"stop-color">>, Record#filter.stop_color},
	{<<"stop-opacity">>, Record#filter.stop_opacity},
	{<<"stroke">>, Record#filter.stroke},
	{<<"stroke-dasharray">>, Record#filter.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#filter.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#filter.stroke_linecap},
	{<<"stroke-linejoin">>, Record#filter.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#filter.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#filter.stroke_opacity},
	{<<"stroke-width">>, Record#filter.stroke_width},
	{<<"text-anchor">>, Record#filter.text_anchor},
	{<<"text-decoration">>, Record#filter.text_decoration},
	{<<"text-rendering">>, Record#filter.text_rendering},
	{<<"unicode-bidi">>, Record#filter.unicode_bidi},
	{<<"visibility">>, Record#filter.visibility},
	{<<"word-spacing">>, Record#filter.word_spacing},
	{<<"writing-mode">>, Record#filter.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#filter.xlinkhref},
	{<<"xlink:type">>, Record#filter.xlinktype},
	{<<"xlink:role">>, Record#filter.xlinkrole},
	{<<"xlink:arcrole">>, Record#filter.xlinkarcrole},
	{<<"xlink:title">>, Record#filter.xlinktitle},
	{<<"xlink:show">>, Record#filter.xlinkshow},
	{<<"xlink:actuate">>, Record#filter.xlinkactuate}
].