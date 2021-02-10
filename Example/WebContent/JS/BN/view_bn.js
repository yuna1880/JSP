$(document).ready(function () {
	/* view.jsp */
	// 키워드 값 받아오기
	var $btn_keyword_value = $('#btn_keyword_value').val();
	var $keywordHtml = "";
	
	var $keyword_length = $btn_keyword_value.split(',');
	
	// 마지막에 -1하는 이유는 키워드보다 콤마 하나가 더 많음!
	// 그래서 마지막 하나는 빈 내용이 들어 있음
	for(i = 0; i < $keyword_length.length - 1; i++) {
		$keywordHtml += "<li class='qna-detail__footer__keyword-list-item'>"
			+ $keyword_length[i] + "</li>";
	}
	$("#keyword_list_group").append($keywordHtml);

	
	// 라디오 값 추출하기
	$('.close_popup').click(function(){
		
		// 아니오 눌렀을때 신고되지 않기
		if(!confirm('정말로 신고하시겠습니까?')){
			alert('신고 취소를 선택하셨습니다');
			$(".dismiss_popup").trigger("click");
			return false;
		} else {	// 신고하기 버튼누르면 신고 접수가 완료됨
			// 신고 유형
			var reportType = $("input:radio[name=report_type]:checked").val();
			// 신고 게시글
			var no = $("#reportQno").val();
			// 신고 아이디
			var reportId = $("#reportID").val();
			
			// 신고페이지로 이동
			location.href="reportWriteOk.community?type=" + reportType + "&no=" + no + "&reportId=" + reportId;
		}
		
	});
	
	// 댓글을 정말 삭제할 것인가 물어보기
	$("#btn_comment_delete").click(function(){
		
		// 아니오 눌렀을때 삭제되지 않기
		if(!confirm('정말로 댓글을 삭제하시겠습니까?')){
			alert('댓글 삭제 취소를 선택하셨습니다');
			return false;
		}
		
		// 예 눌렀을 때 삭제 페이지로 가기
		var no = $("#reportQno").val();
		var cno = $("#cno_comment_value").val();
		
		// 삭제 페이지로 이동
		location.href = href="comentDeleteOk.community?Cno=" + cno + "&qno=" + no ;
		
	});
	
}); // end ready()

function chkDelete(no) {
	// 삭제 여부, 다시 확인하고 진행하기
	var message = confirm('정말로 게시글을 삭제하시겠습니까?');
	
	if(message) {
		location.href = "deleteOk.community?no=" + no;
	} else {
		alert('게시글 삭제 취소를 선택하셨습니다');
	}
}

//console.log()