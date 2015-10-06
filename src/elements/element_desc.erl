-module(element_desc).
-author('Konstantin Zakablukovsky').
-include("nitro.hrl").
-compile(export_all).

render_element(Record) ->
	wf_tags:emit_tag(<<"desc">>, nitro:render(Record#desc.body),
	lists:append([
		[
			{<<"id">>, Record#desc.id},
			{<<"class">>, Record#desc.class},
			{<<"xml:base">>, Record#desc.xmlbase},
			{<<"xml:lang">>, Record#desc.xmllang},
			{<<"xml:space">>, Record#desc.xmlspace}
		],
		Record#desc.data_fields,
		Record#desc.aria_states
	])).