$(function() {
	$("#datepicker").datepicker({
        dateFormat: "dd.mm.yy",
		onSelect: function(){
			$input_wrap = $(this).closest(".input"),
			$input_wrap.addClass("not-empty")
		}
	});
});