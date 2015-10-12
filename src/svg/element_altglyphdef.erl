-module(element_altglyphdef).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"altGlyphDef">>, nitro:render(Record#altGlyphDef.body),
	lists:append([
		[
			{<<"id">>, Record#altGlyphDef.id},
			{<<"class">>, Record#altGlyphDef.class},
			{<<"xml:base">>, Record#altGlyphDef.xmlbase},
			{<<"xml:lang">>, Record#altGlyphDef.xmllang},
			{<<"xml:space">>, Record#altGlyphDef.xmlspace}
		],
		Record#altGlyphDef.data_fields,
		Record#altGlyphDef.aria_states
	])).