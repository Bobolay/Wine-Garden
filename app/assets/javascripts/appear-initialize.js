if(is_touch_screen || width < 640) {
    console.log("it works")
} else {
	$(function() {
	  var $appeared = $('.dish-frame, .inner-text-right, .line-left');
	  $appeared.appear();
	  $(document.body).on('appear', function(e, $affected) {
	    $affected.addClass('appeared')
	  });
	});
}