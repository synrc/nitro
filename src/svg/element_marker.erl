-module(element_marker).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"marker">>, nitro:render(Record#marker.body),
	lists:append([
		[
			{<<"id">>, Record#marker.id},
			{<<"class">>, Record#marker.class},
			{<<"style">>, Record#marker.style},
			{<<"markerUnits">>, Record#marker.markerUnits},
			{<<"refX">>, Record#marker.refX},
			{<<"refY">>, Record#marker.refY},
			{<<"markerWidth">>, Record#marker.markerWidth},
			{<<"markerHeight">>, Record#marker.markerHeight},
			{<<"orient">>, Record#marker.orient},
			{<<"viewBox">>, Record#marker.viewBox},
			{<<"preserveAspectRatio">>, Record#marker.preserveAspectRatio},
			{<<"transform">>, Record#marker.transform},
			{<<"externalResourcesRequired">>, Record#marker.externalResourcesRequired}
		],
		svg_core(Record),
		svg_presentation(Record),
		Record#marker.data_fields,
		Record#marker.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#marker.xmlbase},
	{<<"xml:lang">>, Record#marker.xmllang},
	{<<"xml:space">>, Record#marker.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#marker.alignment_baseline},
	{<<"baseline-shift">>, Record#marker.baseline_shift},
	{<<"clip">>, Record#marker.clip},
	{<<"clip-path">>, Record#marker.clip_path},
	{<<"clip-rule">>, Record#marker.clip_rule},
	{<<"color">>, Record#marker.color},
	{<<"color-interpolation">>, Record#marker.color_interpolation},
	{<<"color-interpolation-filters">>, Record#marker.color_interpolation_filters},
	{<<"color-profile">>, Record#marker.color_profile},
	{<<"color-rendering">>, Record#marker.color_rendering},
	{<<"cursor">>, Record#marker.cursor},
	{<<"direction">>, Record#marker.direction},
	{<<"display">>, Record#marker.display},
	{<<"dominant-baseline">>, Record#marker.dominant_baseline},
	{<<"enable-background">>, Record#marker.enable_background},
	{<<"fill">>, Record#marker.fill},
	{<<"fill-opacity">>, Record#marker.fill_opacity},
	{<<"fill-rule">>, Record#marker.fill_rule},
	{<<"filter">>, Record#marker.filter},
	{<<"flood-color">>, Record#marker.flood_color},
	{<<"flood-opacity">>, Record#marker.flood_opacity},
	{<<"font-family">>, Record#marker.font_family},
	{<<"font-size">>, Record#marker.font_size},
	{<<"font-size-adjust">>, Record#marker.font_size_adjust},
	{<<"font-stretch">>, Record#marker.font_stretch},
	{<<"font-style">>, Record#marker.font_style},
	{<<"font-variant">>, Record#marker.font_variant},
	{<<"font-weight">>, Record#marker.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#marker.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#marker.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#marker.image_rendering},
	{<<"kerning">>, Record#marker.kerning},
	{<<"letter-spacing">>, Record#marker.letter_spacing},
	{<<"lighting-color">>, Record#marker.lighting_color},
	{<<"marker-end">>, Record#marker.marker_end},
	{<<"marker-mid">>, Record#marker.marker_mid},
	{<<"marker-start">>, Record#marker.marker_start},
	{<<"mask">>, Record#marker.mask},
	{<<"opacity">>, Record#marker.opacity},
	{<<"overflow">>, Record#marker.overflow},
	{<<"pointer-events">>, Record#marker.pointer_events},
	{<<"shape-rendering">>, Record#marker.shape_rendering},
	{<<"stop-color">>, Record#marker.stop_color},
	{<<"stop-opacity">>, Record#marker.stop_opacity},
	{<<"stroke">>, Record#marker.stroke},
	{<<"stroke-dasharray">>, Record#marker.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#marker.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#marker.stroke_linecap},
	{<<"stroke-linejoin">>, Record#marker.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#marker.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#marker.stroke_opacity},
	{<<"stroke-width">>, Record#marker.stroke_width},
	{<<"text-anchor">>, Record#marker.text_anchor},
	{<<"text-decoration">>, Record#marker.text_decoration},
	{<<"text-rendering">>, Record#marker.text_rendering},
	{<<"unicode-bidi">>, Record#marker.unicode_bidi},
	{<<"visibility">>, Record#marker.visibility},
	{<<"word-spacing">>, Record#marker.word_spacing},
	{<<"writing-mode">>, Record#marker.writing_mode}
].