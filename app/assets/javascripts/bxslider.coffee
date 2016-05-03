change_slide = (index)->

$("body").on "click", ".squares a", ()->
    $button = (this)
    index = $button.index()
    change_slide()

$(document).ready ->
  $('.bxslider').bxSlider
    pagerCustom: '#bx-pager'
    controls: false
    infiniteLoop: true
    hideControlOnEnd: true
    speed: 1000
    pause: 5000
    auto: true
    easing: 'swing'
    infiniteLoop: true
    onSlideBefore: (element, oldIndex, newIndex)->
        change_slide(newIndex)

$(document).ready ->
  $('.bxslider2').bxSlider
    controls: false
    pager: false
    infiniteLoop: true
    hideControlOnEnd: true
    speed: 1000
    pause: 5000
    auto: true
    infiniteLoop: true
    nextSelector: '.wine-arrow-left'
    prevSelector: '.wine-arrow-right'