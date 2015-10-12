-module(element_feflood).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feFlood">>, nitro:render(Record#feFlood.body),
	lists:append([
		[
			{<<"id">>, Record#feFlood.id},
			{<<"class">>, Record#feFlood.class},
			{<<"style">>, Record#feFlood.style}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feFlood.data_fields,
		Record#feFlood.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feFlood.xmlbase},
	{<<"xml:lang">>, Record#feFlood.xmllang},
	{<<"xml:space">>, Record#feFlood.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feFlood.height},
	{<<"result">>, Record#feFlood.result},
	{<<"width">>, Record#feFlood.width},
	{<<"x">>, Record#feFlood.x},
	{<<"y">>, Record#feFlood.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feFlood.alignment_baseline},
	{<<"baseline-shift">>, Record#feFlood.baseline_shift},
	{<<"clip">>, Record#feFlood.clip},
	{<<"clip-path">>, Record#feFlood.clip_path},
	{<<"clip-rule">>, Record#feFlood.clip_rule},
	{<<"color">>, Record#feFlood.color},
	{<<"color-interpolation">>, Record#feFlood.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feFlood.color_interpolation_filters},
	{<<"color-profile">>, Record#feFlood.color_profile},
	{<<"color-rendering">>, Record#feFlood.color_rendering},
	{<<"cursor">>, Record#feFlood.cursor},
	{<<"direction">>, Record#feFlood.direction},
	{<<"display">>, Record#feFlood.display},
	{<<"dominant-baseline">>, Record#feFlood.dominant_baseline},
	{<<"enable-background">>, Record#feFlood.enable_background},
	{<<"fill">>, Record#feFlood.fill},
	{<<"fill-opacity">>, Record#feFlood.fill_opacity},
	{<<"fill-rule">>, Record#feFlood.fill_rule},
	{<<"filter">>, Record#feFlood.filter},
	{<<"flood-color">>, Record#feFlood.flood_color},
	{<<"flood-opacity">>, Record#feFlood.flood_opacity},
	{<<"font-family">>, Record#feFlood.font_family},
	{<<"font-size">>, Record#feFlood.font_size},
	{<<"font-size-adjust">>, Record#feFlood.font_size_adjust},
	{<<"font-stretch">>, Record#feFlood.font_stretch},
	{<<"font-style">>, Record#feFlood.font_style},
	{<<"font-variant">>, Record#feFlood.font_variant},
	{<<"font-weight">>, Record#feFlood.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feFlood.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feFlood.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feFlood.image_rendering},
	{<<"kerning">>, Record#feFlood.kerning},
	{<<"letter-spacing">>, Record#feFlood.letter_spacing},
	{<<"lighting-color">>, Record#feFlood.lighting_color},
	{<<"marker-end">>, Record#feFlood.marker_end},
	{<<"marker-mid">>, Record#feFlood.marker_mid},
	{<<"marker-start">>, Record#feFlood.marker_start},
	{<<"mask">>, Record#feFlood.mask},
	{<<"opacity">>, Record#feFlood.opacity},
	{<<"overflow">>, Record#feFlood.overflow},
	{<<"pointer-events">>, Record#feFlood.pointer_events},
	{<<"shape-rendering">>, Record#feFlood.shape_rendering},
	{<<"stop-color">>, Record#feFlood.stop_color},
	{<<"stop-opacity">>, Record#feFlood.stop_opacity},
	{<<"stroke">>, Record#feFlood.stroke},
	{<<"stroke-dasharray">>, Record#feFlood.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feFlood.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feFlood.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feFlood.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feFlood.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feFlood.stroke_opacity},
	{<<"stroke-width">>, Record#feFlood.stroke_width},
	{<<"text-anchor">>, Record#feFlood.text_anchor},
	{<<"text-decoration">>, Record#feFlood.text_decoration},
	{<<"text-rendering">>, Record#feFlood.text_rendering},
	{<<"unicode-bidi">>, Record#feFlood.unicode_bidi},
	{<<"visibility">>, Record#feFlood.visibility},
	{<<"word-spacing">>, Record#feFlood.word_spacing},
	{<<"writing-mode">>, Record#feFlood.writing_mode}
].