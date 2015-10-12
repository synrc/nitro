-module(element_view).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"view">>, nitro:render(Record#view.body),
	lists:append([
		[
			{<<"id">>, Record#view.id},
			{<<"class">>, Record#view.class},
			{<<"style">>, Record#view.style},
			{<<"viewBox">>, Record#view.viewBox},
			{<<"preserveAspectRatio">>, Record#view.preserveAspectRatio},
			{<<"zoomAndPan">>, Record#view.zoomAndPan},
			{<<"viewTarget">>, Record#view.viewTarget},
			{<<"externalResourcesRequired">>, Record#view.externalResourcesRequired}
		],
		svg_core(Record),
		Record#view.data_fields,
		Record#view.aria_states
	])).


%% Common SVG attributes
svg_core(Record)-> [
	{<<"xml:base">>, Record#view.xmlbase},
	{<<"xml:lang">>, Record#view.xmllang},
	{<<"xml:space">>, Record#view.xmlspace}
].