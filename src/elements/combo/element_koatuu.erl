-module(element_koatuu).
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("nitro/include/koatuuControl.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(#koatuu{id=Id, style=Style, postback = Postback,delegate = Module} = Data) ->
  Options = [ #option{ value = <<"Хмельницька"/utf8>>,
                       body = <<"Хмельницька"/utf8>>,
                      selected = true}], % 25 regions from const feed
  nitro:render(
    #panel{id=form:atom([koatuu, Id]),
           body=[ #select{ id=form:atom([koatuu_select, Id]), postback=Postback,
                           body=Options},

                  #comboLookup{ } ]}).

