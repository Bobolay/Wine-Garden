$(function() {
	$("#datepicker").datepicker({
      dateFormat: "dd.mm.yy",
      monthNames: [ "Січень", "Лютий", "Березень", "Квітень", "Травень", "Червень", "Липень", "Серпень", "Вересень", "Жовтень", "Листопад", "Грудень" ],
      dayNames: [ "Неділя", "Понеділок", "Вівторок", "Середа", "Четвер", "П'ятниця", "Субота" ],
      dayNamesMin: [ "Нд", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
      dayNamesShort: [ "Нд", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ],
      prevText: 'Попередній',
      nextText: 'Наступний',
      firstDay: 1,
		onSelect: function(){
			$input_wrap = $(this).closest(".input"),
			$input_wrap.addClass("not-empty")
		}
	});
});