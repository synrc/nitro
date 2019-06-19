-module(element_link).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-compile(export_all).

render_element(Record) when Record#link.show_if==false -> [<<>>];
render_element(Record) -> 
    Id = case Record#link.postback of
        [] -> Record#link.id;
        Postback ->
            ID = case Record#link.id of [] -> nitro:temp_id(); I -> I end,
            nitro:wire(#event{ type=click,postback=Postback,target=ID,
                            source=Record#link.source,delegate=Record#link.delegate,validation=Record#link.validate}),
            ID end,
    List = [
      % global
      {<<"accesskey">>, Record#link.accesskey},
      {<<"class">>, Record#link.class},
      {<<"contenteditable">>, case Record#link.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#link.contextmenu},
      {<<"dir">>, case Record#link.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#link.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#link.dropzone},
      {<<"hidden">>, case Record#link.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"lang">>, Record#link.lang},
      {<<"spellcheck">>, case Record#link.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#link.style},
      {<<"tabindex">>, Record#link.tabindex},
      {<<"title">>, Record#link.title},
      {<<"translate">>, case Record#link.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},      
      % spec
      {<<"href">>, nitro:coalesce([Record#link.href,Record#link.url])},
      {<<"hreflang">>, Record#link.hreflang},
      {<<"target">>, Record#link.target},
      {<<"media">>, Record#link.media},
      {<<"rel">>, Record#link.rel},
      {<<"type">>, Record#link.type},
      {<<"download">>, Record#link.download},
      {<<"name">>, Record#link.name},
      {<<"onclick">>, Record#link.onclick},
      {<<"onmouseover">>, Record#link.onmouseover} | Record#link.data_fields ],
    wf_tags:emit_tag(<<"a">>, nitro:render(Record#link.body), List).
