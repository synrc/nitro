function comboClear(dom) {
    let elem = qi('comboContainer_' + dom)
    if (elem) { elem.style.display = 'none' }
    activeCombo = undefined; currentItem = undefined;
}

function comboSelect(dom, row, feed, mod, id) {
    let elem = qi(dom); comboClear(dom);
    if (qi(id)) elem.setAttribute("data-bind", qi(id).getAttribute('data-bind'));
    elem.value = row;
    elem.style.backgroundColor = 'white';
    direct(tuple(atom('comboSelect'),
                 string(dom),
                 string(row),
                 string(feed),
                 atom(mod)));
}

function comboLookupChange(dom) {
  let elem = qi(dom);
  if (elem && elem.value == "" && elem.getAttribute("data-bind")) {
    elem.removeAttribute("data-bind");
  }
}

function comboLookupClick(dom, feed, mod) {
  var char = event.which || event.keyCode;
  if (char ==  1 && !activeCombo && qi(dom).value == '') {
    activeCombo = dom;
    currentItem = undefined;
    direct(tuple(atom('comboKey'),
                atom('all'),
                string(dom),
                string(feed),
                atom(mod)));
    return
  } else if(char ==  1 && activeCombo == dom){comboClear(dom);}
}

function comboLookupKeydown(dom, feed, mod) {
    var char = event.which || event.keyCode;
    if (char == 40 && !activeCombo && qi(dom).value == '') {
        activeCombo = dom;
        currentItem = undefined;
        direct(tuple(atom('comboKey'),
                     atom('all'),
                     string(dom),
                     string(feed),
                     atom(mod)));
        return
    }
    if (activeCombo && [38, 40].includes(char)) {
        event.preventDefault();
        console.log('Keycode: ' + char + ", DOM: " + dom);
        if (char == 40) { set_focus( currentItem && ( !cycleEnabled || currentItem.nextSibling)
                        ? currentItem.nextSibling : qi('comboContainer_' + dom).firstChild, true) }
        if (char == 38) { set_focus( currentItem && ( !cycleEnabled || currentItem.previousSibling)
                        ? currentItem.previousSibling : qi('comboContainer_' + dom).lastChild, true) }
    }
}

function comboLookupKeyup(dom, feed, mod) {
    var char = event.which || event.keyCode;
    if (char == 27 || (char == 8 || char == 46) && qi(dom).value == '') {
        qi(dom).value = '';
        comboClear(dom);
        return
    }
    if (char == 13 && currentItem) { currentItem.click(); return }
    if ([33, 34, 35, 36, 37, 39].includes(char)) { return }
    if (activeCombo && [38, 40].includes(char)) { return }
    else {
        activeCombo = dom;
        currentItem = undefined;
        direct(tuple(atom('comboKey'),
                     bin(qi(dom).value),
                     string(dom),
                     string(feed),
                     atom(mod)));
    }
}

function comboLookupMouseMove(dom) {
  set_focus(event.target.closest('.dropdown-item'), false)
}

function set_focus(elem, scroll) {
  if (elem) {
    if(currentItem) {currentItem.className = "dropdown-item"}
    elem.className = "dropdown-item focus"
    if (scroll==true) {elem.scrollIntoView({block: "center", inline: "nearest"})}
    currentItem = elem
  }
}

document.addEventListener("click", () => {
  if (activeCombo && event.target.className != 'triangle' &&
    !event.target.closest('#comboContainer_' + activeCombo)) {
    qi(activeCombo).value = '';
    comboClear(activeCombo);
  }
})

function comboLostFocus(e) { }
function comboOnFocus(e) { }
function comboLookupMouseOut(dom) { }

var activeCombo = undefined
var currentItem = undefined
var cycleEnabled = false
