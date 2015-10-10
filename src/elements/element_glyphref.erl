-module(element_glyphref).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"glyphRef">>, nitro:render(Record#glyphRef.body),
	lists:append([
		[
			{<<"id">>, Record#glyphRef.id},
			{<<"class">>, Record#glyphRef.class},
			{<<"style">>, Record#glyphRef.style},
			{<<"x">>, Record#glyphRef.x},
			{<<"y">>, Record#glyphRef.y},
			{<<"dx">>, Record#glyphRef.dx},
			{<<"dy">>, Record#glyphRef.dy},
			{<<"glyphRef">>, Record#glyphRef.glyphRef},
			{<<"format">>, Record#glyphRef.format}
		],
		svg_core(Record),
		svg_presentation(Record),
		svg_xlink(Record),
		Record#glyphRef.data_fields,
		Record#glyphRef.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#glyphRef.xmlbase},
	{<<"xml:lang">>, Record#glyphRef.xmllang},
	{<<"xml:space">>, Record#glyphRef.xmlspace}
].

svg_presentation(Record)-> [
	{<<"alignment-baseline">>, Record#glyphRef.alignment_baseline},
	{<<"baseline-shift">>, Record#glyphRef.baseline_shift},
	{<<"clip">>, Record#glyphRef.clip},
	{<<"clip-path">>, Record#glyphRef.clip_path},
	{<<"clip-rule">>, Record#glyphRef.clip_rule},
	{<<"color">>, Record#glyphRef.color},
	{<<"color-interpolation">>, Record#glyphRef.color_interpolation},
	{<<"color-interpolation-filters">>, Record#glyphRef.color_interpolation_filters},
	{<<"color-profile">>, Record#glyphRef.color_profile},
	{<<"color-rendering">>, Record#glyphRef.color_rendering},
	{<<"cursor">>, Record#glyphRef.cursor},
	{<<"direction">>, Record#glyphRef.direction},
	{<<"display">>, Record#glyphRef.display},
	{<<"dominant-baseline">>, Record#glyphRef.dominant_baseline},
	{<<"enable-background">>, Record#glyphRef.enable_background},
	{<<"fill">>, Record#glyphRef.fill},
	{<<"fill-opacity">>, Record#glyphRef.fill_opacity},
	{<<"fill-rule">>, Record#glyphRef.fill_rule},
	{<<"filter">>, Record#glyphRef.filter},
	{<<"flood-color">>, Record#glyphRef.flood_color},
	{<<"flood-opacity">>, Record#glyphRef.flood_opacity},
	{<<"font-family">>, Record#glyphRef.font_family},
	{<<"font-size">>, Record#glyphRef.font_size},
	{<<"font-size-adjust">>, Record#glyphRef.font_size_adjust},
	{<<"font-stretch">>, Record#glyphRef.font_stretch},
	{<<"font-style">>, Record#glyphRef.font_style},
	{<<"font-variant">>, Record#glyphRef.font_variant},
	{<<"font-weight">>, Record#glyphRef.font_weight},
	{<<"glyph-orientation-horizontal">>, Record#glyphRef.glyph_orientation_horizontal},
	{<<"glyph-orientation-vertical">>, Record#glyphRef.glyph_orientation_vertical},
	{<<"image-rendering">>, Record#glyphRef.image_rendering},
	{<<"kerning">>, Record#glyphRef.kerning},
	{<<"letter-spacing">>, Record#glyphRef.letter_spacing},
	{<<"lighting-color">>, Record#glyphRef.lighting_color},
	{<<"marker-end">>, Record#glyphRef.marker_end},
	{<<"marker-mid">>, Record#glyphRef.marker_mid},
	{<<"marker-start">>, Record#glyphRef.marker_start},
	{<<"mask">>, Record#glyphRef.mask},
	{<<"opacity">>, Record#glyphRef.opacity},
	{<<"overflow">>, Record#glyphRef.overflow},
	{<<"pointer-events">>, Record#glyphRef.pointer_events},
	{<<"shape-rendering">>, Record#glyphRef.shape_rendering},
	{<<"stop-color">>, Record#glyphRef.stop_color},
	{<<"stop-opacity">>, Record#glyphRef.stop_opacity},
	{<<"stroke">>, Record#glyphRef.stroke},
	{<<"stroke-dasharray">>, Record#glyphRef.stroke_dasharray},
	{<<"stroke-dashoffset">>, Record#glyphRef.stroke_dashoffset},
	{<<"stroke-linecap">>, Record#glyphRef.stroke_linecap},
	{<<"stroke-linejoin">>, Record#glyphRef.stroke_linejoin},
	{<<"stroke-miterlimit">>, Record#glyphRef.stroke_miterlimit},
	{<<"stroke-opacity">>, Record#glyphRef.stroke_opacity},
	{<<"stroke-width">>, Record#glyphRef.stroke_width},
	{<<"text-anchor">>, Record#glyphRef.text_anchor},
	{<<"text-decoration">>, Record#glyphRef.text_decoration},
	{<<"text-rendering">>, Record#glyphRef.text_rendering},
	{<<"unicode-bidi">>, Record#glyphRef.unicode_bidi},
	{<<"visibility">>, Record#glyphRef.visibility},
	{<<"word-spacing">>, Record#glyphRef.word_spacing},
	{<<"writing-mode">>, Record#glyphRef.writing_mode}
].

svg_xlink(Record)-> [
	{<<"xlink:href">>, Record#glyphRef.xlinkhref},
	{<<"xlink:type">>, Record#glyphRef.xlinktype},
	{<<"xlink:role">>, Record#glyphRef.xlinkrole},
	{<<"xlink:arcrole">>, Record#glyphRef.xlinkarcrole},
	{<<"xlink:title">>, Record#glyphRef.xlinktitle},
	{<<"xlink:show">>, Record#glyphRef.xlinkshow},
	{<<"xlink:actuate">>, Record#glyphRef.xlinkactuate}
].