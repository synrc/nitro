-module(element_fediffuselighting).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feDiffuseLighting">>, nitro:render(Record#feDiffuseLighting.body),
	lists:append([
		[
			{<<"id">>, Record#feDiffuseLighting.id},
			{<<"class">>, Record#feDiffuseLighting.class},
			{<<"style">>, Record#feDiffuseLighting.style},
			{<<"in">>, Record#feDiffuseLighting.in},
			{<<"surfaceScale">>, Record#feDiffuseLighting.surfaceScale},
			{<<"diffuseConstant">>, Record#feDiffuseLighting.diffuseConstant},
			{<<"kernelUnitLength">>, Record#feDiffuseLighting.kernelUnitLength}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feDiffuseLighting.data_fields,
		Record#feDiffuseLighting.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feDiffuseLighting.xmlbase},
	{<<"xml:lang">>, Record#feDiffuseLighting.xmllang},
	{<<"xml:space">>, Record#feDiffuseLighting.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feDiffuseLighting.height},
	{<<"result">>, Record#feDiffuseLighting.result},
	{<<"width">>, Record#feDiffuseLighting.width},
	{<<"x">>, Record#feDiffuseLighting.x},
	{<<"y">>, Record#feDiffuseLighting.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feDiffuseLighting.alignment_baseline},
	{<<"baseline-shift">>, Record#feDiffuseLighting.baseline_shift},
	{<<"clip">>, Record#feDiffuseLighting.clip},
	{<<"clip-path">>, Record#feDiffuseLighting.clip_path},
	{<<"clip-rule">>, Record#feDiffuseLighting.clip_rule},
	{<<"color">>, Record#feDiffuseLighting.color},
	{<<"color-interpolation">>, Record#feDiffuseLighting.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feDiffuseLighting.color_interpolation_filters},
	{<<"color-profile">>, Record#feDiffuseLighting.color_profile},
	{<<"color-rendering">>, Record#feDiffuseLighting.color_rendering},
	{<<"cursor">>, Record#feDiffuseLighting.cursor},
	{<<"direction">>, Record#feDiffuseLighting.direction},
	{<<"display">>, Record#feDiffuseLighting.display},
	{<<"dominant-baseline">>, Record#feDiffuseLighting.dominant_baseline},
	{<<"enable-background">>, Record#feDiffuseLighting.enable_background},
	{<<"fill">>, Record#feDiffuseLighting.fill},
	{<<"fill-opacity">>, Record#feDiffuseLighting.fill_opacity},
	{<<"fill-rule">>, Record#feDiffuseLighting.fill_rule},
	{<<"filter">>, Record#feDiffuseLighting.filter},
	{<<"flood-color">>, Record#feDiffuseLighting.flood_color},
	{<<"flood-opacity">>, Record#feDiffuseLighting.flood_opacity},
	{<<"font-family">>, Record#feDiffuseLighting.font_family},
	{<<"font-size">>, Record#feDiffuseLighting.font_size},
	{<<"font-size-adjust">>, Record#feDiffuseLighting.font_size_adjust},
	{<<"font-stretch">>, Record#feDiffuseLighting.font_stretch},
	{<<"font-style">>, Record#feDiffuseLighting.font_style},
	{<<"font-variant">>, Record#feDiffuseLighting.font_variant},
	{<<"font-weight">>, Record#feDiffuseLighting.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feDiffuseLighting.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feDiffuseLighting.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feDiffuseLighting.image_rendering},
	{<<"kerning">>, Record#feDiffuseLighting.kerning},
	{<<"letter-spacing">>, Record#feDiffuseLighting.letter_spacing},
	{<<"lighting-color">>, Record#feDiffuseLighting.lighting_color},
	{<<"marker-end">>, Record#feDiffuseLighting.marker_end},
	{<<"marker-mid">>, Record#feDiffuseLighting.marker_mid},
	{<<"marker-start">>, Record#feDiffuseLighting.marker_start},
	{<<"mask">>, Record#feDiffuseLighting.mask},
	{<<"opacity">>, Record#feDiffuseLighting.opacity},
	{<<"overflow">>, Record#feDiffuseLighting.overflow},
	{<<"pointer-events">>, Record#feDiffuseLighting.pointer_events},
	{<<"shape-rendering">>, Record#feDiffuseLighting.shape_rendering},
	{<<"stop-color">>, Record#feDiffuseLighting.stop_color},
	{<<"stop-opacity">>, Record#feDiffuseLighting.stop_opacity},
	{<<"stroke">>, Record#feDiffuseLighting.stroke},
	{<<"stroke-dasharray">>, Record#feDiffuseLighting.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feDiffuseLighting.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feDiffuseLighting.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feDiffuseLighting.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feDiffuseLighting.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feDiffuseLighting.stroke_opacity},
	{<<"stroke-width">>, Record#feDiffuseLighting.stroke_width},
	{<<"text-anchor">>, Record#feDiffuseLighting.text_anchor},
	{<<"text-decoration">>, Record#feDiffuseLighting.text_decoration},
	{<<"text-rendering">>, Record#feDiffuseLighting.text_rendering},
	{<<"unicode-bidi">>, Record#feDiffuseLighting.unicode_bidi},
	{<<"visibility">>, Record#feDiffuseLighting.visibility},
	{<<"word-spacing">>, Record#feDiffuseLighting.word_spacing},
	{<<"writing-mode">>, Record#feDiffuseLighting.writing_mode}
].