-module(element_svgstyle).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"svgstyle">>, nitro:render(Record#svgstyle.body),
	lists:append([
		[
			{<<"id">>, Record#svgstyle.id},
			{<<"class">>, Record#svgstyle.class},
			{<<"style">>, Record#svgstyle.style},
			{<<"type">>, Record#svgstyle.type},
			{<<"media">>, Record#svgstyle.media},
			{<<"title">>, Record#svgstyle.title}
		],
		svgstyle_core(Record),
		svgstyle_xlink(Record),
		Record#svgstyle.data_fields,
		Record#svgstyle.aria_states
	])).


%% Common SVG attributes
svgstyle_core(Record)-> [
	{<<"xml:base">>, Record#svgstyle.xmlbase},
	{<<"xml:lang">>, Record#svgstyle.xmllang},
	{<<"xml:space">>, Record#svgstyle.xmlspace}
].

svgstyle_xlink(Record)-> [
	{<<"xlink:href">>, Record#svgstyle.xlinkhref},
	{<<"xlink:type">>, Record#svgstyle.xlinktype},
	{<<"xlink:role">>, Record#svgstyle.xlinkrole},
	{<<"xlink:arcrole">>, Record#svgstyle.xlinkarcrole},
	{<<"xlink:title">>, Record#svgstyle.xlinktitle},
	{<<"xlink:show">>, Record#svgstyle.xlinkshow},
	{<<"xlink:actuate">>, Record#svgstyle.xlinkactuate}
].