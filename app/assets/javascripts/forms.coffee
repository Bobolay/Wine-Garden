$("body").on "focusin focusout", ".input", (e)->
  $input_wrap = $(this)

  if e.type == 'focusin'
    $input_wrap.addClass("focus")
  else if e.type == 'focusout'
    $input_wrap.removeClass('focus')

$("body").on "keyup", ".input.string, .input.text, .input.phone", (e)->

  $input_wrap = $(this)
  $target_input = $(e.target)
  val = $target_input.val()
  console.log val
  if val.length > 0
    $input_wrap.removeClass("empty").addClass("not-empty")
  else
    $input_wrap.removeClass("not-empty").addClass("empty")

  $(this).trigger("after_keyup", e)


$("body").on "click", ".input label:not([for])", ()->
  $(this).parent().children().filter("input").first().trigger("focus")



$("form").on "submit", (e)->
  e.preventDefault()
  alert("Дякуємо")

  $form = $(this)
  data_str = $form.serialize()
  method = $form.attr("method")
  url = $form.attr("action")
  $.ajax({
    url: url
    type: "post"
    data: data_str
  })

