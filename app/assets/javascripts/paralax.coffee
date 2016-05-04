$banner_title = $(".banner-container:not(.disable-scroll)")
if $banner_title.length
  ratio = 0.6
  current_translate = $banner_title.data("translateY") 
  if current_translate
    current_translate = parseFloat(current_translate)
  else
    current_translate = 0
  future_translate = current_translate + delta * ratio
  future_translate = Math.round(future_translate)

  $banner_title.data("translateY", future_translate.toString())
  $banner_title.css("transform", "translateY(#{future_translate}px)")