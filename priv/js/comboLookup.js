function comboOpenFormById(formId) {
  var form = qi(formId);
  form && comboOpenForm(form);
}

function comboCloseFormById(formId) {
  var form = qi(formId);
  form && comboCloseForm(form);
}

function comboOpenForm(container) {
  var dropdown = container.parentNode.querySelector('.dropdown');
  container.scrollTop = 0;
  container.parentNode.classList.add('dropdown-open');
  dropdown.classList.add('dropdown-open');
  activeForm = container.id;
};

function comboCloseForm(container) {
  container.parentNode.classList.remove('dropdown-open');
  //container.previousSibling.classList.remove('dropdown-open');
  activeForm = undefined;
};

function comboLookupTextApply(dom) {
  let elem = qi(dom);
  if (elem) {
    let textareaSplit = dom.split('_');
    textareaSplit.pop();
    const textarea = qi(textareaSplit.join('_'));
    textarea ? textarea.value = elem.value : null;
  }
}

function comboClear(dom) {
    let elem = qi('comboContainer_' + dom)
    var dropdown = qi(dom).closest('.dropdown');
    if (elem) { elem.style.display = 'none' }
    dropdown.classList.remove('dropdown-open');
    dropdown.classList.remove('is-reversed');
    activeCombo = undefined; currentItem = undefined;
}

function comboSelect(uid, dom, row, feed, mod, id) {
    let elem = qi(dom);
    comboClear(dom);
    if (qi(id)) elem.setAttribute("data-bind", qi(id).getAttribute('data-bind'));
    elem.value = row;
    elem.style.backgroundColor = 'white';
    var dropdown = qi(dom).closest('.dropdown');
    dropdown.classList.remove('dropdown-open');
    dropdown.classList.remove('is-reversed');
    dropdown.classList.add('dropdown-bind');
    let value = qi(id) ? dec(unbase64(qi(id).getAttribute('data-bind'))) : string(row);
    const modifyItem = qi(elem.getAttribute('nested'));
    if (modifyItem) {
      const list = modifyItem.parentNode;
      direct(tuple(atom('comboModify'),
                   string(list.id),
                   string(modifyItem.id),
                   string(modifyItem.firstChild.innerHTML),
                   dec(unbase64(modifyItem.getAttribute('data-bind'))),
                   value,
                   dec(unbase64(list.getAttribute('data-delegate'))),
                   dec(unbase64(list.getAttribute('data-pos'))),
                   dec(unbase64(list.getAttribute('data-feed')))));
    } else {
      direct(tuple(atom('comboSelect'), bin(uid), value, string(dom), string(feed), atom(mod)));
    }
    comboLookupTextApply(dom);
}

function comboLookupChange(dom) {
  let elem = qi(dom);
  if (elem) {
    elem.removeAttribute("data-bind");
    const dropdown = qi(dom).closest('.dropdown');
    if (dropdown) { dropdown.classList.remove('dropdown-bind'); }
    comboLookupTextApply(dom);
  }
}

function comboLookupClick(uid, dom, feed, mod) {
  var dropdown = qi(dom).closest('.dropdown');
  var char = event.which || event.keyCode;
  if (char ==  1 && !activeCombo && (qi(dom).value == '' || qi(dom).getAttribute('nested'))) {
    activeCombo = dom;
    currentItem = undefined;
    dropdown.classList.add('dropdown-open');
    if (window.innerHeight - dropdown.getBoundingClientRect().bottom < 100)
      dropdown.classList.add('is-reversed');
    direct(tuple(atom('comboKey'),
                bin(uid),
                bin('all'),
                string(dom),
                string(feed),
                atom(mod)));
    return
  } else if (char ==  1 && activeCombo == dom) { comboClear(dom); }
}

