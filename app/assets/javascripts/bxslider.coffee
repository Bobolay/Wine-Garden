change_slide = (index)->

$("body").on "click", ".squares a", ()->
    $button = (this)
    index = $button.index()
    change_slide()

$(document).ready ->
  $('.bxslider').bxSlider
    pagerCustom: '#bx-pager'
    controls: false
    infiniteLoop: false
    hideControlOnEnd: true
    speed: 1000
    pause: 10000
    auto: true
    infiniteLoop: true
    onSlideBefore: (element, oldIndex, newIndex)->
        change_slide(newIndex)