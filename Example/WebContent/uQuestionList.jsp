<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<!-- font-family: 'Do Hyeon', sans-serif;
font-family: 'Jua', sans-serif; -->


<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<!-- <link rel="stylesheet" href="CSS/logo_menu.css" type="text/css"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">



<script type="text/javascript" src="JS/yj.js"></script>




<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>

	<%
		if (session.getAttribute("id") == null) {
	%>
	<script>
		alert("로그인이필요한 페이지 입니다.")
		location.href = "MemberLogin.me"
	</script>
	<%
		}
	%>

	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-2">
				<h1 id="main_title">너네 집</h1>
			</div>
			<div id="main_top1_2" class="col-md-3">
				<nav>
					<ul>
						<li><a href="community/write.community" id="main_a_comunity">커뮤니티</a></li>
						<li><a href="storeMain.y" id="main_a_store">스토어</a></li>
						<li><a href="consMain.jsp" id="main_a_cons">인테리어시공</a></li>
					</ul>
				</nav>
			</div>
			<div id="main_top1_3" class="col-md-7">
				<div id="search">
					<i class="fas fa-search"></i>
				</div>

				<button id="write"
					onclick="location.href='community/communityMain.jsp'">글쓰기</button>

				<!-- <button>
					<i class="fas fa-search"></i>
				</button> --->
				<%
					if (session.getAttribute("id") != null) {
				%>

				<button>
					<i class="far fa-bookmark"></i>
				</button>
				<button>
					<i class="far fa-bell"></i>
				</button>
				<button>
					<i class="fas fa-shopping-cart"></i>
				</button>
				<button id="main_user_menu_icon">
					<i class="far fa-user"></i>
					<div id="main_user_menu">
						<nav style="padding: 0px;">
							<ul class="menu">
								<li><a><%=session.getAttribute("id")%> 님</a></li>
								<li><a href="MemberModifyAction_1.me">마이페이지</a></li>
								<li><a href="uOrderList.woo">나의쇼핑</a></li>
								<li><a href="member/logout.jsp">로그아웃</a></li>
							</ul>
						</nav>
					</div>
				</button>
				<%
					} else {
				%>
				<button>
					<i class="fas fa-shopping-cart"></i>
				</button>
				<!-- <a href="MemberLogin.me">로그인 </a> | <a href="MemberJoin.me">회원가입</a> -->
				<a href="sign_in.jsp">로그인 </a> | <a href="MemberJoin.me">회원가입</a>
				<%
					}
				%>



			</div>
		</div>

		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">프로필</a></li>
						<li id="menu_myshopping"><a href="#">나의 쇼핑</a></li>
						<li><a href="#">나의 리뷰</a></li>
						<li><a href="#">설정</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">

						<li><a href="uOrderList.woo">주문배송내역 조회</a></li>
						<li><a href="#">상품 스크랩북</a></li>
						<li id="Q_li"><a href="uQuestionList.y">상품문의내역</a></li>
						<li><a href="#">포인트</a></li>
						<li><a href="#">고객센터 </a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
	</header>

	<header style="padding: 0px;" class="col-md-12" id="main_header_m">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-sm-1 col-1">

				<button id="main_bar_btn">
					<i class="fas fa-bars"></i>
				</button>
			</div>
			<div id="main_top1_2" class="col-sm-5 col-5">
				<h1 id="main_title">너네 집</h1>
			</div>

			<div id="main_top1_3" class="col-sm-6 col-6">

				<button id="write"
					onclick="location.href='community/communityMain.jsp'">글쓰기
				</button>
				<button id="search">
					<i class="fas fa-search"></i>
				</button>

				<button>
					<i class="fas fa-shopping-cart"></i>
				</button>
			</div>
		</div>
		<!-- 
		<hr>
		<div id="main_top2" class="row">
			<div class="col-sm-12 col-12" id="main_top2-1">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">스토어홈</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">신혼가구</a></li>
						<li><a href="#">베스트</a></li>
						<li><a href="#">특가</a></li>
						<li><a href="#">여름패브릭</a></li>
						<li><a href="#">여름가전</a></li>
						<li><a href="#">기획전</a></li>
					</ul>
				</nav>
			</div>


		</div>
		<hr> -->
		<div id="m_nav_menu">
			<button id="m_menu_close">
				<i class="far fa-times-circle"></i>
			</button>

			<h1 id="main_title" class="m_nav_menu_title">너네 집</h1>
			<%
				if (session.getAttribute("id") != null) {
			%>
			<h1><%=session.getAttribute("id")%>
				님
			</h1>
			<br>
			<button id="m_menu_logout">로그아웃</button>
			<%
				} else {
			%>
			<button id="m_menu_login" OnClick="location.href ='sign_in.jsp'">로그인</button>
			<button id="m_menu_join" OnClick="location.href ='MemberJoin.me'">회원가입</button>

			<%
				}
			%>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-comments"></i> 커뮤니티
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4>홈</h4>
					<h4 Onclick="location.href='community/list.community?page=1'"
						class="Hpointer">질문과 답변</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-store"></i> 스토어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4>카테고리</h4>
					<h4 OnClick="location.href ='storeMain.y'">스토어홈</h4>
					<h4>베스트</h4>
					<h4>특가</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-tools"></i> 인테리어 시공
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 OnClick="location.href ='consMain.jsp'" class="Hpointer">시공
						홈</h4>
					<h4>견적계산</h4>
					<h4>시공스토어</h4>
					<h4>전문가 찾기</h4>
				</div>
			</div>
			<div class="m_nav_menu" id="m_nav_menu_bottom">
				<h4>마이페이지</h4>
				<h4 class="Hpointer" OnClick="location.href ='uOrderList.woo'">나의쇼핑</h4>
				<h4>스크랩북</h4>
				<h4>질문하기</h4>

			</div>
		</div>
	</header>





	<!--내용부분입니다.  -->
	<div id="main_content">
		<div id="main_content_qlist">
			<h1 id="main_content_qlist_h">상품문의내역</h1>
			<c:choose>
				<c:when test="${empty Qlist || fn:length(Qlist) ==0}">
					<div id="main_qlist">
						<h1>문의한 내역이 없습니다.</h1>

					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items='${Qlist }'>
						<div id="main_qlist">
							<%-- <h3 id = "A_status_${dto.pqid}" class ="A_status" >답변예정</h3> --%>
							
							<div class="row" class="pbrand_uQ">
								<h3 id="pinfo" class="col-md-10  col-sm-12 col-12">[${dto.pbrand }]
									${dto.pname }</h3>
							<c:if test="${dto.pqanswer!='답변준비중 입니다.' }">
									<a id="ql_status_u"  class="col-md-2  col-sm-4 col-4" 
										style="color: #fff; background-color: rgb(53, 197, 240);margin: 0px">
										답변완료 </a>
								</c:if>
								<c:if test="${dto.pqanswer=='답변준비중 입니다.' }">
									<a id="ql_status_u" class="col-md-2  col-sm-4 col-4" 
										style="color: rgb(53, 197, 240); background-color: #fff; margin: 0px;border: 1px solid rgb(53, 197, 240)">
										답변대기 </a>
								</c:if>
								
								<h3 id="pquid" class="col-md-8">${dto.pquid }|
									${dto.pqregdate }</h3>
							</div>
							<br> <br>
							<h1 id="Q_mark">Q.</h1>
							<h3 class="pqcontent">${dto.pqcontent }</h3>
							<br>
							<h1 id="A_mark">A. </h1>
							<h3 class="pqanswer">${dto.pqanswer }</h3>
							<br>
							<form action="QuestionDeleteOk.y" method="post">
								<input type="hidden" name="pqid" value="${dto.pqid}">
								<button class="main_qlist_delete"
									id="main_qlist_delete_${dto.pqid}" type="submit">삭제 하기</button>
							</form>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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