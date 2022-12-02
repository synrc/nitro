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
  elem.value = '';
  comboClear(dom);

  if (qi(elem.getAttribute('nested'))) {
    comboSelectNested(...arguments);
  } else if (elem.parentNode.parentNode.getAttribute('data-modify-input')) {
    comboSelectModify(...arguments);
  } else if (elem.parentNode.parentNode.parentNode.getAttribute('data-vector-input')) {
    comboSelectVector(...arguments);
  } else if (elem.parentNode.parentNode.getAttribute('data-group-input')) {
    comboSelectGroup(...arguments);
  } else if (elem.parentNode.parentNode.parentNode.getAttribute('data-edit-input') && elem.parentNode.parentNode.parentNode.getAttribute('multiple') === "true") {
    comboSelectVector(...arguments); comboCloseFormById(`${dom}_form`);
  } else {
    comboSelectDefault(...arguments);
  }
}

function comboSelectDefault(uid, dom, row, feed, mod, id) {
  let elem = qi(dom);
  elem.closest('.dropdown').classList.add('dropdown-bind')
  elem.value = row;

  let value = string(row);
  let update = list();
  const selected = qi(id);
  if (selected) {
    elem.setAttribute('data-bind', selected.getAttribute('data-bind'));
    value = dec(unbase64(selected.getAttribute('data-bind')));
    if (elem.getAttribute('data-update')) { update = dec(unbase64(elem.getAttribute('data-update'))); }
  }

  direct(tuple(atom('comboSelect'), bin(uid), value, string(dom), string(feed), atom(mod), update));
  comboLookupTextApply(dom);
};

function comboSelectNested(uid, dom, row, feed, mod, id) {
  const modifyItem = qi(qi(dom).getAttribute('nested'));
  const list = modifyItem.parentNode;
  const value = qi(id) ? dec(unbase64(qi(id).getAttribute('data-bind'))) : string(row)

  direct(tuple(atom('comboModify'),
               string(list.id),
               string(modifyItem.id),
               string(modifyItem.firstChild.innerHTML),
               dec(unbase64(modifyItem.getAttribute('data-bind'))),
               value,
               dec(unbase64(list.getAttribute('data-delegate'))),
               dec(unbase64(list.getAttribute('data-pos'))),
               dec(unbase64(list.getAttribute('data-feed')))));
}

function comboSelectModify(uid, dom, row, feed, mod, id) {
  comboSelectDefault(...arguments);
  let listSplit = dom.split('_');
  listSplit.pop();
  const listId = listSplit.join('_') + '_list';
  const input = qi(dom);
  const list = qi(listId);
  if (list && input && input.value != '') {
    const data = querySourceRaw(dom);
    if (data && data.hasOwnProperty('text') && data.hasOwnProperty('bind')) {
      const bind = data.bind;
      const value = data.text;
      if (bind !== '' && bind !== 'null') {
        clearInput(dom);
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

function comboSelectVector(uid, dom, row, feed, mod, id) {
  comboSelectDefault(...arguments);
  let listSplit = dom.split('_');
  listSplit.pop();
  const listId = listSplit.join('_') + '_list';
  const input = qi(dom);
  const list = qi(listId);
  if (list && input && input.value != '') {
    const data = querySourceRaw(dom);
    if (data && data.hasOwnProperty('text') && data.hasOwnProperty('bind')) {
      const bind = data.bind;
      const value = data.text;
      if (bind !== '' && bind !== 'null') {
        clearInput(dom);
        direct(tuple(atom('comboVecAdd'), string(listId), dec(unbase64(bind)), string(feed), atom(mod)));
      }
    }
  }

}

function comboSelectGroup(uid, dom, row, feed, mod, id) {
  const selected = qi(id);
  if (selected) {
    const parent = qi(dom).parentNode.parentNode;
    const bind = selected.getAttribute('data-bind');
    if (!parent.querySelector(`[data-group-item='data-group-item'][data-bind='${bind}']`)) {
      const draft = parent.id + '_draft';
      const value = dec(unbase64(bind));
      const subtitle = qi(draft).querySelector(".group-list__label");
      direct(tuple(atom('comboGroup'), string(draft), value, atom(mod), bin(subtitle.textContent), string(parent.id)));
    }
  }
}

function comboLookupChange(dom) {
  let elem = qi(dom);
  if (elem && !elem.getAttribute('nested')) {
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
    if (event.key == 'Meta')  { return }
    if (event.key == 'Alt')   { return }
    if (event.key == 'Shift') { return }
    var dropdown = qi(dom).closest('.dropdown');
    var char = event.which || event.keyCode;
    if (qi(dom).value == '' && event.key == 'Backspace') { return }
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
    if (event.key == 'Meta')  { return }
    if (event.key == 'Alt')   { return }
    if (event.key == 'Shift') { return }
    if (event.key == 'Tab') { dropdown.classList.remove('dropdown-open'); return }
    var char = event.which || event.keyCode;
    if (char == 27 || (char == 8 || char == 46) && qi(dom).value == '') { 
      if(event.key == 'Backspace') {
        direct(tuple(atom('comboKey'),
                     bin(uid),
                     bin('stop'),
                     string(dom),
                     string(feed),
                     atom(mod)));
      }
      clearInput(dom); return 
    }
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

  if (input && input.getAttribute('data-update')) {
    let update = dec(unbase64(input.getAttribute('data-update')));
    update.v[5] = atom('skip');
    direct(update);
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

function comboLookupGroupDraft(id, group, subtitle, mod) {
  const elem = qi(id);
  const values = Array.from(elem.querySelectorAll('[data-group-item]')).map(function (el) {return dec(unbase64(el.getAttribute('data-bind')))});
  direct(tuple(atom('comboDraft'), string(elem.parentNode.id), string(id), values, atom(group), bin(subtitle), atom(mod)));
}

function groupListDrag(e) { e.dataTransfer.setData('text', e.target.id); }

function groupListDrop(e) {
  e.preventDefault();
  const node1 = e.currentTarget;
  const node2 = qi(e.dataTransfer.getData('text'));
  const parent = node1.parentNode;
  const sibling = node1.nextSibling === node2 ? node1 : node1.nextSibling;

  node2.parentNode.insertBefore(node1, node2);
  parent.insertBefore(node2, sibling);
}

function groupListAllowDrop(e) {
  e.preventDefault();
  e.dataTransfer.dropEffect = 'move';
}

document.addEventListener("click", () => {
  if (activeCombo && event.target.className != 'triangle' &&
    !event.target.closest('#comboContainer_' + activeCombo)) {
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
