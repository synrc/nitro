function validateSources(list) {
    return list.reduce(function(acc,x) {
        var event = new CustomEvent('validation');
            event.initCustomEvent('validation',true,true,querySourceRaw(x));
        var el = qi(x),
            listener = el && el.validation,
            res = !listener || listener && el.dispatchEvent(event);
        console.log(el && el.parentNode.lastChild);
        if (!res) {
          console.log("Validation failed:" + x);
          scrollToValidationInputs();
        }
        //if (el) el.style.background = res ? '' : 'pink';
        return res && acc; },true); }

(function () {
   function CustomEvent ( event, params ) {
       params = params || { bubbles: false, cancelable: false, detail: undefined };
       var evt = document.createEvent( 'CustomEvent' );
       evt.initCustomEvent( event, params.bubbles, params.cancelable, params.detail );
       return evt;  };
  CustomEvent.prototype = window.Event.prototype;
  window.CustomEvent = CustomEvent; })();

function scrollToValidationInputs() {
  const inputFields = document.querySelectorAll('.column')

  for (let item of inputFields) {
    if (item.classList.contains('error')) {
      const errorInputField = document.querySelector('.column.error')
      console.log(errorInputField)

      errorInputField.scrollIntoView({
        behavior: 'smooth',
        block: 'center'
      })
    }
  }
}