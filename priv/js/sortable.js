"use strict";

function _instanceof(left, right) { if (right != null && typeof Symbol !== "undefined" && right[Symbol.hasInstance]) { return !!right[Symbol.hasInstance](left); } else { return left instanceof right; } }

function _classCallCheck(instance, Constructor) { if (!_instanceof(instance, Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

window.addEventListener('touchmove', function () {});

var Sortable =
/*#__PURE__*/
function () {
  function Sortable(list, options) {
    _classCallCheck(this, Sortable);
    this.list = typeof list === 'string' ? document.querySelector(list) : list;
    this.items = Array.from(this.list.children);
    this.animation = false;
    this.options = Object.assign({
      animationSpeed: 200,
      animationEasing: 'ease-out'
    }, options || {});
    this.dragStart = this.dragStart.bind(this);
    this.dragMove = this.dragMove.bind(this);
    this.dragEnd = this.dragEnd.bind(this);
    this.list.addEventListener('touchstart', this.dragStart, false);
    this.list.addEventListener('mousedown', this.dragStart, false);
  }

  _createClass(Sortable, [{
    key: "dragStart",
    value: function dragStart(e) {
      var _this = this;

      if (this.animation) return;
      if (e.type === 'mousedown' && e.which !== 1) return;
      if (e.type === 'touchstart' && e.touches.length > 1) return;
      this.handle = null;
      var el = e.target;

      while (el) {
        if (el.hasAttribute('data-sortable-handle')) this.handle = el;
        if (el.hasAttribute('data-sortable-item')) this.item = el;
        if (el.hasAttribute('data-sortable-list')) break;
        el = el.parentElement;
      }

      if (!this.handle) return;
      this.list.style.position = 'relative';
      this.list.style.height = this.list.offsetHeight + 'px';
      this.item.classList.add('is-dragging');
      this.itemHeight = this.items[1].offsetTop;
      this.listHeight = this.list.offsetHeight;
      this.startTouchY = this.getDragY(e);
      this.startTop = this.item.offsetTop;
      var offsetsTop = this.items.map(function (item) {
        return item.offsetTop;
      });
      this.items.forEach(function (item, index) {
        item.style.position = 'absolute';
        item.style.top = 0;
        item.style.left = 0;
        item.style.width = '100%';
        item.style.transform = "translateY(".concat(offsetsTop[index], "px)");
        item.style.zIndex = item == _this.item ? 2 : 1;
      });
      setTimeout(function () {
        _this.items.forEach(function (item) {
          if (_this.item == item) return;
          item.style.transition = "transform ".concat(_this.options.animationSpeed, "ms ").concat(_this.options.animationEasing);
        });
      });
      this.positions = this.items.map(function (item, index) {
        return index;
      });
      this.position = Math.round(this.startTop / this.listHeight * this.items.length);
      this.touch = e.type == 'touchstart';
      window.addEventListener(this.touch ? 'touchmove' : 'mousemove', this.dragMove, {
        passive: false
      });
      window.addEventListener(this.touch ? 'touchend' : 'mouseup', this.dragEnd, false);
    }
  }, {
    key: "dragMove",
    value: function dragMove(e) {
      var _this2 = this;

      if (this.animation) return;
      var top = this.startTop + this.getDragY(e) - this.startTouchY;
      var newPosition = Math.round(top / this.listHeight * this.items.length);
      this.item.style.transform = "translateY(".concat(top, "px)");
      this.positions.forEach(function (index) {
        if (index == _this2.position || index != newPosition) return;

        _this2.swapElements(_this2.positions, _this2.position, index);

        _this2.position = index;
      });
      this.items.forEach(function (item, index) {
        if (item == _this2.item) return;
        item.style.transform = "translateY(".concat(_this2.positions.indexOf(index) * _this2.itemHeight, "px)");
      });
      e.preventDefault();
    }
  }, {
    key: "dragEnd",
    value: function dragEnd(e) {
      var _this3 = this;

      this.animation = true;
      this.item.style.transition = "all ".concat(this.options.animationSpeed, "ms ").concat(this.options.animationEasing);
      this.item.style.transform = "translateY(".concat(this.position * this.itemHeight, "px)");
      this.item.classList.remove('is-dragging');
      setTimeout(function () {
        _this3.list.style.position = '';
        _this3.list.style.height = '';

        _this3.items.forEach(function (item) {
          item.style.top = '';
          item.style.left = '';
          item.style.right = '';
          item.style.position = '';
          item.style.transform = '';
          item.style.transition = '';
          item.style.width = '';
          item.style.zIndex = '';
        });

        _this3.positions.map(function (i) {
          return _this3.list.appendChild(_this3.items[i]);
        });

        _this3.items = Array.from(_this3.list.children);
        _this3.animation = false;
      }, this.options.animationSpeed);
      window.removeEventListener(this.touch ? 'touchmove' : 'mousemove', this.dragMove, {
        passive: false
      });
      window.removeEventListener(this.touch ? 'touchend' : 'mouseup', this.dragEnd, false);
    }
  }, {
    key: "swapElements",
    value: function swapElements(array, a, b) {
      var temp = array[a];
      array[a] = array[b];
      array[b] = temp;
    }
  }, {
    key: "getDragY",
    value: function getDragY(e) {
      return e.touches ? (e.touches[0] || e.changedTouches[0]).pageY : e.pageY;
    }
  }, {
    key: "removeItem",
    value: function removeItem(item) {
      this.items.splice(this.items.indexOf(item),1);
      item.remove();
    }
  }, {
    key: "addItemFrom",
    value: function addItemFrom(input) {
      var value = querySourceRaw(input);
      var bind = '';
      if (value && value.hasOwnProperty('text') && value.hasOwnProperty('bind')) {
        bind = value.bind;
        value = value.text;
      }
      var inputElement = document.getElementById(input);
      if (bind !== '' && bind !== 'null') {
        if (inputElement) {
          const dropdown = inputElement.parentNode;
          if (dropdown && dropdown.classList.contains('dropdown')) { dropdown.classList.remove('dropdown-bind'); }
          inputElement.value = '';
          inputElement.removeAttribute("data-bind");
        }
        appendItemFromBind(this.list.id,value,bind);
      } else if(value && Date.prototype.isPrototypeOf(value)) {
        appendItemFromBind(this.list.id,inputElement.value,pickers[input]._d || "");
        if (inputElement) {
          inputElement.value = '';
          inputElement.removeAttribute("data-bind");
        }
      }
    }
  }, {
    key: "getValues",
    value: function getValues() {
      return Array.from(this.items.map(function(item) {
        let list = Array.from(item.children).find(x => x.getAttribute("list-item-content"));
        let text = list.firstChild.innerHTML;
        let bind = item.getAttribute('data-bind');
        if(item.getAttribute('date-bind')) return new Date(item.getAttribute('date-bind'));
        if (bind) return { 'text': text, 'bind': bind };
        return text;
      }));
    }
  }]);

  return Sortable;
}();

var SortableMap = new Map([]);

function createSortable(list) {
  SortableMap.set(list, new Sortable(list));
}

function removeSortableItem(list, item) {
  SortableMap.get(list).removeItem(item);
}

function addSortableItemFrom(list, input) {
  var value = querySourceRaw(input);
  var isAdded = SortableMap.get(list).items.map(el => el.textContent).includes(value.text || value);
  if(qi(input).value != '' && !isAdded)
    SortableMap.get(list).addItemFrom(input);
}

function getSortableValues(list) {
  let sortable = SortableMap.get(list)
  if(sortable) {
    return sortable.getValues();
  } else {
    return Array.from([]);
  }
}

function appendItemFromBind(dom,value,bind) {
  var sortable = SortableMap.get('#'+dom);
  var template = document.createElement('template');
  template.innerHTML =
    '<div class="list__item" data-sortable-item="data-sortable-item" style="" data-bind="'+ bind + '">' +
       '<div class="list__item-close" onclick="removeSortableItem(\'#' + sortable.list.id + '\', this.parentNode);"></div>' +
       '<div class="list__item-content" list-item-content="list-item-content"><div class="list__item-title">' + value + '</div></div>' +
       '<div class="list__item-handle" data-sortable-handle="data-sortable-handle"></div>' +
    '</div>'
  var new_item = template.content.firstChild;
  if(bind instanceof Date) {
    new_item.setAttribute("date-bind", bind);
    new_item.setAttribute("data-bind", "");
  }
  sortable.list.appendChild(new_item);
  sortable.items.push(new_item);
}
