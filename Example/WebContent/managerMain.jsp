

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">




<!-- MaxCDN 사용 -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- Google 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Google 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">



<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">






<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript" src="JS/yj.js"></script>
<body>

	<header id="manageMain_header">

		<%
			if (session.getAttribute("id") != null) {
		%>

		<h1 class="col-md-12 admin_title" id="main_title">

			<img
				src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">
			너네 집


		</h1>


		<%
			} else {
		%>
		<script>
			alert("로그인이 필요한 페이지 입니다.");
			location.href = "sign_in.jsp";
		</script>
		<%
			}
		%>

		<h1 id="manager_logout" class="Hpointer" OnClick="location.href ='member/logout.jsp'">log out</h1>
	</header>
	<!--내용부분입니다.  -->
	<div id="main_content" class="row main_content_manager">

		<h1 class="col-md-12"><%=session.getAttribute("id")%>
			님 안녕하세요. 관리자 페이지입니다
		</h1>

		<div id="main_content_managerMenu" class="row col-md-12">
			<div class="col-md-3 col-sm-6 col-6">
				<button id="manager_btn_1" onclick="location.href='list.ad'">
					<i class="fas fa-users"></i>
				</button>
				<h2>회원 관리</h2>
			</div>
			<div class="col-md-3 col-sm-6 col-6">
				<button id="manager_btn_2"
					onclick="location.href='community/communityAdmin.community?page=1&pagerow=10'">
					<i class="fas fa-comments"></i>
				</button>
				<h2>커뮤니티 관리</h2>
			</div>
			<div class="col-md-3 col-sm-6 col-6">
				<button id="manager_btn_3"
					onclick="location.href= 'aQuestionList.y'">
					<i class="fas fa-store"></i>
				</button>
				<h2>스토어 관리</h2>
			</div>
			<div class="col-md-3 col-sm-6 col-6">
				<button id="manager_btn_4"
					onclick="location.href='consManager.cons'">
					<i class="fas fa-tools"></i>
				</button>
				<h2>인테리어 시공 관리</h2>
			</div>

		</div>
	</div>



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