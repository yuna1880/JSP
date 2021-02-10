<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cons.beans.*"%>

<%	
	
	if (session.getAttribute("id") == null) {
%>
<script>
	alert("로그인이필요한 페이지 입니다.")
	location.href = "sign_in.jsp"
</script>
<%
	}
%>

<!-- GET방식으로 Controller로 넘겨줌 Cno 값을 이용해서 컬럼값을 가져오는 소스코드 -->
<%
	// Controller 로부터 결과 데이터 받음
	comDTO[] arr = (comDTO[]) request.getAttribute("list");
	int cno = Integer.parseInt(request.getParameter("cno"));
	// System.out.print(uid);
%>

<%
	if (arr == null || arr.length == 0) {
%>
<script>
	alert("해당 정보가 삭제되거나 없습니다");
	history.back();
</script>
<%
	return; // 더이상 JSP 프로세싱 하지 않고 종료
	} // end if
%>
<%
	String cname = arr[0].getCname();
	String cadr = arr[0].getCadr();
	String ctel = arr[0].getCtel();
	String ccategory = arr[0].getCcategory();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<!-- Google 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">

<!-- CSS 링크 -->
<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/JH/consWrite.css" type="text/css">

<!-- JS 링크 -->
<script src="JS/JH/consWrite/consWrite.js"></script>
<script src="JS/JH/consWrite/consWriteValidation.js"></script>


<title>너네 집</title>
</head>
<body>
	<!-- 로고부분 -->
	<header id="cons_header">
		<div class="cons_header">
			<div id="cons_logo"></div>
			<h1 id="cons_title">너네 집</h1>
		</div>
	</header>


	<!-- post방식  action="consWriteOk.cons" -->
	<form name="frm" method="post" action="consWriteOk.cons"
		class="searchForm">
		<section id="cons_section">
			<article id="cons_section_header">
				<h1 class="consultation-form__header__title">
					<img
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/157924932272521634.jpg?gif=1&amp;w=40&amp;h=40&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/157924932272521634.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/157924932272521634.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/157924932272521634.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 3x"
						alt="">인테리온 Interion<span
						class="tooltip consultation-form__header__title__badge"><svg
							class="icon" width="18" height="18" viewBox="0 0 18 18"
							preserveAspectRatio="xMidYMid meet">
						<g fill="none">
						<path fill="#1778BA"
								d="M9 16.2l-2.78 1.36-1.45-2.73-3.05-.54.43-3.06L0 9l2.15-2.23-.43-3.06 3.05-.54L6.22.44 9 1.8 11.78.44l1.45 2.73 3.05.54-.43 3.06L18 9l-2.15 2.23.43 3.06-3.05.54-1.45 2.73z"></path>
						<path fill="#FFF"
								d="M7.77 10.52l4.13-4.26.83.81-4.92 5.08-2.9-2.7.8-.85z"></path></g></svg></span>
				</h1>
				<div class="cateEx">해당 전문가님의 시공분야는 아래와 같습니다.</div>
				<div class="ccategory">
					<div><%=ccategory%></div>
				</div>
			</article>

			<article id="cons_section_comInfo">
				<div class="areaEx">시공할 지역을 알려주세요</div>
				<!--  selected 지역선택메뉴  -->
				<select id="consArea" name="CompanyArea">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="부산">부산</option>
					<option value="기타">기타</option>
				</select>
			</article>

			<article id="cons_section_userInfo">
				<div class="userNameInfo">고객님의 이름을 알려주세요.</div>
				<input type="text" name="csname" placeholder="집순이"
					class="userNameInput"></input>
				<div class="userTelInfo">
					상담받을 전화번호를 알려주세요.
					<div class="userTelHint">아래 형식에 맞추어 전화번호를 적어주세요</div>
					<input type="text" name="cstel" placeholder="ex) 010-1234-5678" class="ctel">
				</div>
				<input type="hidden" value="<%=cno%>" name="cno"> <input
					type="submit" class="submit" value="SUBMIT"> <input
					type="button" class="cancel" value="CANCEL">
			</article>
		</section>
	</form>


	<!-- 바닥입니다. -->
	<footer id="main_footer">
		<div id="main_footer_content">
			<div id="main_footer_icon">
				<i class="fab fa-apple"></i> <i class="fab fa-google-play"></i> <i
					class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i>
			</div>
			<h1 id="main_footer_h0">고객센터></h1>
			<h1 id="main_footer_h1">1670-0876</h1>
			<h1 id="main_footer_h2">평일 10:00~17:00 (점심시간 12:00~13:00 /
				주말&공휴일 제외)</h1>

			<h1 id="main_footer_h3">브랜드 스토리 회사소개 채용정보 이용약관 개인정보처리방침 고객센터 고객의
				소리 전문가 등록사업자 구매회원제휴/광고 문의입점신청 문의</h1>

			<h1 id="main_footer_h4">상호명(주)버킷플레이스이메일(고객문의)
				help@bucketplace.net (제휴문의)
				contact@bucketplace.net대표이사이승재사업자등록번호119-86-91245통신판매업신고번호제2018-서울서초-0580호주소서울특별시
				서초구 서초대로 398 플래티넘타워 19층</h1>

			<h1 id="main_footer_h5">NICEPAY 안전거래 서비스고객님의 안전거래를 위해 현금 결제 시,
				저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다. 가입 확인</h1>

			<h1 id="main_footer_h6">Copyright © 2014 - 2020 by Bucketplace,
				Inc. All rights reserved</h1>
		</div>
	</footer>


</body>
</html>