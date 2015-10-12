-module(element_femorphology).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feMorphology">>, nitro:render(Record#feMorphology.body),
	lists:append([
		[
			{<<"id">>, Record#feMorphology.id},
			{<<"class">>, Record#feMorphology.class},
			{<<"style">>, Record#feMorphology.style},
			{<<"in">>, Record#feMorphology.in},
			{<<"operator">>, Record#feMorphology.operator},
			{<<"radius">>, Record#feMorphology.radius}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feMorphology.data_fields,
		Record#feMorphology.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feMorphology.xmlbase},
	{<<"xml:lang">>, Record#feMorphology.xmllang},
	{<<"xml:space">>, Record#feMorphology.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feMorphology.height},
	{<<"result">>, Record#feMorphology.result},
	{<<"width">>, Record#feMorphology.width},
	{<<"x">>, Record#feMorphology.x},
	{<<"y">>, Record#feMorphology.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feMorphology.alignment_baseline},
	{<<"baseline-shift">>, Record#feMorphology.baseline_shift},
	{<<"clip">>, Record#feMorphology.clip},
	{<<"clip-path">>, Record#feMorphology.clip_path},
	{<<"clip-rule">>, Record#feMorphology.clip_rule},
	{<<"color">>, Record#feMorphology.color},
	{<<"color-interpolation">>, Record#feMorphology.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feMorphology.color_interpolation_filters},
	{<<"color-profile">>, Record#feMorphology.color_profile},
	{<<"color-rendering">>, Record#feMorphology.color_rendering},
	{<<"cursor">>, Record#feMorphology.cursor},
	{<<"direction">>, Record#feMorphology.direction},
	{<<"display">>, Record#feMorphology.display},
	{<<"dominant-baseline">>, Record#feMorphology.dominant_baseline},
	{<<"enable-background">>, Record#feMorphology.enable_background},
	{<<"fill">>, Record#feMorphology.fill},
	{<<"fill-opacity">>, Record#feMorphology.fill_opacity},
	{<<"fill-rule">>, Record#feMorphology.fill_rule},
	{<<"filter">>, Record#feMorphology.filter},
	{<<"flood-color">>, Record#feMorphology.flood_color},
	{<<"flood-opacity">>, Record#feMorphology.flood_opacity},
	{<<"font-family">>, Record#feMorphology.font_family},
	{<<"font-size">>, Record#feMorphology.font_size},
	{<<"font-size-adjust">>, Record#feMorphology.font_size_adjust},
	{<<"font-stretch">>, Record#feMorphology.font_stretch},
	{<<"font-style">>, Record#feMorphology.font_style},
	{<<"font-variant">>, Record#feMorphology.font_variant},
	{<<"font-weight">>, Record#feMorphology.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feMorphology.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feMorphology.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feMorphology.image_rendering},
	{<<"kerning">>, Record#feMorphology.kerning},
	{<<"letter-spacing">>, Record#feMorphology.letter_spacing},
	{<<"lighting-color">>, Record#feMorphology.lighting_color},
	{<<"marker-end">>, Record#feMorphology.marker_end},
	{<<"marker-mid">>, Record#feMorphology.marker_mid},
	{<<"marker-start">>, Record#feMorphology.marker_start},
	{<<"mask">>, Record#feMorphology.mask},
	{<<"opacity">>, Record#feMorphology.opacity},
	{<<"overflow">>, Record#feMorphology.overflow},
	{<<"pointer-events">>, Record#feMorphology.pointer_events},
	{<<"shape-rendering">>, Record#feMorphology.shape_rendering},
	{<<"stop-color">>, Record#feMorphology.stop_color},
	{<<"stop-opacity">>, Record#feMorphology.stop_opacity},
	{<<"stroke">>, Record#feMorphology.stroke},
	{<<"stroke-dasharray">>, Record#feMorphology.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feMorphology.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feMorphology.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feMorphology.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feMorphology.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feMorphology.stroke_opacity},
	{<<"stroke-width">>, Record#feMorphology.stroke_width},
	{<<"text-anchor">>, Record#feMorphology.text_anchor},
	{<<"text-decoration">>, Record#feMorphology.text_decoration},
	{<<"text-rendering">>, Record#feMorphology.text_rendering},
	{<<"unicode-bidi">>, Record#feMorphology.unicode_bidi},
	{<<"visibility">>, Record#feMorphology.visibility},
	{<<"word-spacing">>, Record#feMorphology.word_spacing},
	{<<"writing-mode">>, Record#feMorphology.writing_mode}
].