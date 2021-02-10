$(document).ready(function(){
	$("#btn_page_choice").click(function(){
		var selectValue = $("#page_choice option:selected").val();
		
		location.href = 'communityAdmin.community?page=1&pagerow=' + selectValue;
	});
	
	// 등록된 댓글
	$("#btn_page_choice_comment").click(function(){
		var selectValue = $("#page_choice option:selected").val();
		
		location.href = 'communityAdminComment.community?page=1&pagerow=' + selectValue;
	});
	
	// 등록된 신고 페이지
	$("#btn_page_choice_report").click(function(){
		var selectValue = $("#page_choice option:selected").val();
		
		location.href = 'communityAdminReport.community?page=1&pagerow=' + selectValue;
	});
	
});