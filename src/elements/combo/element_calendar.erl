-module(element_calendar).
-include_lib("nitro/include/calendar.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/event.hrl").
-export([render_element/1]).

render_element(Record) when Record#calendar.show_if==false -> [<<>>];
render_element(Record) ->
    Id = case Record#calendar.postback of
        [] -> Record#calendar.id;
        Postback ->
          ID = case Record#calendar.id of
            [] -> nitro:temp_id();
            I -> I end,
          nitro:wire(#event{type=click, postback=Postback, target=ID,
                  source=Record#calendar.source, delegate=Record#calendar.delegate }),
          ID end,

    init(Id,Record),

    List = [
      %global
      {<<"accesskey">>, Record#calendar.accesskey},
      {<<"class">>, Record#calendar.class},
      {<<"contenteditable">>, case Record#calendar.contenteditable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"contextmenu">>, Record#calendar.contextmenu},
      {<<"dir">>, case Record#calendar.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> [] end},
      {<<"draggable">>, case Record#calendar.draggable of true -> "true"; false -> "false"; _ -> [] end},
      {<<"dropzone">>, Record#calendar.dropzone},
      {<<"hidden">>, case Record#calendar.hidden of "hidden" -> "hidden"; _ -> [] end},
      {<<"id">>, Id},
      {<<"spellcheck">>, case Record#calendar.spellcheck of true -> "true"; false -> "false"; _ -> [] end},
      {<<"style">>, Record#calendar.style},
      {<<"tabindex">>, Record#calendar.tabindex},
      {<<"title">>, Record#calendar.title},
      {<<"translate">>, case Record#calendar.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> [] end},
      % spec
      {<<"autocomplete">>, case Record#calendar.autocomplete of true -> "on"; false -> "off"; _ -> [] end},
      {<<"autofocus">>,if Record#calendar.autofocus == true -> "autofocus"; true -> [] end},
      {<<"disabled">>, if Record#calendar.disabled == true -> "disabled"; true -> [] end},
      {<<"form">>,Record#calendar.form},
      {<<"list">>,Record#calendar.list},
      {<<"name">>,Record#calendar.name},
      {<<"readonly">>,if Record#calendar.readonly == true -> "readonly"; true -> [] end},
      {<<"required">>,if Record#calendar.required == true -> "required"; true -> [] end},
      {<<"step">>,Record#calendar.step},
      {<<"type">>, <<"calendar">>},
      {<<"pattern">>,Record#calendar.pattern},
      {<<"placeholder">>,Record#calendar.placeholder},
      {<<"onkeypress">>, Record#calendar.onkeypress} | Record#calendar.data_fields
    ],
    wf_tags:emit_tag(<<"input">>, nitro:render(Record#calendar.body), List).

init(Id,#calendar{minDate=Min,maxDate=Max,lang=Lang,format=Form,
        value=Value,onSelect=SelectFn,disableDayFn=DisDayFn,firstDay=FirstDay,
        position=Pos,reposition=Repos,yearRange=YearRange} = Calendar) ->
    ID = nitro:to_list(Id),
    I18n =        "clLangs.ua",
    DefaultDate = case Value of
       {Yv,Mv,Dv} -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Yv),nitro:to_list(Mv-1),nitro:to_list(Dv)]);
        _ -> "''" end,
    MinDate =     case Min   of {Y,M,D}    -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Y), nitro:to_list(M-1), nitro:to_list(D)]);   _ -> "new Date(2009, 3, 4)" end,
    MaxDate =     case Max   of {Y1,M1,D1} -> nitro:f("new Date(~s,~s,~s)",[nitro:to_list(Y1),nitro:to_list(M1-1),nitro:to_list(D1)]);  _ -> "new Date(2189, 4, 1)" end,
    OnSelect =    "null",
    DisDay =      "null",
    Position =    "bottom left",
    Reposition =  "true",
    WeekFirstDay = nitro:to_list(FirstDay),
    nitro:wire(nitro:f(
        "pickers['~s'] = new Pikaday({
            field: document.getElementById('~s'),
            i18n: ~s,
            defaultDate: ~s,
            setDefaultDate: true,
            firstDay: ~s,
            minDate: ~s,
            maxDate: ~s,
            format: '~s',
            onSelect: ~s,
            disableDayFn: ~s,
            position: '~s',
            reposition: ~s,
            yearRange: ~s
        });",
        [ID,ID,I18n,DefaultDate,WeekFirstDay,MinDate,MaxDate,Form,OnSelect,DisDay,
         Position,Reposition,nitro:to_list(YearRange)]
    )).

