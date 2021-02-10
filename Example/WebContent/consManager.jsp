<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cons.beans.*"%>

<%
	int curPage = 0;
	int totalPage = 0;
	// Controller 로부터 결과 데이터 받음.
	consDTO[] arr = (consDTO[]) request.getAttribute("list");
	if ((Integer) request.getAttribute("curPage") != null) {
		curPage = (Integer) request.getAttribute("curPage");
	}
	if ((Integer) request.getAttribute("totalPage") != null) {
		totalPage = (Integer) request.getAttribute("totalPage");
	}
	int writePages = 10;
%>
<!DOCTYPE html>
<html>
<head>

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

<!-- 로고 푸터 css -->
<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<title>너네 집</title>
</head>

<!-- 본문 JS -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript" src="JS/yj.js"></script>
<script src="JS/JH/consManager/consManager.js"></script>

<!-- 본문 css -->
<link rel="stylesheet" href="CSS/JH/consManager.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">

<body>
	<header id="manageMain_header">

		<%
			if (session.getAttribute("id") != null) {
		%>
		<h1 class="col-md-12 admin_title" id="m">
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

		<h1 id="manager_logout" class="Hpointer"
			OnClick="location.href ='member/logout.jsp'">log out</h1>
	</header>


	<!--  action="consCsnoSelect.cons" -->
	<article id="consManager">
		<section id="searchMenu">
			<div>
				<form class="searchForm" method="post">
					<select id="searchSelect" name="valueName">
						<option value="csno">번호</option>
						<option value="csuid">유저아이디</option>
						<option value="csname">유저이름</option>
						<option value="cname">업체명</option>
						<option value="cstel">전화번호</option>
						<option value="csarea">시공지역</option>
					</select> <input type="text" class="searchInput" name="value"> <input
						type="submit" value="검색" class="searchBtn">
				</form>
			</div>
			<div id="selectAll">전체보기</div>
		</section>


		<!-- 본문입니다. -->
		<%
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
		%>
		<section class="consData">
			<form action="consUpdateOk.cons" method="post" class="Info">
				<div class="cname">
					업체명 :
					<%=arr[i].getCname()%></div>
				<div class="csno">
					신청순서 :
					<%=arr[i].getCsno()%></div>
				<div class="csno">
					신청아이디 :
					<%=arr[i].getCsuid()%></div>
				<div class="consInfo csname">
					신청이름 :
					<%=arr[i].getCsname()%></div>
				<div class="consInfo csarea">
					시공지역 :
					<%=arr[i].getCsarea()%>
				</div>
				<div class="consInfo cstel">
					전화번호 :
					<%=arr[i].getCstel()%></div>
				<!------------------------------------------------------------------------------------------------------>
				<input class="consUpdate csno01" style="display: none;" name="csno"
					value="<%=arr[i].getCsno()%>"> <input
					class="consUpdate csno01" style="display: none;" name="csuid"
					value="<%=arr[i].getCsuid()%>" placeholder="신청아이디"> <input
					class="consUpdate" style="display: none;" name="csname"
					value="<%=arr[i].getCsname()%>" placeholder="신청이름"> <input
					class="consUpdate" style="display: none;" name="csarea"
					value="<%=arr[i].getCsarea()%>" placeholder="시공지역"> <input
					class="consUpdate" style="display: none;" name="cstel"
					value="<%=arr[i].getCstel()%>" placeholder="신청번호"> <input
					type="button" class="update" value="수정"
					formaction="consUpdateOk.cons"> <input type="submit"
					class="delete" value="삭제" formaction="consDeleteOk.cons"> <input
					type="submit" class="updateComplete" value="완료"> <input
					type="button" class="cancel" value="취소">

			</form>
			<br> <br>
			<%
				} // end for
				} else {
			%>
			<div style="line-height: 800px; vertical-align: middle;">
				<div style="text-align: center;">존재하는 상담신청 정보가 없습니다.</div>
			</div>
			<%
				} // end if

				if (writePages != 0 && curPage != 0) {
			%>
			<div class="pagination">
				<%-- 페이징 --%>
				<jsp:include page="consPagination.jsp">
					<jsp:param value="<%=writePages%>" name="writePages" />
					<jsp:param value="<%=totalPage%>" name="totalPage" />
					<jsp:param value="<%=curPage%>" name="curPage" />
				</jsp:include>
			</div>
			<%
				}
			%>
		</section>
	</article>



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