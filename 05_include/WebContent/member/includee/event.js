function sel_all(frm) {
		frm.action = "selectAll.jsp";
		frm.submit();
	}
	function sel_one(frm) {
		frm.action = "selectOneID.jsp";
		frm.submit();
	}
	function add_go(frm) {
		//아이디값 입력여부 확인 (!! form 태그의 name으로 접근 가능!!)
		// 1) 데이터 자체가 입력이 안된 케이스 일때? (빈 문자열 or 스페이스만 있을때 !)
		if (frm.id.value.trim() == "") {
			alert("아이디 (id) 는 필수 항목입니다. \n 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action = "insertMember.jsp";
		frm.submit();
	}
	function del_go(frm) {
		//아이디값 입력여부 확인
		if (frm.id.value.trim() == "") {
			alert("아이디 (id) 는 필수 항목입니다. \n 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action = "deleteMember.jsp";
		frm.submit();
	}