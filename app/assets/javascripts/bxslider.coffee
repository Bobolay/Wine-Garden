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
    pause: 6000
    auto: true
    easing: 'swing'
    infiniteLoop: true
    onSlideBefore: (element, oldIndex, newIndex)->
        change_slide(newIndex)

$(document).ready ->
    slider = $('.bxslider2').bxSlider
        controls: false
        mode: 'fade'
        pager: false
        infiniteLoop: true
        hideControlOnEnd: true
        speed: 500
        pause: 8000
        auto: true
        infiniteLoop: true
    $('.wine-arrow-left').click ->
      current = slider.getCurrentSlide()
      slider.goToPrevSlide(current) - 1
    $('.wine-arrow-right').click ->
      current = slider.getCurrentSlide()
      slider.goToNextSlide(current) + 1