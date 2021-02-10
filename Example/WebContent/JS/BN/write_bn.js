$(document).ready(function () {
	/* write.jsp */
	// 제목 에러메시지 띄우기
	$("#question_title").keyup(function(){
		// 7자 미만 에러 메시지
		if($(this).val().length < 7) {
			$('#error1').css('display', 'block');
			$('.form-control').css('border', '1px solid red');
		}
		// 7자 이상, 본래의 모습으로
		if($(this).val().length >= 7) {
			$('#error1').css('display', 'none');
			$('.form-control').css('border', '1px solid #ced4da');
		}
	});
	
	// 키워드 1개 이상 선택하도록 에러 메시지 노출
	$('#error2').css('display', 'block');
	
	// Hint에서 문의사항 텍스트로 변경하기
	$('.question-form__body__content__placeholder').click(function() {
		$('.question-form__body__content__placeholder').hide();
		$('.question-form__body__content__placeholder__cs').hide();
		$('.question-form__body__content__input').show();
		$('#error3').css('display', 'none');
		
		// 포커스일 때도 실행될 수 있도록 문구 추가
		$('.question-form__body__content__input').focus();
	});
	
	// 텍스트 박스에 글씨를 작성했는가 확인하기
	$(".question-form__body__content__input").focusout(function() {
		var count = $.trim($(this).text()).length;
		var txt = $.trim($(this).text());

		if(count == 0){
			$('.question-form__body__content__placeholder').show();
			$('.question-form__body__content__placeholder__cs').show();
			$('.question-form__body__content__input').hide();
			$('.question-form__body__content__placeholder').css('border', '1px solid red');
		}
		
		// 텍스트 10자 미만 경고창
		if(count < 10) {
			$('#error3').css('display', 'block');
			$('.question-form__body__content__input').css('border', '1px solid red');
		} else {
			$('#error3').css('display', 'none');
			$('.question-form__body__content__input').css('border', '1px solid #ced4da');
		}
		
		// 텍스트 박스에 글씨를 작성내용 저장, 리퀘스트하기 위해 저장함
		$("#content_value").attr('value', txt);
	});
	
	
	// 모델 버튼 활성화
	$(".form-che").click(function(){
		
		var cheLength = $("input[class='form-che']:checked").length;
		// 0개 이상일때 활성화
		if(cheLength > 0) {
			$('#btnCommit').prop('disabled', false);
		} 
		
		// 0개 일때 비활성화
		if(cheLength == 0){
			$('#btnCommit').prop('disabled', true);
		}
		
		// 5개 이상은 경고 팝업
		// 5개 이상 체크박스되면 자동 해지
		if(cheLength > 5){
			alert('키워드는 최대 5개까지 선택 가능합니다.');
			$(this).prop('checked', false);
		}
		
	}); // end 모델버튼 활성화
	
	
	// 선택 완료 버튼
	$("#btnCommit").click(function(){
		// 기존에 혹시 남아 있는 체크리스트 <li> 태그를 삭제
		$(".template").remove();
		
		var arrParam = new Array();
		var cheLength = $("input[class='form-che']:checked").length;
		var keywordHtml = "";
		var keyword = "";
		var cnt = 0;

		// checked 값 arrParam에 저장
		var isCheck = false;
		$("input[class='form-che']:checked").each(function(){
			keywordHtml += "<li class='template question-form__keywords__keyword keyword-item'>"
				+ "<button class='btn_keywords' data-toggle='modal' data-target='#modal-tag-select' type='button'>" 
				+ $(this).val() + "</button></li>";
			// java로 키워드 넘기기 위한 값 보내기 위한 값 저장
			keyword += $(this).val() + ",";
			// 키워드 값 있을 때만 .template의 display inline 이어야 함
			isCheck = true;
		});
		if(isCheck) {
			$('.template').css('display', 'inline');
		}
		$(".question-form__keywords__list").append(keywordHtml);
		// 1개 이상일때 키워드를 입력해주세요 띄우기
		if(cheLength > 0) {
			$(".question-form__keywords__keyword__name").css('display', 'inline');
			$(".question-form__keywords__keyword__name--hint").css('display', 'none');
		}
		
		// 5개 이상일때는 둘다 없애기
		if(cheLength >= 5) {
			$(".question-form__keywords__keyword--new").css('display', 'none');
			$(".question-form__keywords__keyword__name").css('display', 'none');
			$(".question-form__keywords__keyword__name--hint").css('display', 'none');
		}
		
        // btnCommit 버튼 클릭시 조건 맞으면 모달 창 종료
		if(cheLength > 0 && cheLength <= 5){
			$(".question-form__keywords__keyword__name")
			$(".btn-dismiss").trigger("click");
		}
		
		// 선택되어 있는 만큼 키워드의 수 변경
		$('.question-form__keywords__counter__current').text(cheLength);
		
		// 키워드 1개 이상 선택하면 에러메시지 노출 취소
		if(cheLength != 0) {
			$('#error2').css('display', 'none');
		}
		
		// 아까 저장했던 keyword값 write.jsp로 보내기
		$("#keyword_value").attr('value', keyword);
		
	}); // end 배열 이용 체크박스
	
	// 최종적으로 write 버튼 클릭했을때 유효성 검사
	$('#btn_write_form').click(function() {
		// 7자 미만 불가
		if($("#question_title").val().length < 7) {
			alert('필수 모든 항목을 입력해주세요(제목)');
			$("#question_title").focus();
			return false;
		}
		
		// 택스트 10자 미만 불가
		if(($.trim($(".question-form__body__content__input").text()).length) < 10) {
			alert('필수 모든 항목을 입력해주세요(내용)');
			$(".question-form__body__content__input").focus();
			$('.question-form__body__content__placeholder').css('border', '1px solid red');
			return false;
		}
		
		// 키워드가 한개 미만 불가
		if($("input[class='form-che']:checked").length < 1) {
			alert('필수 모든 항목을 입력해주세요(키워드)');
			$(".question-form__keywords__keyword--new").focus();
			return false;
		}
	
	});
	
	
}); // end ready()


//console.log()