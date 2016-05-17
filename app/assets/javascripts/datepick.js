$(function() {
	$("#datepicker").datepicker({
		onSelect: function(){
			$input_wrap = $(this).closest(".input")
			$input_wrap.addClass("not-empty")
		}
	});
});