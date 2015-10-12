-module(element_altglyphitem).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"altGlyphItem">>, nitro:render(Record#altGlyphItem.body),
	lists:append([
		[
			{<<"id">>, Record#altGlyphItem.id},
			{<<"class">>, Record#altGlyphItem.class},
			{<<"xml:base">>, Record#altGlyphItem.xmlbase},
			{<<"xml:lang">>, Record#altGlyphItem.xmllang},
			{<<"xml:space">>, Record#altGlyphItem.xmlspace}
		],
		Record#altGlyphItem.data_fields,
		Record#altGlyphItem.aria_states
	])).