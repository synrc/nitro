-module(element_stop).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"stop">>, nitro:render(Record#stop.body),
	lists:append([
		[
			{<<"id">>, Record#stop.id},
			{<<"class">>, Record#stop.class},
			{<<"style">>, Record#stop.style},
			{<<"offset">>, Record#stop.offset}
		],
		svg_core(Record),
		svg_presentation(Record),
		Record#stop.data_fields,
		Record#stop.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#stop.xmlbase},
	{<<"xml:lang">>, Record#stop.xmllang},
	{<<"xml:space">>, Record#stop.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#stop.alignment_baseline},
	{<<"baseline-shift">>, Record#stop.baseline_shift},
	{<<"clip">>, Record#stop.clip},
	{<<"clip-path">>, Record#stop.clip_path},
	{<<"clip-rule">>, Record#stop.clip_rule},
	{<<"color">>, Record#stop.color},
	{<<"color-interpolation">>, Record#stop.color_interpolation},
	{<<"color-interpolation-filters">>, Record#stop.color_interpolation_filters},
	{<<"color-profile">>, Record#stop.color_profile},
	{<<"color-rendering">>, Record#stop.color_rendering},
	{<<"cursor">>, Record#stop.cursor},
	{<<"direction">>, Record#stop.direction},
	{<<"display">>, Record#stop.display},
	{<<"dominant-baseline">>, Record#stop.dominant_baseline},
	{<<"enable-background">>, Record#stop.enable_background},
	{<<"fill">>, Record#stop.fill},
	{<<"fill-opacity">>, Record#stop.fill_opacity},
	{<<"fill-rule">>, Record#stop.fill_rule},
	{<<"filter">>, Record#stop.filter},
	{<<"flood-color">>, Record#stop.flood_color},
	{<<"flood-opacity">>, Record#stop.flood_opacity},
	{<<"font-family">>, Record#stop.font_family},
	{<<"font-size">>, Record#stop.font_size},
	{<<"font-size-adjust">>, Record#stop.font_size_adjust},
	{<<"font-stretch">>, Record#stop.font_stretch},
	{<<"font-style">>, Record#stop.font_style},
	{<<"font-variant">>, Record#stop.font_variant},
	{<<"font-weight">>, Record#stop.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#stop.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#stop.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#stop.image_rendering},
	{<<"kerning">>, Record#stop.kerning},
	{<<"letter-spacing">>, Record#stop.letter_spacing},
	{<<"lighting-color">>, Record#stop.lighting_color},
	{<<"marker-end">>, Record#stop.marker_end},
	{<<"marker-mid">>, Record#stop.marker_mid},
	{<<"marker-start">>, Record#stop.marker_start},
	{<<"mask">>, Record#stop.mask},
	{<<"opacity">>, Record#stop.opacity},
	{<<"overflow">>, Record#stop.overflow},
	{<<"pointer-events">>, Record#stop.pointer_events},
	{<<"shape-rendering">>, Record#stop.shape_rendering},
	{<<"stop-color">>, Record#stop.stop_color},
	{<<"stop-opacity">>, Record#stop.stop_opacity},
	{<<"stroke">>, Record#stop.stroke},
	{<<"stroke-dasharray">>, Record#stop.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#stop.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#stop.stroke_linecap},
	{<<"stroke-linejoin">>, Record#stop.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#stop.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#stop.stroke_opacity},
	{<<"stroke-width">>, Record#stop.stroke_width},
	{<<"text-anchor">>, Record#stop.text_anchor},
	{<<"text-decoration">>, Record#stop.text_decoration},
	{<<"text-rendering">>, Record#stop.text_rendering},
	{<<"unicode-bidi">>, Record#stop.unicode_bidi},
	{<<"visibility">>, Record#stop.visibility},
	{<<"word-spacing">>, Record#stop.word_spacing},
	{<<"writing-mode">>, Record#stop.writing_mode}
].