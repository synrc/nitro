function comboClear(dom) { qi('comboContainer_' + dom).style.display = 'none'; activeCombo = undefined; currentItem = undefined };
function comboSelect(dom, row, feed, mod) {
  let elem = qi(dom); comboClear(dom);
  //  elem.value = event.currentTarget.innerHTML; 
  elem.value = row;
  elem.scrollIntoView();
  elem.style.backgroundColor = 'white';
  direct(tuple(atom('comboSelect'), string(dom), string(row), string(feed), atom(mod)));
}
function comboLostFocus(e) { }
function comboOnFocus(e) { }
function comboLookupKeydown(dom, feed, mod) { 
  var char = event.which || event.keyCode;
  if (activeCombo && currentItem && [37, 38, 39, 40, 13, 32].includes(char)) { event.preventDefault() } 
}

function comboLookupKeyup(dom, feed, mod) {
  var char = event.which || event.keyCode;
  if (char == 27) { qi(dom).value = ''; comboClear(dom); return}
  if (!activeCombo && char == 40) {
     activeCombo = dom;
     direct(tuple(atom('comboKeyup'), atom('all'), string(dom), string(feed), atom(mod)));
    return
  }
  if ([13, 32].includes(char) && currentItem) { currentItem.click(); return }
  
  if (activeCombo && [37, 38, 39, 40].includes(char)) {
    if (char == 37) { set_focus(qi('comboContainer_' + dom).firstChild) }
    if (char == 39) { set_focus(qi('comboContainer_' + dom).lastChild) }
    if (char == 40) { set_focus( currentItem ? currentItem.nextSibling : qi('comboContainer_' + dom).firstChild) }
    if (char == 38) { set_focus( currentItem ? currentItem.previousSibling : qi('comboContainer_' + dom).lastChild) }
    
    console.log('keyboard working with dropdown: ' + char);
  }
  else {
    activeCombo = dom;
    direct(tuple(atom('comboKeyup'), querySource(dom), string(dom), string(feed), atom(mod)));
  }
}

function set_focus(elem) {
  
  if (elem) {
    if(currentItem) {currentItem.style.backgroundColor = "white"}
    // elem.style.backgroundColor = "cornflowerblue"
    elem.style.backgroundColor = "pink"
    elem.scrollIntoView()
    currentItem = elem
  }
  
}


document.addEventListener("click", () => {
  if (activeCombo && !event.target.closest('#comboContainer_' + activeCombo)) {
    qi(activeCombo).value = '';
    comboClear(activeCombo);
  }
})
var activeCombo = undefined
var currentItem = undefined
