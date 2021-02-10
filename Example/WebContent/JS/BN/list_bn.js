$(document).ready(function () {
	/* list.jsp */
	var $list_value = $('#list_Keyword').val();
	var $list_heml = "";
	

	var $list_value_split = $list_value.split(',');
	
	for(i = 0; i < $list_value_split.length - 1; i++) {
		$list_heml += "<li class='keyword-item questions-item__footer__tags__tag' role='button'>"
			+ $list_value_split[i] + "</li>";
	}
	$(".questions-item__footer__tags").append($list_heml);
	
}); // end ready()

//console.log()