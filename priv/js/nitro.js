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
                default: var edit = el.contentEditable;
                    if (edit && edit === 'true') val = el.innerHTML;
                    else val = el.value;
            }
            break;
        default:
            if (el.getAttribute('data-vector-input')) {
                val = querySourceRaw(el.children[1].id);
            } else if (el.getAttribute('data-sortable-list')) {
                val = getSortableValues('#' + el.id);
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
    console.log("querySourceRaw:val:", val)
    return val;
}

function querySource(Id) {
    var qs = querySourceRaw(Id);
    if (qs instanceof Date) {
        return tuple(number(qs.getFullYear()),
                     number(qs.getMonth() + 1),
                     number(qs.getDate())); }
    else if (qs instanceof Boolean) {
        return atom(qs.valueOf()); }
    else if (qs instanceof Array) {
        return list.apply(null, qs.map(bin)); }
    else { return bin(qs); }
}

(function () {
    window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
        window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
})();
