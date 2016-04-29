$(function() {
  var $appeared = $('.appear');
  $appeared.appear();
  $(document.body).on('appear', function(e, $affected) {
    $affected.addClass('appeared')
  });
});