-module(element_symbol).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"symbol">>, nitro:render(Record#symbol.body),
	lists:append([
		[
			{<<"id">>, Record#symbol.id},
			{<<"class">>, Record#symbol.class},
			{<<"style">>, Record#symbol.style},
			{<<"preserveAspectRatio">>, Record#symbol.preserveAspectRatio},
			{<<"viewBox">>, Record#symbol.viewBox},
			{<<"externalResourcesRequired">>, Record#symbol.externalResourcesRequired}
		],
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		Record#symbol.data_fields,
		Record#symbol.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#symbol.xmlbase},
	{<<"xml:lang">>, Record#symbol.xmllang},
	{<<"xml:space">>, Record#symbol.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#symbol.onactivate},
	{<<"onclick">>, Record#symbol.onclick},
	{<<"onfocusin">>, Record#symbol.onfocusin},
	{<<"onfocusout">>, Record#symbol.onfocusout},
	{<<"onload">>, Record#symbol.onload_graphical},
	{<<"onmousedown">>, Record#symbol.onmousedown},
	{<<"onmousemove">>, Record#symbol.onmousemove},
	{<<"onmouseout">>, Record#symbol.onmouseout},
	{<<"onmouseover">>, Record#symbol.onmouseover},
	{<<"onmouseup">>, Record#symbol.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#symbol.alignment_baseline},
	{<<"baseline-shift">>, Record#symbol.baseline_shift},
	{<<"clip">>, Record#symbol.clip},
	{<<"clip-path">>, Record#symbol.clip_path},
	{<<"clip-rule">>, Record#symbol.clip_rule},
	{<<"color">>, Record#symbol.color},
	{<<"color-interpolation">>, Record#symbol.color_interpolation},
	{<<"color-interpolation-filters">>, Record#symbol.color_interpolation_filters},
	{<<"color-profile">>, Record#symbol.color_profile},
	{<<"color-rendering">>, Record#symbol.color_rendering},
	{<<"cursor">>, Record#symbol.cursor},
	{<<"direction">>, Record#symbol.direction},
	{<<"display">>, Record#symbol.display},
	{<<"dominant-baseline">>, Record#symbol.dominant_baseline},
	{<<"enable-background">>, Record#symbol.enable_background},
	{<<"fill">>, Record#symbol.fill},
	{<<"fill-opacity">>, Record#symbol.fill_opacity},
	{<<"fill-rule">>, Record#symbol.fill_rule},
	{<<"filter">>, Record#symbol.filter},
	{<<"flood-color">>, Record#symbol.flood_color},
	{<<"flood-opacity">>, Record#symbol.flood_opacity},
	{<<"font-family">>, Record#symbol.font_family},
	{<<"font-size">>, Record#symbol.font_size},
	{<<"font-size-adjust">>, Record#symbol.font_size_adjust},
	{<<"font-stretch">>, Record#symbol.font_stretch},
	{<<"font-style">>, Record#symbol.font_style},
	{<<"font-variant">>, Record#symbol.font_variant},
	{<<"font-weight">>, Record#symbol.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#symbol.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#symbol.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#symbol.image_rendering},
	{<<"kerning">>, Record#symbol.kerning},
	{<<"letter-spacing">>, Record#symbol.letter_spacing},
	{<<"lighting-color">>, Record#symbol.lighting_color},
	{<<"marker-end">>, Record#symbol.marker_end},
	{<<"marker-mid">>, Record#symbol.marker_mid},
	{<<"marker-start">>, Record#symbol.marker_start},
	{<<"mask">>, Record#symbol.mask},
	{<<"opacity">>, Record#symbol.opacity},
	{<<"overflow">>, Record#symbol.overflow},
	{<<"pointer-events">>, Record#symbol.pointer_events},
	{<<"shape-rendering">>, Record#symbol.shape_rendering},
	{<<"stop-color">>, Record#symbol.stop_color},
	{<<"stop-opacity">>, Record#symbol.stop_opacity},
	{<<"stroke">>, Record#symbol.stroke},
	{<<"stroke-dasharray">>, Record#symbol.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#symbol.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#symbol.stroke_linecap},
	{<<"stroke-linejoin">>, Record#symbol.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#symbol.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#symbol.stroke_opacity},
	{<<"stroke-width">>, Record#symbol.stroke_width},
	{<<"text-anchor">>, Record#symbol.text_anchor},
	{<<"text-decoration">>, Record#symbol.text_decoration},
	{<<"text-rendering">>, Record#symbol.text_rendering},
	{<<"unicode-bidi">>, Record#symbol.unicode_bidi},
	{<<"visibility">>, Record#symbol.visibility},
	{<<"word-spacing">>, Record#symbol.word_spacing},
	{<<"writing-mode">>, Record#symbol.writing_mode}
].