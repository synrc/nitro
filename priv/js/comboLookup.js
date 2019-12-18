function comboClear(dom) { qi('comboContainer_'+dom).style.display = 'none'; };
function comboSelect(dom, row) { comboClear(dom); qi(dom).value = row; qi(dom).style.backgroundColor = 'white'; }
function comboLostFocus(e) { }
function comboOnFocus(e) { }
function comboLookupKeyup(dom,feed,mod) {
  var char = event.which || event.keyCode;
  if (char == 27) { qi(dom).value = ''; comboClear(dom); }
  else { direct(tuple(atom('comboKeyup'),querySource(dom),string(dom),string(feed),atom(mod))); }
}
