$("body").on "focusin focusout", ".input", (e)->
  $input_wrap = $(this)

  if e.type == 'focusin'
    $input_wrap.addClass("focus")
  else if e.type == 'focusout'
    $input_wrap.removeClass('focus')

$("body").on "keyup", ".input, .input.text, .input.phone", (e)->
  $input_wrap = $(this)
  $target_input = $(e.target)
  val = $target_input.val()
  console.log val
  if val.length > 0
    $input_wrap.addClass("not-empty")
  else
    $input_wrap.removeClass("not-empty")

  $(this).trigger("after_keyup", e)


$("body").on "click", ".input label:not([for])", ()->
  $(this).parent().children().filter("input").first().trigger("focus")



$("form").on "submit", (e)->
  all_present = true
  e.preventDefault()
  $(this).find('.required').each ()->
    val = $(this).val()
    if !val || val.length == 0
      all_present = false
  if all_present == false
    $('.error').addClass('show-error')
    setTimeout (->
      $(".error").removeClass('show-error')
    ), 2000
  else
    
    $(".popup").addClass("animate-popup")
    # setTimeout (->
    #   $(".popup").removeClass("animate-popup")
    # ), 3000

    $form = $(this)
    data_str = $form.serialize()
    method = $form.attr("method")
    url = $form.attr("action")
    $.ajax({
      url: url
      type: "post"
      data: data_str
    })

