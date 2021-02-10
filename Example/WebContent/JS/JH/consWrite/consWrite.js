$(document).ready(function() {
	$(".cons_header").click(
			function() {
				location.href = "main.jsp";
			} // end function
	) // end cons_header
	
	$(".cancel").click(
			function() {
				 window.history.back();
			} // end function
	) // end cons_header
}) // end JS
