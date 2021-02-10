$(document).ready(function() {
	$('form').on('submit', function() {
		frm = document.forms["frm"];

		var reCstel = /^\d{3}-\d{3,4}-\d{4}$/;

		var csname = frm["csname"].value.trim();
		var cstel = frm["cstel"].value.trim()
		console.log(csname.length + "얼마입니까?");
		if (true) {
			if (csname == "") {
				alert("이름을 입력해주세요");
				frm["csname"].focus();
				return false;
			} else if (csname.length <= 2) {
				alert("이름을 정확히 입력해주세요");
				return false;
			}

			for (var i = 0; i < csname.length; i++) {

				var chk = csname.substring(i, i + 1);

				if (chk.match(/[0-9]|[a-z]|[A-Z]/)) {

					alert("이름을 정확히 입력해주세요");
					frm["csname"].focus();
					return false;

				} // end 숫자 영문

				if (chk.match(/([^가-힣\x20])/i)) {

					alert("이름을 정확히 입력해주세요");
					frm["csname"].focus();
					return false;

				} // end 자음사용

				if ($(".ctel").val() == " ") {

					alert("이름을 정확히 입력해주세요");
					frm["csname"].focus();
					return false;

				} // end 공백
				
				if (!reCstel.test(cstel)) {
					if (cstel == "") {
						alert("전화번호를 입력해주세요");
						frm["cstel"].focus();
						return false;
					}
					alert("전화번호형식에 맞춰 입력하세요");
					frm["cstel"].focus();
					return false;
				} else {
					alert("신청되었습니다.")
					return true;
				}
				
				alert("신청되었습니다.")
				return true;
			} // end for

		}
	}) // end function()

}) // end JS
