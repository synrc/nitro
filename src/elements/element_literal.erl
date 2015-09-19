-module(element_literal).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #literal{}) ->
	case Record#literal.html_encode of
		true -> nitro:html_encode(Record#literal.body);
		_    -> Record#literal.body
	end.
