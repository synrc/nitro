-module(element_fecomposite).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feComposite">>, nitro:render(Record#feComposite.body),
	lists:append([
		[
			{<<"id">>, Record#feComposite.id},
			{<<"class">>, Record#feComposite.class},
			{<<"style">>, Record#feComposite.style},
			{<<"in">>, Record#feComposite.in},
			{<<"in2">>, Record#feComposite.in2},
			{<<"operator">>, Record#feComposite.operator},
			{<<"k1">>, Record#feComposite.k1},
			{<<"k2">>, Record#feComposite.k2},
			{<<"k3">>, Record#feComposite.k3},
			{<<"k4">>, Record#feComposite.k4}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feComposite.data_fields,
		Record#feComposite.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feComposite.xmlbase},
	{<<"xml:lang">>, Record#feComposite.xmllang},
	{<<"xml:space">>, Record#feComposite.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feComposite.height},
	{<<"result">>, Record#feComposite.result},
	{<<"width">>, Record#feComposite.width},
	{<<"x">>, Record#feComposite.x},
	{<<"y">>, Record#feComposite.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feComposite.alignment_baseline},
	{<<"baseline-shift">>, Record#feComposite.baseline_shift},
	{<<"clip">>, Record#feComposite.clip},
	{<<"clip-path">>, Record#feComposite.clip_path},
	{<<"clip-rule">>, Record#feComposite.clip_rule},
	{<<"color">>, Record#feComposite.color},
	{<<"color-interpolation">>, Record#feComposite.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feComposite.color_interpolation_filters},
	{<<"color-profile">>, Record#feComposite.color_profile},
	{<<"color-rendering">>, Record#feComposite.color_rendering},
	{<<"cursor">>, Record#feComposite.cursor},
	{<<"direction">>, Record#feComposite.direction},
	{<<"display">>, Record#feComposite.display},
	{<<"dominant-baseline">>, Record#feComposite.dominant_baseline},
	{<<"enable-background">>, Record#feComposite.enable_background},
	{<<"fill">>, Record#feComposite.fill},
	{<<"fill-opacity">>, Record#feComposite.fill_opacity},
	{<<"fill-rule">>, Record#feComposite.fill_rule},
	{<<"filter">>, Record#feComposite.filter},
	{<<"flood-color">>, Record#feComposite.flood_color},
	{<<"flood-opacity">>, Record#feComposite.flood_opacity},
	{<<"font-family">>, Record#feComposite.font_family},
	{<<"font-size">>, Record#feComposite.font_size},
	{<<"font-size-adjust">>, Record#feComposite.font_size_adjust},
	{<<"font-stretch">>, Record#feComposite.font_stretch},
	{<<"font-style">>, Record#feComposite.font_style},
	{<<"font-variant">>, Record#feComposite.font_variant},
	{<<"font-weight">>, Record#feComposite.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feComposite.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feComposite.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feComposite.image_rendering},
	{<<"kerning">>, Record#feComposite.kerning},
	{<<"letter-spacing">>, Record#feComposite.letter_spacing},
	{<<"lighting-color">>, Record#feComposite.lighting_color},
	{<<"marker-end">>, Record#feComposite.marker_end},
	{<<"marker-mid">>, Record#feComposite.marker_mid},
	{<<"marker-start">>, Record#feComposite.marker_start},
	{<<"mask">>, Record#feComposite.mask},
	{<<"opacity">>, Record#feComposite.opacity},
	{<<"overflow">>, Record#feComposite.overflow},
	{<<"pointer-events">>, Record#feComposite.pointer_events},
	{<<"shape-rendering">>, Record#feComposite.shape_rendering},
	{<<"stop-color">>, Record#feComposite.stop_color},
	{<<"stop-opacity">>, Record#feComposite.stop_opacity},
	{<<"stroke">>, Record#feComposite.stroke},
	{<<"stroke-dasharray">>, Record#feComposite.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feComposite.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feComposite.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feComposite.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feComposite.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feComposite.stroke_opacity},
	{<<"stroke-width">>, Record#feComposite.stroke_width},
	{<<"text-anchor">>, Record#feComposite.text_anchor},
	{<<"text-decoration">>, Record#feComposite.text_decoration},
	{<<"text-rendering">>, Record#feComposite.text_rendering},
	{<<"unicode-bidi">>, Record#feComposite.unicode_bidi},
	{<<"visibility">>, Record#feComposite.visibility},
	{<<"word-spacing">>, Record#feComposite.word_spacing},
	{<<"writing-mode">>, Record#feComposite.writing_mode}
].