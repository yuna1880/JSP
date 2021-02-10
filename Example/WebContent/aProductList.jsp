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
	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-4">
				<h1 id="main_title" OnClick="location.href ='managerMain.jsp'">너네 집 Manager</h1>
			</div>

			<div id="main_top1_3" class="col-md-8">
				<div id="search">
					<i class="fas fa-search"></i>
				</div>
				<button id="write">글쓰기</button>
				<!-- <button>
					<i class="fas fa-search"></i>
				</button> -->
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
								<li><a href="member/logout.jsp">로그아웃</a></li>
							</ul>
						</nav>
					</div>
				</button>
			</div>
		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">회원관리</a></li>
						<li><a href="community/communityAdmin.community?page=1&pagerow=10">커뮤니티관리</a></li>
						<li id="menu_myshopping"><a href="#">스토어관리</a></li>
						<li><a href="consManager.cons">인테리어 시공 관리</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="aQuestionList.y">문의</a></li>
						<li id="Q_li"><a href="aProductList.y">상품</a></li>
						<li><a href="mOrderList.woo">주문배송내역</a></li>
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
			<div id="main_top1_2" class="col-sm-11 col-11">
				<h1 id="main_title"  OnClick="location.href ='managerMain.jsp'">너네 집 Manager</h1>
			</div>


		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">회원관리</a></li>
						<li><a
							href="http://localhost:8888/Team5/community/communityAdmin.community">커뮤니티관리</a></li>
						<li id="menu_myshopping"><a href="#">스토어관리</a></li>
						<li><a href="consManager.cons">인테리어 시공 관리</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="aQuestionList.y">문의</a></li>
						<li id="Q_li"><a href="aProductList.y">상품</a></li>
						<li><a href="mOrderList.woo">주문배송내역</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<hr>
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

			<h1 id="main_title" class="m_nav_menu_title"  OnClick="location.href ='managerMain.jsp'">너네 집</h1>
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
					<i class="fas fa-user"></i> 회원 관리
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4  OnClick="location.href ='#'" class="Hpointer">회원조회</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-comments"></i> 커뮤니티
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 Onclick="location.href ='community/communityAdmin.community'"
						class="Hpointer">들록된 게시글</h4>
					<h4
						Onclick="location.href ='community/communityAdminComment.community'"
						class="Hpointer">댓글 목록</h4>
					<h4
						Onclick="location.href ='community/communityAdminReport.community'"
						class="Hpointer">신고 현황</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-store"></i> 스토어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 OnClick="location.href ='aQuestionList.y'">문의 관리</h4>
					<h4 OnClick="location.href ='aProductList.y'">상품 관리</h4>
					<h4 OnClick="location.href ='mOrderList.woo'">주문 배송 내역</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-tools"></i> 인테리어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 OnClick="location.href ='consMain.jsp'" class="Hpointer">상담신청내역</h4>

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
		<div id="main_content_aProduct">
			<h1 id="main_content_qlist_h">상품 관리</h1>
			<br>
			<c:choose>
				<c:when test="${empty list || fn:length(list) ==0}">
					<h2 id="no_product">준비된 상품이 없습니다.</h2>
					<img src="https://media.giphy.com/media/y1ZBcOGOOtlpC/200_d.gif"
						id="loding_img">
					<br>
					<form action="aProductSetOk.y">
						<button type="submit" id="set_p_btn">상품 불러오기</button>
					</form>
				</c:when>
				<c:otherwise>
					<br>
					<br>
					<div class="row" id="main_content_aProduct_btn">
						<button class="col-md-3 col-sm-6 col-12" id="pManager1">상품등록</button>
						<button class="col-md-3 col-sm-6 col-12" id="pManager2">상품삭제</button>
						<button class="col-md-3 col-sm-6 col-12" id="pManager3">상품수정</button>
						<button class="col-md-3 col-sm-6 col-12" id="pManager4">이미지등록</button>
					</div>
					<div>
						<div id="pfiles">
							<br>

							<form name="frm" action="pfileUploadOk.y" method="post"
								enctype="Multipart/form-data">

								<h4>이미지 등록할 상품을 선택해주세요</h4>
								<br> <select name="pid">
									<c:forEach var="dto" items='${list }'>
										<option value="${dto.pid }">[${dto.pbrand }]
											${dto.pname }</option>
									</c:forEach>
								</select> <br>
								<hr>
								<br>

								<%-- 첨부파일 --%>
								<div>
									<h4>첨부파일을 추가해주세요</h4>
									<br>
									<div id='files'></div>

									<button type="button" id="btnAdd">추가</button>
									<input type="submit" value="등록" id="pSubmitbtn" />

								</div>
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
								<script>
									var i = 0;
									$("#btnAdd")
											.click(
													function() {
														$("#files")
																.append(
																		"<div><input type='file' name='upfile" + i + "'/><button type='button' class='product_delete_btn' onclick='$(this).parent().remove()'>삭제</button></div>");
														i++;
													});
								</script>
							</form>
						</div>
						<div id="aProduct_delete">
							<br>
							<h4>삭제할 상품을 선택해주세요</h4>
							<br>
							<form action="aProductDeleteOk.y" method="post"
								id="delete_form_${dto.pid }">
								<select name="pid">
									<c:forEach var="dto" items='${list }'>
										<option value="${dto.pid }">[${dto.pbrand }]
											${dto.pname }</option>
									</c:forEach>
								</select> <br> <br>
								<button type="submit">삭제</button>
							</form>


						</div>
						<div id="aProduct_update">
							<br>
							<h4>수정할 상품을 선택해 주세요</h4>
							<br> <select name="pid" id="sort">
								<c:forEach var="dto" items='${list }'>
									<option value="${dto.pid }">[${dto.pbrand }]
										${dto.pname } : ${dto.pprice }원</option>
								</c:forEach>
							</select> <br> <br>
							<c:forEach var="dto" items='${list }'>
								<form id="updateform_${dto.pid }" class="updateform"
									action="aProductUpdateOk.y">
									<h4>상품정보를 수정해주세요</h4>
									<input type="hidden" value="${dto.pid }" name="pid"> <br>
									상품이름 : <input type="text" name="pname" value="${dto.pname }"><br>
									상품가격 : <input type="text" name="pprice" value="${dto.pprice }"><br>
									상품브랜드 : <input type="text" name="pbrand" value="${dto.pbrand }"><br>
									<button type="submit">수정</button>
								</form>
							</c:forEach>

						</div>

						<div id="aProduct_set">
							<br>
							<h4>상품업데이트</h4>
							<br> <br> 
							<div>
							<img
								src="https://media.giphy.com/media/y1ZBcOGOOtlpC/200_d.gif"
								id="loding_img"></div>

							<form action="aProductSetOk.y">
								<button type="submit" id="set_p_btn">상품 불러오기</button>
							</form>

						</div>

					</div>

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