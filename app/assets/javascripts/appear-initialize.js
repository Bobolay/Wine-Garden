$(function() {
  var $appeared = $('.dish-frame, .inner-text-right, .line-left');
  $appeared.appear();
  $(document.body).on('appear', function(e, $affected) {
    $affected.addClass('appeared')
  });
});