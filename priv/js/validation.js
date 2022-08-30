function validateSources(list) {
    return list.reduce(function(acc,x) {
        var event = new CustomEvent('validation',{
            bubbles: true,
            cancelable: true,
            detail: querySourceRaw(x) });
        var el = qi(x),
            listener = el && el.validation,
            res = !listener || listener && el.dispatchEvent(event);
        if (!res) {
          console.log("Validation failed:" + x);
          scrollToValidationInputs();
        }
        return res && acc; },true); }

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