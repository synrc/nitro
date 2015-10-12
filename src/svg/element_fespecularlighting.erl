-module(element_fespecularlighting).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"feSpecularLighting">>, nitro:render(Record#feSpecularLighting.body),
	lists:append([
		[
			{<<"id">>, Record#feSpecularLighting.id},
			{<<"class">>, Record#feSpecularLighting.class},
			{<<"style">>, Record#feSpecularLighting.style},
			{<<"in">>, Record#feSpecularLighting.in},
			{<<"surfaceScale">>, Record#feSpecularLighting.surfaceScale},
			{<<"specularConstant">>, Record#feSpecularLighting.specularConstant},
			{<<"specularExponent">>, Record#feSpecularLighting.specularExponent},
			{<<"kernelUnitLength">>, Record#feSpecularLighting.kernelUnitLength}
		],
		svg_core(Record),
		svg_filter_primitive(Record),
		svg_presentation(Record),
		Record#feSpecularLighting.data_fields,
		Record#feSpecularLighting.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#feSpecularLighting.xmlbase},
	{<<"xml:lang">>, Record#feSpecularLighting.xmllang},
	{<<"xml:space">>, Record#feSpecularLighting.xmlspace}
].

svg_filter_primitive(Record)-> [
	{<<"height">>, Record#feSpecularLighting.height},
	{<<"result">>, Record#feSpecularLighting.result},
	{<<"width">>, Record#feSpecularLighting.width},
	{<<"x">>, Record#feSpecularLighting.x},
	{<<"y">>, Record#feSpecularLighting.y}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#feSpecularLighting.alignment_baseline},
	{<<"baseline-shift">>, Record#feSpecularLighting.baseline_shift},
	{<<"clip">>, Record#feSpecularLighting.clip},
	{<<"clip-path">>, Record#feSpecularLighting.clip_path},
	{<<"clip-rule">>, Record#feSpecularLighting.clip_rule},
	{<<"color">>, Record#feSpecularLighting.color},
	{<<"color-interpolation">>, Record#feSpecularLighting.color_interpolation},
	{<<"color-interpolation-filters">>, Record#feSpecularLighting.color_interpolation_filters},
	{<<"color-profile">>, Record#feSpecularLighting.color_profile},
	{<<"color-rendering">>, Record#feSpecularLighting.color_rendering},
	{<<"cursor">>, Record#feSpecularLighting.cursor},
	{<<"direction">>, Record#feSpecularLighting.direction},
	{<<"display">>, Record#feSpecularLighting.display},
	{<<"dominant-baseline">>, Record#feSpecularLighting.dominant_baseline},
	{<<"enable-background">>, Record#feSpecularLighting.enable_background},
	{<<"fill">>, Record#feSpecularLighting.fill},
	{<<"fill-opacity">>, Record#feSpecularLighting.fill_opacity},
	{<<"fill-rule">>, Record#feSpecularLighting.fill_rule},
	{<<"filter">>, Record#feSpecularLighting.filter},
	{<<"flood-color">>, Record#feSpecularLighting.flood_color},
	{<<"flood-opacity">>, Record#feSpecularLighting.flood_opacity},
	{<<"font-family">>, Record#feSpecularLighting.font_family},
	{<<"font-size">>, Record#feSpecularLighting.font_size},
	{<<"font-size-adjust">>, Record#feSpecularLighting.font_size_adjust},
	{<<"font-stretch">>, Record#feSpecularLighting.font_stretch},
	{<<"font-style">>, Record#feSpecularLighting.font_style},
	{<<"font-variant">>, Record#feSpecularLighting.font_variant},
	{<<"font-weight">>, Record#feSpecularLighting.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#feSpecularLighting.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#feSpecularLighting.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#feSpecularLighting.image_rendering},
	{<<"kerning">>, Record#feSpecularLighting.kerning},
	{<<"letter-spacing">>, Record#feSpecularLighting.letter_spacing},
	{<<"lighting-color">>, Record#feSpecularLighting.lighting_color},
	{<<"marker-end">>, Record#feSpecularLighting.marker_end},
	{<<"marker-mid">>, Record#feSpecularLighting.marker_mid},
	{<<"marker-start">>, Record#feSpecularLighting.marker_start},
	{<<"mask">>, Record#feSpecularLighting.mask},
	{<<"opacity">>, Record#feSpecularLighting.opacity},
	{<<"overflow">>, Record#feSpecularLighting.overflow},
	{<<"pointer-events">>, Record#feSpecularLighting.pointer_events},
	{<<"shape-rendering">>, Record#feSpecularLighting.shape_rendering},
	{<<"stop-color">>, Record#feSpecularLighting.stop_color},
	{<<"stop-opacity">>, Record#feSpecularLighting.stop_opacity},
	{<<"stroke">>, Record#feSpecularLighting.stroke},
	{<<"stroke-dasharray">>, Record#feSpecularLighting.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#feSpecularLighting.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#feSpecularLighting.stroke_linecap},
	{<<"stroke-linejoin">>, Record#feSpecularLighting.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#feSpecularLighting.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#feSpecularLighting.stroke_opacity},
	{<<"stroke-width">>, Record#feSpecularLighting.stroke_width},
	{<<"text-anchor">>, Record#feSpecularLighting.text_anchor},
	{<<"text-decoration">>, Record#feSpecularLighting.text_decoration},
	{<<"text-rendering">>, Record#feSpecularLighting.text_rendering},
	{<<"unicode-bidi">>, Record#feSpecularLighting.unicode_bidi},
	{<<"visibility">>, Record#feSpecularLighting.visibility},
	{<<"word-spacing">>, Record#feSpecularLighting.word_spacing},
	{<<"writing-mode">>, Record#feSpecularLighting.writing_mode}
].