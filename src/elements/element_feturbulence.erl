-module(element_feturbulence).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feTurbulence">>, nitro:render(Record#feTurbulence.body),
	lists:append([
		[
			{<<"id">>, Record#feTurbulence.id},
			{<<"class">>, Record#feTurbulence.class},
			{<<"style">>, Record#feTurbulence.style},
			{<<"baseFrequency">>, Record#feTurbulence.baseFrequency},
			{<<"numOctaves">>, Record#feTurbulence.numOctaves},
			{<<"seed">>, Record#feTurbulence.seed},
			{<<"stitchTiles">>, Record#feTurbulence.stitchTiles},
			{<<"type">>, Record#feTurbulence.type}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feTurbulence.data_fields,
		Record#feTurbulence.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feTurbulence.xmlbase},
	{<<"xml:lang">>, Record#feTurbulence.xmllang},
	{<<"xml:space">>, Record#feTurbulence.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feTurbulence.height},
	{<<"result">>, Record#feTurbulence.result},
	{<<"width">>, Record#feTurbulence.width},
	{<<"x">>, Record#feTurbulence.x},
	{<<"y">>, Record#feTurbulence.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feTurbulence.alignment_baseline},
	{<<"baseline-shift">>, Record#feTurbulence.baseline_shift},
	{<<"clip">>, Record#feTurbulence.clip},
	{<<"clip-path">>, Record#feTurbulence.clip_path},
	{<<"clip-rule">>, Record#feTurbulence.clip_rule},
	{<<"color">>, Record#feTurbulence.color},
	{<<"color-interpolation">>, Record#feTurbulence.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feTurbulence.color_interpolation_filters},
	{<<"color-profile">>, Record#feTurbulence.color_profile},
	{<<"color-rendering">>, Record#feTurbulence.color_rendering},
	{<<"cursor">>, Record#feTurbulence.cursor},
	{<<"direction">>, Record#feTurbulence.direction},
	{<<"display">>, Record#feTurbulence.display},
	{<<"dominant-baseline">>, Record#feTurbulence.dominant_baseline},
	{<<"enable-background">>, Record#feTurbulence.enable_background},
	{<<"fill">>, Record#feTurbulence.fill},
	{<<"fill-opacity">>, Record#feTurbulence.fill_opacity},
	{<<"fill-rule">>, Record#feTurbulence.fill_rule},
	{<<"filter">>, Record#feTurbulence.filter},
	{<<"flood-color">>, Record#feTurbulence.flood_color},
	{<<"flood-opacity">>, Record#feTurbulence.flood_opacity},
	{<<"font-family">>, Record#feTurbulence.font_family},
	{<<"font-size">>, Record#feTurbulence.font_size},
	{<<"font-size-adjust">>, Record#feTurbulence.font_size_adjust},
	{<<"font-stretch">>, Record#feTurbulence.font_stretch},
	{<<"font-style">>, Record#feTurbulence.font_style},
	{<<"font-variant">>, Record#feTurbulence.font_variant},
	{<<"font-weight">>, Record#feTurbulence.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feTurbulence.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feTurbulence.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feTurbulence.image_rendering},
	{<<"kerning">>, Record#feTurbulence.kerning},
	{<<"letter-spacing">>, Record#feTurbulence.letter_spacing},
	{<<"lighting-color">>, Record#feTurbulence.lighting_color},
	{<<"marker-end">>, Record#feTurbulence.marker_end},
	{<<"marker-mid">>, Record#feTurbulence.marker_mid},
	{<<"marker-start">>, Record#feTurbulence.marker_start},
	{<<"mask">>, Record#feTurbulence.mask},
	{<<"opacity">>, Record#feTurbulence.opacity},
	{<<"overflow">>, Record#feTurbulence.overflow},
	{<<"pointer-events">>, Record#feTurbulence.pointer_events},
	{<<"shape-rendering">>, Record#feTurbulence.shape_rendering},
	{<<"stop-color">>, Record#feTurbulence.stop_color},
	{<<"stop-opacity">>, Record#feTurbulence.stop_opacity},
	{<<"stroke">>, Record#feTurbulence.stroke},
	{<<"stroke-dasharray">>, Record#feTurbulence.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feTurbulence.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feTurbulence.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feTurbulence.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feTurbulence.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feTurbulence.stroke_opacity},
	{<<"stroke-width">>, Record#feTurbulence.stroke_width},
	{<<"text-anchor">>, Record#feTurbulence.text_anchor},
	{<<"text-decoration">>, Record#feTurbulence.text_decoration},
	{<<"text-rendering">>, Record#feTurbulence.text_rendering},
	{<<"unicode-bidi">>, Record#feTurbulence.unicode_bidi},
	{<<"visibility">>, Record#feTurbulence.visibility},
	{<<"word-spacing">>, Record#feTurbulence.word_spacing},
	{<<"writing-mode">>, Record#feTurbulence.writing_mode}
].