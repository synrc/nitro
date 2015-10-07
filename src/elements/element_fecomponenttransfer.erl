-module(element_fecomponenttransfer).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feComponentTransfer">>, nitro:render(Record#feComponentTransfer.body),
	lists:append([
		[
			{<<"id">>, Record#feComponentTransfer.id},
			{<<"class">>, Record#feComponentTransfer.class},
			{<<"style">>, Record#feComponentTransfer.style},
			{<<"in">>, Record#feComponentTransfer.in}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feComponentTransfer.data_fields,
		Record#feComponentTransfer.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feComponentTransfer.xmlbase},
	{<<"xml:lang">>, Record#feComponentTransfer.xmllang},
	{<<"xml:space">>, Record#feComponentTransfer.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feComponentTransfer.height},
	{<<"result">>, Record#feComponentTransfer.result},
	{<<"width">>, Record#feComponentTransfer.width},
	{<<"x">>, Record#feComponentTransfer.x},
	{<<"y">>, Record#feComponentTransfer.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feComponentTransfer.alignment_baseline},
	{<<"baseline-shift">>, Record#feComponentTransfer.baseline_shift},
	{<<"clip">>, Record#feComponentTransfer.clip},
	{<<"clip-path">>, Record#feComponentTransfer.clip_path},
	{<<"clip-rule">>, Record#feComponentTransfer.clip_rule},
	{<<"color">>, Record#feComponentTransfer.color},
	{<<"color-interpolation">>, Record#feComponentTransfer.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feComponentTransfer.color_interpolation_filters},
	{<<"color-profile">>, Record#feComponentTransfer.color_profile},
	{<<"color-rendering">>, Record#feComponentTransfer.color_rendering},
	{<<"cursor">>, Record#feComponentTransfer.cursor},
	{<<"direction">>, Record#feComponentTransfer.direction},
	{<<"display">>, Record#feComponentTransfer.display},
	{<<"dominant-baseline">>, Record#feComponentTransfer.dominant_baseline},
	{<<"enable-background">>, Record#feComponentTransfer.enable_background},
	{<<"fill">>, Record#feComponentTransfer.fill},
	{<<"fill-opacity">>, Record#feComponentTransfer.fill_opacity},
	{<<"fill-rule">>, Record#feComponentTransfer.fill_rule},
	{<<"filter">>, Record#feComponentTransfer.filter},
	{<<"flood-color">>, Record#feComponentTransfer.flood_color},
	{<<"flood-opacity">>, Record#feComponentTransfer.flood_opacity},
	{<<"font-family">>, Record#feComponentTransfer.font_family},
	{<<"font-size">>, Record#feComponentTransfer.font_size},
	{<<"font-size-adjust">>, Record#feComponentTransfer.font_size_adjust},
	{<<"font-stretch">>, Record#feComponentTransfer.font_stretch},
	{<<"font-style">>, Record#feComponentTransfer.font_style},
	{<<"font-variant">>, Record#feComponentTransfer.font_variant},
	{<<"font-weight">>, Record#feComponentTransfer.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feComponentTransfer.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feComponentTransfer.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feComponentTransfer.image_rendering},
	{<<"kerning">>, Record#feComponentTransfer.kerning},
	{<<"letter-spacing">>, Record#feComponentTransfer.letter_spacing},
	{<<"lighting-color">>, Record#feComponentTransfer.lighting_color},
	{<<"marker-end">>, Record#feComponentTransfer.marker_end},
	{<<"marker-mid">>, Record#feComponentTransfer.marker_mid},
	{<<"marker-start">>, Record#feComponentTransfer.marker_start},
	{<<"mask">>, Record#feComponentTransfer.mask},
	{<<"opacity">>, Record#feComponentTransfer.opacity},
	{<<"overflow">>, Record#feComponentTransfer.overflow},
	{<<"pointer-events">>, Record#feComponentTransfer.pointer_events},
	{<<"shape-rendering">>, Record#feComponentTransfer.shape_rendering},
	{<<"stop-color">>, Record#feComponentTransfer.stop_color},
	{<<"stop-opacity">>, Record#feComponentTransfer.stop_opacity},
	{<<"stroke">>, Record#feComponentTransfer.stroke},
	{<<"stroke-dasharray">>, Record#feComponentTransfer.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feComponentTransfer.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feComponentTransfer.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feComponentTransfer.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feComponentTransfer.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feComponentTransfer.stroke_opacity},
	{<<"stroke-width">>, Record#feComponentTransfer.stroke_width},
	{<<"text-anchor">>, Record#feComponentTransfer.text_anchor},
	{<<"text-decoration">>, Record#feComponentTransfer.text_decoration},
	{<<"text-rendering">>, Record#feComponentTransfer.text_rendering},
	{<<"unicode-bidi">>, Record#feComponentTransfer.unicode_bidi},
	{<<"visibility">>, Record#feComponentTransfer.visibility},
	{<<"word-spacing">>, Record#feComponentTransfer.word_spacing},
	{<<"writing-mode">>, Record#feComponentTransfer.writing_mode}
].