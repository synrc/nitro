-module(element_literal).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> nitro:html_encode(Record#literal.body).
