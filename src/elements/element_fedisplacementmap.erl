-module(element_fedisplacementmap).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feDisplacementMap">>, nitro:render(Record#feDisplacementMap.body),
	lists:append([
		[
			{<<"id">>, Record#feDisplacementMap.id},
			{<<"class">>, Record#feDisplacementMap.class},
			{<<"style">>, Record#feDisplacementMap.style},
			{<<"in">>, Record#feDisplacementMap.in},
			{<<"in2">>, Record#feDisplacementMap.in2},
			{<<"scale">>, Record#feDisplacementMap.scale},
			{<<"xChannelSelector">>, Record#feDisplacementMap.xChannelSelector},
			{<<"yChannelSelector">>, Record#feDisplacementMap.yChannelSelector}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feDisplacementMap.data_fields,
		Record#feDisplacementMap.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feDisplacementMap.xmlbase},
	{<<"xml:lang">>, Record#feDisplacementMap.xmllang},
	{<<"xml:space">>, Record#feDisplacementMap.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feDisplacementMap.height},
	{<<"result">>, Record#feDisplacementMap.result},
	{<<"width">>, Record#feDisplacementMap.width},
	{<<"x">>, Record#feDisplacementMap.x},
	{<<"y">>, Record#feDisplacementMap.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feDisplacementMap.alignment_baseline},
	{<<"baseline-shift">>, Record#feDisplacementMap.baseline_shift},
	{<<"clip">>, Record#feDisplacementMap.clip},
	{<<"clip-path">>, Record#feDisplacementMap.clip_path},
	{<<"clip-rule">>, Record#feDisplacementMap.clip_rule},
	{<<"color">>, Record#feDisplacementMap.color},
	{<<"color-interpolation">>, Record#feDisplacementMap.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feDisplacementMap.color_interpolation_filters},
	{<<"color-profile">>, Record#feDisplacementMap.color_profile},
	{<<"color-rendering">>, Record#feDisplacementMap.color_rendering},
	{<<"cursor">>, Record#feDisplacementMap.cursor},
	{<<"direction">>, Record#feDisplacementMap.direction},
	{<<"display">>, Record#feDisplacementMap.display},
	{<<"dominant-baseline">>, Record#feDisplacementMap.dominant_baseline},
	{<<"enable-background">>, Record#feDisplacementMap.enable_background},
	{<<"fill">>, Record#feDisplacementMap.fill},
	{<<"fill-opacity">>, Record#feDisplacementMap.fill_opacity},
	{<<"fill-rule">>, Record#feDisplacementMap.fill_rule},
	{<<"filter">>, Record#feDisplacementMap.filter},
	{<<"flood-color">>, Record#feDisplacementMap.flood_color},
	{<<"flood-opacity">>, Record#feDisplacementMap.flood_opacity},
	{<<"font-family">>, Record#feDisplacementMap.font_family},
	{<<"font-size">>, Record#feDisplacementMap.font_size},
	{<<"font-size-adjust">>, Record#feDisplacementMap.font_size_adjust},
	{<<"font-stretch">>, Record#feDisplacementMap.font_stretch},
	{<<"font-style">>, Record#feDisplacementMap.font_style},
	{<<"font-variant">>, Record#feDisplacementMap.font_variant},
	{<<"font-weight">>, Record#feDisplacementMap.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feDisplacementMap.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feDisplacementMap.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feDisplacementMap.image_rendering},
	{<<"kerning">>, Record#feDisplacementMap.kerning},
	{<<"letter-spacing">>, Record#feDisplacementMap.letter_spacing},
	{<<"lighting-color">>, Record#feDisplacementMap.lighting_color},
	{<<"marker-end">>, Record#feDisplacementMap.marker_end},
	{<<"marker-mid">>, Record#feDisplacementMap.marker_mid},
	{<<"marker-start">>, Record#feDisplacementMap.marker_start},
	{<<"mask">>, Record#feDisplacementMap.mask},
	{<<"opacity">>, Record#feDisplacementMap.opacity},
	{<<"overflow">>, Record#feDisplacementMap.overflow},
	{<<"pointer-events">>, Record#feDisplacementMap.pointer_events},
	{<<"shape-rendering">>, Record#feDisplacementMap.shape_rendering},
	{<<"stop-color">>, Record#feDisplacementMap.stop_color},
	{<<"stop-opacity">>, Record#feDisplacementMap.stop_opacity},
	{<<"stroke">>, Record#feDisplacementMap.stroke},
	{<<"stroke-dasharray">>, Record#feDisplacementMap.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feDisplacementMap.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feDisplacementMap.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feDisplacementMap.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feDisplacementMap.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feDisplacementMap.stroke_opacity},
	{<<"stroke-width">>, Record#feDisplacementMap.stroke_width},
	{<<"text-anchor">>, Record#feDisplacementMap.text_anchor},
	{<<"text-decoration">>, Record#feDisplacementMap.text_decoration},
	{<<"text-rendering">>, Record#feDisplacementMap.text_rendering},
	{<<"unicode-bidi">>, Record#feDisplacementMap.unicode_bidi},
	{<<"visibility">>, Record#feDisplacementMap.visibility},
	{<<"word-spacing">>, Record#feDisplacementMap.word_spacing},
	{<<"writing-mode">>, Record#feDisplacementMap.writing_mode}
].