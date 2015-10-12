-module(element_fetile).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feTile">>, nitro:render(Record#feTile.body),
	lists:append([
		[
			{<<"id">>, Record#feTile.id},
			{<<"class">>, Record#feTile.class},
			{<<"style">>, Record#feTile.style},
			{<<"in">>, Record#feTile.in}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feTile.data_fields,
		Record#feTile.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feTile.xmlbase},
	{<<"xml:lang">>, Record#feTile.xmllang},
	{<<"xml:space">>, Record#feTile.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feTile.height},
	{<<"result">>, Record#feTile.result},
	{<<"width">>, Record#feTile.width},
	{<<"x">>, Record#feTile.x},
	{<<"y">>, Record#feTile.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feTile.alignment_baseline},
	{<<"baseline-shift">>, Record#feTile.baseline_shift},
	{<<"clip">>, Record#feTile.clip},
	{<<"clip-path">>, Record#feTile.clip_path},
	{<<"clip-rule">>, Record#feTile.clip_rule},
	{<<"color">>, Record#feTile.color},
	{<<"color-interpolation">>, Record#feTile.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feTile.color_interpolation_filters},
	{<<"color-profile">>, Record#feTile.color_profile},
	{<<"color-rendering">>, Record#feTile.color_rendering},
	{<<"cursor">>, Record#feTile.cursor},
	{<<"direction">>, Record#feTile.direction},
	{<<"display">>, Record#feTile.display},
	{<<"dominant-baseline">>, Record#feTile.dominant_baseline},
	{<<"enable-background">>, Record#feTile.enable_background},
	{<<"fill">>, Record#feTile.fill},
	{<<"fill-opacity">>, Record#feTile.fill_opacity},
	{<<"fill-rule">>, Record#feTile.fill_rule},
	{<<"filter">>, Record#feTile.filter},
	{<<"flood-color">>, Record#feTile.flood_color},
	{<<"flood-opacity">>, Record#feTile.flood_opacity},
	{<<"font-family">>, Record#feTile.font_family},
	{<<"font-size">>, Record#feTile.font_size},
	{<<"font-size-adjust">>, Record#feTile.font_size_adjust},
	{<<"font-stretch">>, Record#feTile.font_stretch},
	{<<"font-style">>, Record#feTile.font_style},
	{<<"font-variant">>, Record#feTile.font_variant},
	{<<"font-weight">>, Record#feTile.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feTile.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feTile.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feTile.image_rendering},
	{<<"kerning">>, Record#feTile.kerning},
	{<<"letter-spacing">>, Record#feTile.letter_spacing},
	{<<"lighting-color">>, Record#feTile.lighting_color},
	{<<"marker-end">>, Record#feTile.marker_end},
	{<<"marker-mid">>, Record#feTile.marker_mid},
	{<<"marker-start">>, Record#feTile.marker_start},
	{<<"mask">>, Record#feTile.mask},
	{<<"opacity">>, Record#feTile.opacity},
	{<<"overflow">>, Record#feTile.overflow},
	{<<"pointer-events">>, Record#feTile.pointer_events},
	{<<"shape-rendering">>, Record#feTile.shape_rendering},
	{<<"stop-color">>, Record#feTile.stop_color},
	{<<"stop-opacity">>, Record#feTile.stop_opacity},
	{<<"stroke">>, Record#feTile.stroke},
	{<<"stroke-dasharray">>, Record#feTile.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feTile.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feTile.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feTile.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feTile.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feTile.stroke_opacity},
	{<<"stroke-width">>, Record#feTile.stroke_width},
	{<<"text-anchor">>, Record#feTile.text_anchor},
	{<<"text-decoration">>, Record#feTile.text_decoration},
	{<<"text-rendering">>, Record#feTile.text_rendering},
	{<<"unicode-bidi">>, Record#feTile.unicode_bidi},
	{<<"visibility">>, Record#feTile.visibility},
	{<<"word-spacing">>, Record#feTile.word_spacing},
	{<<"writing-mode">>, Record#feTile.writing_mode}
].