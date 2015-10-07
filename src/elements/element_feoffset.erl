-module(element_feoffset).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feOffset">>, nitro:render(Record#feOffset.body),
	lists:append([
		[
			{<<"id">>, Record#feOffset.id},
			{<<"class">>, Record#feOffset.class},
			{<<"style">>, Record#feOffset.style},
			{<<"in">>, Record#feOffset.in},
			{<<"dx">>, Record#feOffset.dx},
			{<<"dy">>, Record#feOffset.dy}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feOffset.data_fields,
		Record#feOffset.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feOffset.xmlbase},
	{<<"xml:lang">>, Record#feOffset.xmllang},
	{<<"xml:space">>, Record#feOffset.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feOffset.height},
	{<<"result">>, Record#feOffset.result},
	{<<"width">>, Record#feOffset.width},
	{<<"x">>, Record#feOffset.x},
	{<<"y">>, Record#feOffset.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feOffset.alignment_baseline},
	{<<"baseline-shift">>, Record#feOffset.baseline_shift},
	{<<"clip">>, Record#feOffset.clip},
	{<<"clip-path">>, Record#feOffset.clip_path},
	{<<"clip-rule">>, Record#feOffset.clip_rule},
	{<<"color">>, Record#feOffset.color},
	{<<"color-interpolation">>, Record#feOffset.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feOffset.color_interpolation_filters},
	{<<"color-profile">>, Record#feOffset.color_profile},
	{<<"color-rendering">>, Record#feOffset.color_rendering},
	{<<"cursor">>, Record#feOffset.cursor},
	{<<"direction">>, Record#feOffset.direction},
	{<<"display">>, Record#feOffset.display},
	{<<"dominant-baseline">>, Record#feOffset.dominant_baseline},
	{<<"enable-background">>, Record#feOffset.enable_background},
	{<<"fill">>, Record#feOffset.fill},
	{<<"fill-opacity">>, Record#feOffset.fill_opacity},
	{<<"fill-rule">>, Record#feOffset.fill_rule},
	{<<"filter">>, Record#feOffset.filter},
	{<<"flood-color">>, Record#feOffset.flood_color},
	{<<"flood-opacity">>, Record#feOffset.flood_opacity},
	{<<"font-family">>, Record#feOffset.font_family},
	{<<"font-size">>, Record#feOffset.font_size},
	{<<"font-size-adjust">>, Record#feOffset.font_size_adjust},
	{<<"font-stretch">>, Record#feOffset.font_stretch},
	{<<"font-style">>, Record#feOffset.font_style},
	{<<"font-variant">>, Record#feOffset.font_variant},
	{<<"font-weight">>, Record#feOffset.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feOffset.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feOffset.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feOffset.image_rendering},
	{<<"kerning">>, Record#feOffset.kerning},
	{<<"letter-spacing">>, Record#feOffset.letter_spacing},
	{<<"lighting-color">>, Record#feOffset.lighting_color},
	{<<"marker-end">>, Record#feOffset.marker_end},
	{<<"marker-mid">>, Record#feOffset.marker_mid},
	{<<"marker-start">>, Record#feOffset.marker_start},
	{<<"mask">>, Record#feOffset.mask},
	{<<"opacity">>, Record#feOffset.opacity},
	{<<"overflow">>, Record#feOffset.overflow},
	{<<"pointer-events">>, Record#feOffset.pointer_events},
	{<<"shape-rendering">>, Record#feOffset.shape_rendering},
	{<<"stop-color">>, Record#feOffset.stop_color},
	{<<"stop-opacity">>, Record#feOffset.stop_opacity},
	{<<"stroke">>, Record#feOffset.stroke},
	{<<"stroke-dasharray">>, Record#feOffset.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feOffset.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feOffset.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feOffset.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feOffset.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feOffset.stroke_opacity},
	{<<"stroke-width">>, Record#feOffset.stroke_width},
	{<<"text-anchor">>, Record#feOffset.text_anchor},
	{<<"text-decoration">>, Record#feOffset.text_decoration},
	{<<"text-rendering">>, Record#feOffset.text_rendering},
	{<<"unicode-bidi">>, Record#feOffset.unicode_bidi},
	{<<"visibility">>, Record#feOffset.visibility},
	{<<"word-spacing">>, Record#feOffset.word_spacing},
	{<<"writing-mode">>, Record#feOffset.writing_mode}
].