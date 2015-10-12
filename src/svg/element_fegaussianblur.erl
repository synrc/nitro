-module(element_fegaussianblur).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feGaussianBlur">>, nitro:render(Record#feGaussianBlur.body),
	lists:append([
		[
			{<<"id">>, Record#feGaussianBlur.id},
			{<<"class">>, Record#feGaussianBlur.class},
			{<<"style">>, Record#feGaussianBlur.style},
			{<<"in">>, Record#feGaussianBlur.in},
			{<<"stdDeviation">>, Record#feGaussianBlur.stdDeviation}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feGaussianBlur.data_fields,
		Record#feGaussianBlur.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feGaussianBlur.xmlbase},
	{<<"xml:lang">>, Record#feGaussianBlur.xmllang},
	{<<"xml:space">>, Record#feGaussianBlur.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feGaussianBlur.height},
	{<<"result">>, Record#feGaussianBlur.result},
	{<<"width">>, Record#feGaussianBlur.width},
	{<<"x">>, Record#feGaussianBlur.x},
	{<<"y">>, Record#feGaussianBlur.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feGaussianBlur.alignment_baseline},
	{<<"baseline-shift">>, Record#feGaussianBlur.baseline_shift},
	{<<"clip">>, Record#feGaussianBlur.clip},
	{<<"clip-path">>, Record#feGaussianBlur.clip_path},
	{<<"clip-rule">>, Record#feGaussianBlur.clip_rule},
	{<<"color">>, Record#feGaussianBlur.color},
	{<<"color-interpolation">>, Record#feGaussianBlur.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feGaussianBlur.color_interpolation_filters},
	{<<"color-profile">>, Record#feGaussianBlur.color_profile},
	{<<"color-rendering">>, Record#feGaussianBlur.color_rendering},
	{<<"cursor">>, Record#feGaussianBlur.cursor},
	{<<"direction">>, Record#feGaussianBlur.direction},
	{<<"display">>, Record#feGaussianBlur.display},
	{<<"dominant-baseline">>, Record#feGaussianBlur.dominant_baseline},
	{<<"enable-background">>, Record#feGaussianBlur.enable_background},
	{<<"fill">>, Record#feGaussianBlur.fill},
	{<<"fill-opacity">>, Record#feGaussianBlur.fill_opacity},
	{<<"fill-rule">>, Record#feGaussianBlur.fill_rule},
	{<<"filter">>, Record#feGaussianBlur.filter},
	{<<"flood-color">>, Record#feGaussianBlur.flood_color},
	{<<"flood-opacity">>, Record#feGaussianBlur.flood_opacity},
	{<<"font-family">>, Record#feGaussianBlur.font_family},
	{<<"font-size">>, Record#feGaussianBlur.font_size},
	{<<"font-size-adjust">>, Record#feGaussianBlur.font_size_adjust},
	{<<"font-stretch">>, Record#feGaussianBlur.font_stretch},
	{<<"font-style">>, Record#feGaussianBlur.font_style},
	{<<"font-variant">>, Record#feGaussianBlur.font_variant},
	{<<"font-weight">>, Record#feGaussianBlur.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feGaussianBlur.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feGaussianBlur.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feGaussianBlur.image_rendering},
	{<<"kerning">>, Record#feGaussianBlur.kerning},
	{<<"letter-spacing">>, Record#feGaussianBlur.letter_spacing},
	{<<"lighting-color">>, Record#feGaussianBlur.lighting_color},
	{<<"marker-end">>, Record#feGaussianBlur.marker_end},
	{<<"marker-mid">>, Record#feGaussianBlur.marker_mid},
	{<<"marker-start">>, Record#feGaussianBlur.marker_start},
	{<<"mask">>, Record#feGaussianBlur.mask},
	{<<"opacity">>, Record#feGaussianBlur.opacity},
	{<<"overflow">>, Record#feGaussianBlur.overflow},
	{<<"pointer-events">>, Record#feGaussianBlur.pointer_events},
	{<<"shape-rendering">>, Record#feGaussianBlur.shape_rendering},
	{<<"stop-color">>, Record#feGaussianBlur.stop_color},
	{<<"stop-opacity">>, Record#feGaussianBlur.stop_opacity},
	{<<"stroke">>, Record#feGaussianBlur.stroke},
	{<<"stroke-dasharray">>, Record#feGaussianBlur.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feGaussianBlur.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feGaussianBlur.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feGaussianBlur.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feGaussianBlur.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feGaussianBlur.stroke_opacity},
	{<<"stroke-width">>, Record#feGaussianBlur.stroke_width},
	{<<"text-anchor">>, Record#feGaussianBlur.text_anchor},
	{<<"text-decoration">>, Record#feGaussianBlur.text_decoration},
	{<<"text-rendering">>, Record#feGaussianBlur.text_rendering},
	{<<"unicode-bidi">>, Record#feGaussianBlur.unicode_bidi},
	{<<"visibility">>, Record#feGaussianBlur.visibility},
	{<<"word-spacing">>, Record#feGaussianBlur.word_spacing},
	{<<"writing-mode">>, Record#feGaussianBlur.writing_mode}
].