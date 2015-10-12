-module(element_femerge).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feMerge">>, nitro:render(Record#feMerge.body),
	lists:append([
		[
			{<<"id">>, Record#feMerge.id},
			{<<"class">>, Record#feMerge.class},
			{<<"style">>, Record#feMerge.style}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feMerge.data_fields,
		Record#feMerge.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feMerge.xmlbase},
	{<<"xml:lang">>, Record#feMerge.xmllang},
	{<<"xml:space">>, Record#feMerge.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feMerge.height},
	{<<"result">>, Record#feMerge.result},
	{<<"width">>, Record#feMerge.width},
	{<<"x">>, Record#feMerge.x},
	{<<"y">>, Record#feMerge.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feMerge.alignment_baseline},
	{<<"baseline-shift">>, Record#feMerge.baseline_shift},
	{<<"clip">>, Record#feMerge.clip},
	{<<"clip-path">>, Record#feMerge.clip_path},
	{<<"clip-rule">>, Record#feMerge.clip_rule},
	{<<"color">>, Record#feMerge.color},
	{<<"color-interpolation">>, Record#feMerge.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feMerge.color_interpolation_filters},
	{<<"color-profile">>, Record#feMerge.color_profile},
	{<<"color-rendering">>, Record#feMerge.color_rendering},
	{<<"cursor">>, Record#feMerge.cursor},
	{<<"direction">>, Record#feMerge.direction},
	{<<"display">>, Record#feMerge.display},
	{<<"dominant-baseline">>, Record#feMerge.dominant_baseline},
	{<<"enable-background">>, Record#feMerge.enable_background},
	{<<"fill">>, Record#feMerge.fill},
	{<<"fill-opacity">>, Record#feMerge.fill_opacity},
	{<<"fill-rule">>, Record#feMerge.fill_rule},
	{<<"filter">>, Record#feMerge.filter},
	{<<"flood-color">>, Record#feMerge.flood_color},
	{<<"flood-opacity">>, Record#feMerge.flood_opacity},
	{<<"font-family">>, Record#feMerge.font_family},
	{<<"font-size">>, Record#feMerge.font_size},
	{<<"font-size-adjust">>, Record#feMerge.font_size_adjust},
	{<<"font-stretch">>, Record#feMerge.font_stretch},
	{<<"font-style">>, Record#feMerge.font_style},
	{<<"font-variant">>, Record#feMerge.font_variant},
	{<<"font-weight">>, Record#feMerge.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feMerge.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feMerge.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feMerge.image_rendering},
	{<<"kerning">>, Record#feMerge.kerning},
	{<<"letter-spacing">>, Record#feMerge.letter_spacing},
	{<<"lighting-color">>, Record#feMerge.lighting_color},
	{<<"marker-end">>, Record#feMerge.marker_end},
	{<<"marker-mid">>, Record#feMerge.marker_mid},
	{<<"marker-start">>, Record#feMerge.marker_start},
	{<<"mask">>, Record#feMerge.mask},
	{<<"opacity">>, Record#feMerge.opacity},
	{<<"overflow">>, Record#feMerge.overflow},
	{<<"pointer-events">>, Record#feMerge.pointer_events},
	{<<"shape-rendering">>, Record#feMerge.shape_rendering},
	{<<"stop-color">>, Record#feMerge.stop_color},
	{<<"stop-opacity">>, Record#feMerge.stop_opacity},
	{<<"stroke">>, Record#feMerge.stroke},
	{<<"stroke-dasharray">>, Record#feMerge.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feMerge.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feMerge.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feMerge.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feMerge.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feMerge.stroke_opacity},
	{<<"stroke-width">>, Record#feMerge.stroke_width},
	{<<"text-anchor">>, Record#feMerge.text_anchor},
	{<<"text-decoration">>, Record#feMerge.text_decoration},
	{<<"text-rendering">>, Record#feMerge.text_rendering},
	{<<"unicode-bidi">>, Record#feMerge.unicode_bidi},
	{<<"visibility">>, Record#feMerge.visibility},
	{<<"word-spacing">>, Record#feMerge.word_spacing},
	{<<"writing-mode">>, Record#feMerge.writing_mode}
].