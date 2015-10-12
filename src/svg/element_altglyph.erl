-module(element_altglyph).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"altGlyph">>, nitro:render(Record#altGlyph.body),
	lists:append([
		[
			{<<"id">>, Record#altGlyph.id},
			{<<"class">>, Record#altGlyph.class},
			{<<"style">>, Record#altGlyph.style},
			{<<"x">>, Record#altGlyph.x},
			{<<"y">>, Record#altGlyph.y},
			{<<"dx">>, Record#altGlyph.dx},
			{<<"dy">>, Record#altGlyph.dy},
			{<<"rotate">>, Record#altGlyph.rotate},
			{<<"glyphRef">>, Record#altGlyph.glyphRef},
			{<<"format">>, Record#altGlyph.format},
			{<<"externalResourcesRequired">>, Record#altGlyph.externalResourcesRequired}
		],
		svg_conditional_processing(Record),
		svg_core(Record),
		svg_graphical_event(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#altGlyph.data_fields,
		Record#altGlyph.aria_states
	])).


%% Common SVG attributes
svg_conditional_processing(Record)-> [
	{<<"requiredExtensions">>, Record#altGlyph.requiredExtensions},
	{<<"requiredFeatures">>, Record#altGlyph.requiredFeatures},
	{<<"systemLanguage">>, Record#altGlyph.systemLanguage}
].

svg_core(Record)-> [
	{<<"xml:base">>, Record#altGlyph.xmlbase},
	{<<"xml:lang">>, Record#altGlyph.xmllang},
	{<<"xml:space">>, Record#altGlyph.xmlspace}
].

svg_graphical_event(Record)-> [
	{<<"onactivate">>, Record#altGlyph.onactivate},
	{<<"onclick">>, Record#altGlyph.onclick},
	{<<"onfocusin">>, Record#altGlyph.onfocusin},
	{<<"onfocusout">>, Record#altGlyph.onfocusout},
	{<<"onload">>, Record#altGlyph.onload_graphical},
	{<<"onmousedown">>, Record#altGlyph.onmousedown},
	{<<"onmousemove">>, Record#altGlyph.onmousemove},
	{<<"onmouseout">>, Record#altGlyph.onmouseout},
	{<<"onmouseover">>, Record#altGlyph.onmouseover},
	{<<"onmouseup">>, Record#altGlyph.onmouseup}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#altGlyph.alignment_baseline},
	{<<"baseline-shift">>, Record#altGlyph.baseline_shift},
	{<<"clip">>, Record#altGlyph.clip},
	{<<"clip-path">>, Record#altGlyph.clip_path},
	{<<"clip-rule">>, Record#altGlyph.clip_rule},
	{<<"color">>, Record#altGlyph.color},
	{<<"color-interpolation">>, Record#altGlyph.color_interpolation},
	{<<"color-interpolation-filters">>, Record#altGlyph.color_interpolation_filters},
	{<<"color-profile">>, Record#altGlyph.color_profile},
	{<<"color-rendering">>, Record#altGlyph.color_rendering},
	{<<"cursor">>, Record#altGlyph.cursor},
	{<<"direction">>, Record#altGlyph.direction},
	{<<"display">>, Record#altGlyph.display},
	{<<"dominant-baseline">>, Record#altGlyph.dominant_baseline},
	{<<"enable-background">>, Record#altGlyph.enable_background},
	{<<"fill">>, Record#altGlyph.fill},
	{<<"fill-opacity">>, Record#altGlyph.fill_opacity},
	{<<"fill-rule">>, Record#altGlyph.fill_rule},
	{<<"filter">>, Record#altGlyph.filter},
	{<<"flood-color">>, Record#altGlyph.flood_color},
	{<<"flood-opacity">>, Record#altGlyph.flood_opacity},
	{<<"font-family">>, Record#altGlyph.font_family},
	{<<"font-size">>, Record#altGlyph.font_size},
	{<<"font-size-adjust">>, Record#altGlyph.font_size_adjust},
	{<<"font-stretch">>, Record#altGlyph.font_stretch},
	{<<"font-style">>, Record#altGlyph.font_style},
	{<<"font-variant">>, Record#altGlyph.font_variant},
	{<<"font-weight">>, Record#altGlyph.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#altGlyph.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#altGlyph.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#altGlyph.image_rendering},
	{<<"kerning">>, Record#altGlyph.kerning},
	{<<"letter-spacing">>, Record#altGlyph.letter_spacing},
	{<<"lighting-color">>, Record#altGlyph.lighting_color},
	{<<"marker-end">>, Record#altGlyph.marker_end},
	{<<"marker-mid">>, Record#altGlyph.marker_mid},
	{<<"marker-start">>, Record#altGlyph.marker_start},
	{<<"mask">>, Record#altGlyph.mask},
	{<<"opacity">>, Record#altGlyph.opacity},
	{<<"overflow">>, Record#altGlyph.overflow},
	{<<"pointer-events">>, Record#altGlyph.pointer_events},
	{<<"shape-rendering">>, Record#altGlyph.shape_rendering},
	{<<"stop-color">>, Record#altGlyph.stop_color},
	{<<"stop-opacity">>, Record#altGlyph.stop_opacity},
	{<<"stroke">>, Record#altGlyph.stroke},
	{<<"stroke-dasharray">>, Record#altGlyph.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#altGlyph.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#altGlyph.stroke_linecap},
	{<<"stroke-linejoin">>, Record#altGlyph.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#altGlyph.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#altGlyph.stroke_opacity},
	{<<"stroke-width">>, Record#altGlyph.stroke_width},
	{<<"text-anchor">>, Record#altGlyph.text_anchor},
	{<<"text-decoration">>, Record#altGlyph.text_decoration},
	{<<"text-rendering">>, Record#altGlyph.text_rendering},
	{<<"unicode-bidi">>, Record#altGlyph.unicode_bidi},
	{<<"visibility">>, Record#altGlyph.visibility},
	{<<"word-spacing">>, Record#altGlyph.word_spacing},
	{<<"writing-mode">>, Record#altGlyph.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#altGlyph.xlinkhref},
	{<<"xlink:type">>, Record#altGlyph.xlinktype},
	{<<"xlink:role">>, Record#altGlyph.xlinkrole},
	{<<"xlink:arcrole">>, Record#altGlyph.xlinkarcrole},
	{<<"xlink:title">>, Record#altGlyph.xlinktitle},
	{<<"xlink:show">>, Record#altGlyph.xlinkshow},
	{<<"xlink:actuate">>, Record#altGlyph.xlinkactuate}
].