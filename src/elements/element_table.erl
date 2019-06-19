-module(element_table).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) when Record#table.show_if==false -> [<<>>];
render_element(Record = #table{}) -> 
  Header = case Record#table.header of
    [] -> "";
    H when is_tuple(H) -> H;
    _ -> wf_tags:emit_tag(<<"thead">>, nitro:render(Record#table.header), [])
  end,
  Footer = case Record#table.footer of
    [] -> "";
    _ -> wf_tags:emit_tag(<<"tfoot">>, nitro:render(Record#table.footer), [])
  end,
  Bodies = case Record#table.body of
    #tbody{} = B -> B;
    [] -> #tbody{};
    unndefined -> #tbody{};
    Rows -> [case B of #tbody{}=B1 -> B1; _-> #tbody{body=B} end  || B <- Rows]
  end,
  Caption = case Record#table.caption of
    [] -> "";
    _ -> wf_tags:emit_tag(<<"caption">>, nitro:render(Record#table.caption), [])
  end,
  Colgroup = case Record#table.colgroup of
    [] -> "";
    _ -> wf_tags:emit_tag(<<"colgroup">>, nitro:render(Record#table.colgroup), [])
  end,
  wf_tags:emit_tag( <<"table">>, nitro:render([Caption, Colgroup, Header, Footer, Bodies]), [
      {<<"id">>, Record#table.id},
      {<<"class">>, Record#table.class},
      {<<"style">>, Record#table.style} | Record#table.data_fields
  ]).
