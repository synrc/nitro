// Nitrogen Compatibility Layer

function unbase64(base64) {
    var binary_string = window.atob(base64);
    var len = binary_string.length;
    var bytes = new Uint8Array(len);
    for (var i = 0; i < len; i++) bytes[i] = binary_string.charCodeAt(i);
    return bytes.buffer;
}

// Nitrogen Compatibility Layer

function direct(term) { ws.send(enc(tuple(atom('direct'),term))); }
function validateSources() { return true; }
function querySourceRaw(Id) {
    var val, el = document.getElementById(Id);
    if (!el) {
       val = qs('input[name='+Id+']:checked'); val = val ? val.value : "";
    } else switch (el.tagName) {
        case 'FIELDSET':
            val = qs('[id="'+Id+'"]:checked'); val = val ? val.value : ""; break;
        case 'INPUT':
            switch (el.getAttribute("type")) {
                case 'radio': case 'checkbox': val = qs('input[name='+Id+']:checked'); val = val ? val.value : ""; break;
                case 'date': val = Date.parse(el.value);  val = val && new Date(val) || ""; break;
                case 'calendar': val = pickers[el.id]._d || ""; break;
                case 'comboLookup': case 'hidden':
                    if (el.hasAttribute('data-bind')) {
                        val = { 'text' : el.value, 'bind' : el.getAttribute('data-bind')};
                    } else {
                        val = el.value;
                    }
                    break;
                default: var edit = el.contentEditable;
                    if (edit && edit === 'true') val = el.innerHTML;
                    else val = el.value;
            }
            break;
        default:
            if(el.getAttribute('data-text-input')) {
              val = querySourceRaw(el.children[1].children[0].id);
            }
            else if (el.getAttribute('data-vector-input')) {
                val = querySourceRaw(el.children[1].id);
            } else if (el.getAttribute('data-modify-input')) {
                val = querySourceRaw(el.children[1].id);
            } else if (el.getAttribute('data-edit-input')) {
                let sortableList = el.children[1];
                let sourceRaw = sortableList ? sortableList.id :
                  el.children[0].children[0].children[0].id;
                val = querySourceRaw(sourceRaw);
            } else if (el.getAttribute('data-sortable-list')) {
                val = getSortableValues('#' + el.id);
            } else if (el.getAttribute('data-modify-list')) {
                val = comboLookupModifyValues(el.id);
            } else if (el.contentEditable === 'true') {
                val = el.innerHTML;
            } else {
                val = el.value;
                switch (val) {
                    case "true": val = new Boolean(true); break;
                    case "false": val = new Boolean(false); break;
                }
            }
    }
    return val;
}

function querySourceConvert(qs) {
    if (qs && qs.hasOwnProperty('text') && qs.hasOwnProperty('bind')) {
        return dec(unbase64(qs.bind)); }
    else if (qs instanceof Date) {
        return tuple(number(qs.getFullYear()),
                     number(qs.getMonth() + 1),
                     number(qs.getDate())); }
    else if (qs instanceof Boolean) {
        return atom(qs.valueOf()); }
    else if (qs instanceof Array) {
        return list.apply(null, qs.map(querySourceConvert)); }
    else { return bin(qs); }
}

function querySource(Id) {
    var qs = querySourceRaw(Id);
    return querySourceConvert(qs);
}
