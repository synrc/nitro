-module(element_fecolormatrix).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feColorMatrix">>, nitro:render(Record#feColorMatrix.body),
	lists:append([
		[
			{<<"id">>, Record#feColorMatrix.id},
			{<<"class">>, Record#feColorMatrix.class},
			{<<"style">>, Record#feColorMatrix.style},
			{<<"in">>, Record#feColorMatrix.in},
			{<<"type">>, Record#feColorMatrix.type},
			{<<"values">>, Record#feColorMatrix.values}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feColorMatrix.data_fields,
		Record#feColorMatrix.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feColorMatrix.xmlbase},
	{<<"xml:lang">>, Record#feColorMatrix.xmllang},
	{<<"xml:space">>, Record#feColorMatrix.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feColorMatrix.height},
	{<<"result">>, Record#feColorMatrix.result},
	{<<"width">>, Record#feColorMatrix.width},
	{<<"x">>, Record#feColorMatrix.x},
	{<<"y">>, Record#feColorMatrix.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feColorMatrix.alignment_baseline},
	{<<"baseline-shift">>, Record#feColorMatrix.baseline_shift},
	{<<"clip">>, Record#feColorMatrix.clip},
	{<<"clip-path">>, Record#feColorMatrix.clip_path},
	{<<"clip-rule">>, Record#feColorMatrix.clip_rule},
	{<<"color">>, Record#feColorMatrix.color},
	{<<"color-interpolation">>, Record#feColorMatrix.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feColorMatrix.color_interpolation_filters},
	{<<"color-profile">>, Record#feColorMatrix.color_profile},
	{<<"color-rendering">>, Record#feColorMatrix.color_rendering},
	{<<"cursor">>, Record#feColorMatrix.cursor},
	{<<"direction">>, Record#feColorMatrix.direction},
	{<<"display">>, Record#feColorMatrix.display},
	{<<"dominant-baseline">>, Record#feColorMatrix.dominant_baseline},
	{<<"enable-background">>, Record#feColorMatrix.enable_background},
	{<<"fill">>, Record#feColorMatrix.fill},
	{<<"fill-opacity">>, Record#feColorMatrix.fill_opacity},
	{<<"fill-rule">>, Record#feColorMatrix.fill_rule},
	{<<"filter">>, Record#feColorMatrix.filter},
	{<<"flood-color">>, Record#feColorMatrix.flood_color},
	{<<"flood-opacity">>, Record#feColorMatrix.flood_opacity},
	{<<"font-family">>, Record#feColorMatrix.font_family},
	{<<"font-size">>, Record#feColorMatrix.font_size},
	{<<"font-size-adjust">>, Record#feColorMatrix.font_size_adjust},
	{<<"font-stretch">>, Record#feColorMatrix.font_stretch},
	{<<"font-style">>, Record#feColorMatrix.font_style},
	{<<"font-variant">>, Record#feColorMatrix.font_variant},
	{<<"font-weight">>, Record#feColorMatrix.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feColorMatrix.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feColorMatrix.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feColorMatrix.image_rendering},
	{<<"kerning">>, Record#feColorMatrix.kerning},
	{<<"letter-spacing">>, Record#feColorMatrix.letter_spacing},
	{<<"lighting-color">>, Record#feColorMatrix.lighting_color},
	{<<"marker-end">>, Record#feColorMatrix.marker_end},
	{<<"marker-mid">>, Record#feColorMatrix.marker_mid},
	{<<"marker-start">>, Record#feColorMatrix.marker_start},
	{<<"mask">>, Record#feColorMatrix.mask},
	{<<"opacity">>, Record#feColorMatrix.opacity},
	{<<"overflow">>, Record#feColorMatrix.overflow},
	{<<"pointer-events">>, Record#feColorMatrix.pointer_events},
	{<<"shape-rendering">>, Record#feColorMatrix.shape_rendering},
	{<<"stop-color">>, Record#feColorMatrix.stop_color},
	{<<"stop-opacity">>, Record#feColorMatrix.stop_opacity},
	{<<"stroke">>, Record#feColorMatrix.stroke},
	{<<"stroke-dasharray">>, Record#feColorMatrix.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feColorMatrix.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feColorMatrix.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feColorMatrix.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feColorMatrix.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feColorMatrix.stroke_opacity},
	{<<"stroke-width">>, Record#feColorMatrix.stroke_width},
	{<<"text-anchor">>, Record#feColorMatrix.text_anchor},
	{<<"text-decoration">>, Record#feColorMatrix.text_decoration},
	{<<"text-rendering">>, Record#feColorMatrix.text_rendering},
	{<<"unicode-bidi">>, Record#feColorMatrix.unicode_bidi},
	{<<"visibility">>, Record#feColorMatrix.visibility},
	{<<"word-spacing">>, Record#feColorMatrix.word_spacing},
	{<<"writing-mode">>, Record#feColorMatrix.writing_mode}
].