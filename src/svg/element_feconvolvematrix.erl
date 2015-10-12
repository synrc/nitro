-module(element_feconvolvematrix).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feConvolveMatrix">>, nitro:render(Record#feConvolveMatrix.body),
	lists:append([
		[
			{<<"id">>, Record#feConvolveMatrix.id},
			{<<"class">>, Record#feConvolveMatrix.class},
			{<<"style">>, Record#feConvolveMatrix.style},
			{<<"in">>, Record#feConvolveMatrix.in},
			{<<"order">>, Record#feConvolveMatrix.order},
			{<<"kernelMatrix">>, Record#feConvolveMatrix.kernelMatrix},
			{<<"divisor">>, Record#feConvolveMatrix.divisor},
			{<<"bias">>, Record#feConvolveMatrix.bias},
			{<<"targetX">>, Record#feConvolveMatrix.targetX},
			{<<"targetY">>, Record#feConvolveMatrix.order},
			{<<"edgeMode">>, Record#feConvolveMatrix.edgeMode},
			{<<"kernelUnitLength">>, Record#feConvolveMatrix.kernelUnitLength}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feConvolveMatrix.data_fields,
		Record#feConvolveMatrix.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feConvolveMatrix.xmlbase},
	{<<"xml:lang">>, Record#feConvolveMatrix.xmllang},
	{<<"xml:space">>, Record#feConvolveMatrix.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feConvolveMatrix.height},
	{<<"result">>, Record#feConvolveMatrix.result},
	{<<"width">>, Record#feConvolveMatrix.width},
	{<<"x">>, Record#feConvolveMatrix.x},
	{<<"y">>, Record#feConvolveMatrix.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feConvolveMatrix.alignment_baseline},
	{<<"baseline-shift">>, Record#feConvolveMatrix.baseline_shift},
	{<<"clip">>, Record#feConvolveMatrix.clip},
	{<<"clip-path">>, Record#feConvolveMatrix.clip_path},
	{<<"clip-rule">>, Record#feConvolveMatrix.clip_rule},
	{<<"color">>, Record#feConvolveMatrix.color},
	{<<"color-interpolation">>, Record#feConvolveMatrix.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feConvolveMatrix.color_interpolation_filters},
	{<<"color-profile">>, Record#feConvolveMatrix.color_profile},
	{<<"color-rendering">>, Record#feConvolveMatrix.color_rendering},
	{<<"cursor">>, Record#feConvolveMatrix.cursor},
	{<<"direction">>, Record#feConvolveMatrix.direction},
	{<<"display">>, Record#feConvolveMatrix.display},
	{<<"dominant-baseline">>, Record#feConvolveMatrix.dominant_baseline},
	{<<"enable-background">>, Record#feConvolveMatrix.enable_background},
	{<<"fill">>, Record#feConvolveMatrix.fill},
	{<<"fill-opacity">>, Record#feConvolveMatrix.fill_opacity},
	{<<"fill-rule">>, Record#feConvolveMatrix.fill_rule},
	{<<"filter">>, Record#feConvolveMatrix.filter},
	{<<"flood-color">>, Record#feConvolveMatrix.flood_color},
	{<<"flood-opacity">>, Record#feConvolveMatrix.flood_opacity},
	{<<"font-family">>, Record#feConvolveMatrix.font_family},
	{<<"font-size">>, Record#feConvolveMatrix.font_size},
	{<<"font-size-adjust">>, Record#feConvolveMatrix.font_size_adjust},
	{<<"font-stretch">>, Record#feConvolveMatrix.font_stretch},
	{<<"font-style">>, Record#feConvolveMatrix.font_style},
	{<<"font-variant">>, Record#feConvolveMatrix.font_variant},
	{<<"font-weight">>, Record#feConvolveMatrix.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feConvolveMatrix.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feConvolveMatrix.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feConvolveMatrix.image_rendering},
	{<<"kerning">>, Record#feConvolveMatrix.kerning},
	{<<"letter-spacing">>, Record#feConvolveMatrix.letter_spacing},
	{<<"lighting-color">>, Record#feConvolveMatrix.lighting_color},
	{<<"marker-end">>, Record#feConvolveMatrix.marker_end},
	{<<"marker-mid">>, Record#feConvolveMatrix.marker_mid},
	{<<"marker-start">>, Record#feConvolveMatrix.marker_start},
	{<<"mask">>, Record#feConvolveMatrix.mask},
	{<<"opacity">>, Record#feConvolveMatrix.opacity},
	{<<"overflow">>, Record#feConvolveMatrix.overflow},
	{<<"pointer-events">>, Record#feConvolveMatrix.pointer_events},
	{<<"shape-rendering">>, Record#feConvolveMatrix.shape_rendering},
	{<<"stop-color">>, Record#feConvolveMatrix.stop_color},
	{<<"stop-opacity">>, Record#feConvolveMatrix.stop_opacity},
	{<<"stroke">>, Record#feConvolveMatrix.stroke},
	{<<"stroke-dasharray">>, Record#feConvolveMatrix.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feConvolveMatrix.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feConvolveMatrix.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feConvolveMatrix.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feConvolveMatrix.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feConvolveMatrix.stroke_opacity},
	{<<"stroke-width">>, Record#feConvolveMatrix.stroke_width},
	{<<"text-anchor">>, Record#feConvolveMatrix.text_anchor},
	{<<"text-decoration">>, Record#feConvolveMatrix.text_decoration},
	{<<"text-rendering">>, Record#feConvolveMatrix.text_rendering},
	{<<"unicode-bidi">>, Record#feConvolveMatrix.unicode_bidi},
	{<<"visibility">>, Record#feConvolveMatrix.visibility},
	{<<"word-spacing">>, Record#feConvolveMatrix.word_spacing},
	{<<"writing-mode">>, Record#feConvolveMatrix.writing_mode}
].