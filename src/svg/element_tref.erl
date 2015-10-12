-module(element_tref).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"tref">>, nitro:render(Record#tref.body),
	lists:append([
		[
			{<<"id">>, Record#tref.id},
			{<<"class">>, Record#tref.class},
			{<<"style">>, Record#tref.style},
			{<<"externalResourcesRequired">>, Record#tref.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#tref.data_fields,
		Record#tref.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#tref.requiredExtensions},
	{<<"requiredFeatures">>, Record#tref.requiredFeatures},
	{<<"systemLanguage">>, Record#tref.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#tref.xmlbase},
	{<<"xml:lang">>, Record#tref.xmllang},
	{<<"xml:space">>, Record#tref.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#tref.onactivate},
	{<<"onclick">>, Record#tref.onclick},
	{<<"onfocusin">>, Record#tref.onfocusin},
	{<<"onfocusout">>, Record#tref.onfocusout},
	{<<"onload">>, Record#tref.onload_graphical},
	{<<"onmousedown">>, Record#tref.onmousedown},
	{<<"onmousemove">>, Record#tref.onmousemove},
	{<<"onmouseout">>, Record#tref.onmouseout},
	{<<"onmouseover">>, Record#tref.onmouseover},
	{<<"onmouseup">>, Record#tref.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#tref.alignment_baseline},
	{<<"baseline-shift">>, Record#tref.baseline_shift},
	{<<"clip">>, Record#tref.clip},
	{<<"clip-path">>, Record#tref.clip_path},
	{<<"clip-rule">>, Record#tref.clip_rule},
	{<<"color">>, Record#tref.color},
	{<<"color-interpolation">>, Record#tref.color_interpolation},
	{<<"color-interpolation-filters">>, Record#tref.color_interpolation_filters},
	{<<"color-profile">>, Record#tref.color_profile},
	{<<"color-rendering">>, Record#tref.color_rendering},
	{<<"cursor">>, Record#tref.cursor},
	{<<"direction">>, Record#tref.direction},
	{<<"display">>, Record#tref.display},
	{<<"dominant-baseline">>, Record#tref.dominant_baseline},
	{<<"enable-background">>, Record#tref.enable_background},
	{<<"fill">>, Record#tref.fill},
	{<<"fill-opacity">>, Record#tref.fill_opacity},
	{<<"fill-rule">>, Record#tref.fill_rule},
	{<<"filter">>, Record#tref.filter},
	{<<"flood-color">>, Record#tref.flood_color},
	{<<"flood-opacity">>, Record#tref.flood_opacity},
	{<<"font-family">>, Record#tref.font_family},
	{<<"font-size">>, Record#tref.font_size},
	{<<"font-size-adjust">>, Record#tref.font_size_adjust},
	{<<"font-stretch">>, Record#tref.font_stretch},
	{<<"font-style">>, Record#tref.font_style},
	{<<"font-variant">>, Record#tref.font_variant},
	{<<"font-weight">>, Record#tref.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#tref.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#tref.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#tref.image_rendering},
	{<<"kerning">>, Record#tref.kerning},
	{<<"letter-spacing">>, Record#tref.letter_spacing},
	{<<"lighting-color">>, Record#tref.lighting_color},
	{<<"marker-end">>, Record#tref.marker_end},
	{<<"marker-mid">>, Record#tref.marker_mid},
	{<<"marker-start">>, Record#tref.marker_start},
	{<<"mask">>, Record#tref.mask},
	{<<"opacity">>, Record#tref.opacity},
	{<<"overflow">>, Record#tref.overflow},
	{<<"pointer-events">>, Record#tref.pointer_events},
	{<<"shape-rendering">>, Record#tref.shape_rendering},
	{<<"stop-color">>, Record#tref.stop_color},
	{<<"stop-opacity">>, Record#tref.stop_opacity},
	{<<"stroke">>, Record#tref.stroke},
	{<<"stroke-dasharray">>, Record#tref.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#tref.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#tref.stroke_linecap},
	{<<"stroke-linejoin">>, Record#tref.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#tref.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#tref.stroke_opacity},
	{<<"stroke-width">>, Record#tref.stroke_width},
	{<<"text-anchor">>, Record#tref.text_anchor},
	{<<"text-decoration">>, Record#tref.text_decoration},
	{<<"text-rendering">>, Record#tref.text_rendering},
	{<<"unicode-bidi">>, Record#tref.unicode_bidi},
	{<<"visibility">>, Record#tref.visibility},
	{<<"word-spacing">>, Record#tref.word_spacing},
	{<<"writing-mode">>, Record#tref.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#tref.xlinkhref},
	{<<"xlink:type">>, Record#tref.xlinktype},
	{<<"xlink:role">>, Record#tref.xlinkrole},
	{<<"xlink:arcrole">>, Record#tref.xlinkarcrole},
	{<<"xlink:title">>, Record#tref.xlinktitle},
	{<<"xlink:show">>, Record#tref.xlinkshow},
	{<<"xlink:actuate">>, Record#tref.xlinkactuate}
].