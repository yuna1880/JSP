$(document).ready(function() {
	$('#figure').on('change', function() {
		var selectOption = document.getElementById("figure");
		selectOption = selectOption.options[selectOption.selectedIndex].value;
		var res = $('#s_price').text().split("원")[0].trim();
		var p = parseInt(res) * selectOption;
		a = makeComma(p);
		$('#total').text("주문금액:    " + a + "원")

		$("#cashBtn").click(function() {
			if ($('#pquid').val() == "null") {
				alert("로그인이필요한 페이지 입니다.")
				location.href = "sign_in.jsp"
			} else {
				$('#id01').show();
				$('#pc_price').text("결제 금액: " + p + "원");
				$('#result_price').val(p);
				$('#resutlt_pid').val();
				$('#result_cnt').val(selectOption);
			}
		}); // 바로구매 클릭시

		$("#check_module").click(function() {

			IMP.init('iamport');
			var msg;

			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				amount : 100,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';

				} else {
					var msg = '결제에 완료하였습니다.\n 구매완료 버튼 눌러주세요';
				}
				alert(msg);
			});

		});
	});

	$("#detail_question_2").click(function() {
		if ($('#pquid').val() == "null") {
			alert("로그인이필요한 페이지 입니다.")
			location.href = "sign_in.jsp"
		}
	}); // 바로구매 클릭시

	$('#sort').on('change', function() {
		var select = document.getElementById("sort");
		selectt = select.options[select.selectedIndex].value;

		if (selectt == '1') {
			$('.status_code_' + '1').show();
			$('.status_code_' + '0').hide();
		} else if (selectt == '0') {

			$('.status_code_' + '0').show();
			$('.status_code_' + '1').hide();
		} else {
			$('.status_code_' + '0').show();
			$('.status_code_' + '1').show();
		}

	});

	$("#close, #cancelbtn").click(function() {
		$('#id01').hide();

	}); // 닫기 , 캔슬 , 구매버튼(바꿔야함) 클릭시!

	$("#reg").submit(function() {
		var enCheck = /[^0-9]$/;
		var pcaddressnum = $("#pcaddressnum").val();
		var pccardnum = $("#pccardnum").val();

		if ($("#pcaddressnum").val() == "") {
			alert("우편번호 입력해주세요.");
			return false;
		} else if (enCheck.test(pcaddressnum)) {
			alert("5자리 우편번호만 입력해주세요.");
			return false;
		} else if ($("#pcaddress").val() == "") {
			alert("주소를 입력해주세요.");
			return false;
		} else if ($("#pcaddress2").val() == "") {
			alert("상세주소를 입력해주세요.");
			return false;
		} else if (enCheck.val(pccardnum)) {
			alert("숫자만 입력해주세요.");
			return false;
		} else if ($("#pccardnum").val() == "") {
			alert("-없이  숫자만 입력해주세요.");
			return false;
		} else {

			return true;
		}

	});

	// 배송 메모 수정
	$('div[id^="u_modify_input_"]').hide();

	$('button[id^="u_modify_2_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).show();
	});

	$('button[id^="u_modify_1_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).hide();
	});
	$('button[id^="u_modify_3_"]').click(function() {
		var id = $(this).attr('id').split("_")[3];
		$('#u_modify_input_' + id).hide();
	});
	// 배송 메모 수정 끝

}); // Main document end

function makeComma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

};

// 관리자삭제모
function chkDelete(pid) {
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if (r) {
		location.href = 'mOrderDeleteOk.woo?pid=' + pid;
	}
	;
};