function comboLookupKeydown(uid, dom, feed, mod) {
    var dropdown = qi(dom).closest('.dropdown');
    var char = event.which || event.keyCode;
    if (char == 40 && !activeCombo && qi(dom).value == '') {
        activeCombo = dom;
        currentItem = undefined;
        dropdown.classList.add('dropdown-open');
        if (window.innerHeight - dropdown.getBoundingClientRect().bottom < 100)
          dropdown.classList.add('is-reversed');
        direct(tuple(atom('comboKey'),
                     bin(uid),
                     bin('all'),
                     string(dom),
                     string(feed),
                     atom(mod)));
        return
    }
    if (activeCombo && [35, 36, 38, 40].includes(char)) {
        event.preventDefault();
        if (char == 40) { set_focus( currentItem && ( !cycleEnabled || currentItem.nextSibling)
                        ? currentItem.nextSibling : qi('comboContainer_' + dom).firstChild, true) }
        if (char == 35) { set_focus( currentItem && ( !cycleEnabled || currentItem.nextSibling)
                        ? currentItem.parentNode.lastChild : currentItem, true) }

        if (char == 38) { set_focus( currentItem && ( !cycleEnabled || currentItem.previousSibling)
                        ? currentItem.previousSibling : qi('comboContainer_' + dom).lastChild, true) }
        if (char == 36) { set_focus( currentItem && ( !cycleEnabled || currentItem.previousSibling)
                        ? currentItem.parentNode.firstChild : currentItem, true) }
    }
    if (char == 13) { event.preventDefault(); return }
}

function comboLookupKeyup(uid, dom, feed, mod) {
    var dropdown = qi(dom).closest('.dropdown')
    var char = event.which || event.keyCode;
    if (char == 27 || (char == 8 || char == 46) && qi(dom).value == '') { clearInput(dom); return }
    if (char == 13 && currentItem) { currentItem.click(); return }
    if ([33, 34, 37, 39].includes(char)) { return }
    if (activeCombo && [35, 36, 38, 40].includes(char)) { return }
    else {
        activeCombo = dom;
        currentItem = undefined;
        dropdown.classList.add('dropdown-open');
        if (window.innerHeight - dropdown.getBoundingClientRect().bottom < 100)
          dropdown.classList.add('is-reversed');
        direct(tuple(atom('comboKey'),
                     bin(uid),
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
    if (scroll==true) {elem.scrollIntoView({block: "nearest", inline: "nearest"})}
    currentItem = elem
  }
}

function clearInput(dom) {
  const input = qi(dom);
  if (input) {
    input.value = '';
    input.removeAttribute('value');
  }
  comboLookupChange(dom);
  comboClear(dom);
}

function comboLookupModifyAdd(listId, inputId) {
  const input = qi(inputId);
  const list = qi(listId);
  if (list && input && input.value != '') {
    const data = querySourceRaw(inputId);
    if (data && data.hasOwnProperty('text') && data.hasOwnProperty('bind')) {
      const bind = data.bind;
      const value = data.text;
      if (bind !== '' && bind !== 'null') {
        clearInput(inputId);
        direct(tuple(atom('comboAdd'),
                     string(listId),
                     string(value),
                     dec(unbase64(bind)),
                     dec(unbase64(list.getAttribute('data-delegate'))),
                     dec(unbase64(list.getAttribute('data-pos'))),
                     dec(unbase64(list.getAttribute('data-feed'))),
                     dec(unbase64(list.getAttribute('data-default')))));
      }
    }
  }
}

function comboLookupModifyValues(listId) {
  const list = qi(listId);
  if (list) {
    return Array.from(list.children).map(function (el) {
      return {'text': el.firstChild.innerHTML, 'bind': el.getAttribute('data-bind')}
    })
  } else {
    return []
  }
}

document.addEventListener("click", () => {
  if (activeCombo && event.target.className != 'triangle' &&
    !event.target.closest('#comboContainer_' + activeCombo)) {
    qi(activeCombo).value = '';
    comboClear(activeCombo);
  } else if (activeForm && event.target.className != 'triangle' &&
    !event.target.closest("#" + activeForm)) {
    comboCloseFormById(activeForm);
  }
})

function comboLostFocus(e) { }
function comboOnFocus(e) { }
function comboLookupMouseOut(dom) { }

var activeCombo = undefined
var activeForm = undefined
var currentItem = undefined
var cycleEnabled = false
