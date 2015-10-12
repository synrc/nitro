-module(element_svgscript).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"svgscript">>, nitro:render(Record#svgscript.body),
	lists:append([
		[
			{<<"id">>, Record#svgscript.id},
			{<<"class">>, Record#svgscript.class},
			{<<"style">>, Record#svgscript.style},
			{<<"type">>, Record#svgscript.type},
			{<<"externalResourcesRequired">>, Record#svgscript.externalResourcesRequired}
		],
		svgscript_core(Record),
		svgscript_xlink(Record),
		Record#svgscript.data_fields,
		Record#svgscript.aria_states
	])).


%% Common SVG attributes
svgscript_core(Record)-> [
	{<<"xml:base">>, Record#svgscript.xmlbase},
	{<<"xml:lang">>, Record#svgscript.xmllang},
	{<<"xml:space">>, Record#svgscript.xmlspace}
].

svgscript_xlink(Record)-> [
	{<<"xlink:href">>, Record#svgscript.xlinkhref},
	{<<"xlink:type">>, Record#svgscript.xlinktype},
	{<<"xlink:role">>, Record#svgscript.xlinkrole},
	{<<"xlink:arcrole">>, Record#svgscript.xlinkarcrole},
	{<<"xlink:title">>, Record#svgscript.xlinktitle},
	{<<"xlink:show">>, Record#svgscript.xlinkshow},
	{<<"xlink:actuate">>, Record#svgscript.xlinkactuate}
].