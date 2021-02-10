<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 본문 css -->
<link rel="stylesheet" href="CSS/JH/consMain.css" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">






<title>너네 집</title>
</head>

<script type="text/javascript">
	$(document).on('click', '.btnCons', function() {
		// console.log(csuid);
		//			console.log($(this).parent().children('.comNo').text().trim());
		//			alert('로그인 했슴다.');
		var str = $(this).parent().children('.comNo').text().trim();
		location.href = "consWrite.cons?cno=" + str;
	});
</script>

<!-- 본문 JS -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript" src="JS/yj.js"></script>
<script src="JS/JH/consMain/consMain.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<body>
	<!-- 여기부터  복사-->
	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-2">
				<h1 id="main_title">너네 집</h1>
			</div>
			<div id="main_top1_2" class="col-md-3">
				<nav>
					<ul>
						<li><a href="#" id="main_a_comunity">커뮤니티</a></li>
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
			<div class="col-md-9" id="main_top2-1">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="storeMain.y">스토어홈</a></li>
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
			<div class="col-md-9" id="main_top2-2">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="main.team">홈</a></li>
						<li><a href="community/list.community?page=1">질문과답변</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-md-9" id="main_top2-3">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="consMain.jsp">시공홈</a></li>
						<li><a href="#">견적계산</a></li>
						<li><a href="#">전문가찾기</a></li>
						<li><a href="#">시공스토어</a></li>
						<li><a href="#">방산시장</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-md-3 col-sm-offset-0">
				<button id="main_top2_app"></button>
				<a href="#">앱 다운로드</a>
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
			<div id="main_top1_2" class="col-sm-3 col-3">
				<div style="width: 85px">
					<h1 id="main_title">너네 집</h1>
				</div>
			</div>

			<div id="main_top1_3" class="col-sm-8 col-8">

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
		<hr>
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
			<div class="m_nav_menu store">
				<h1 class="Hpointer">
					<i class="fas fa-store"></i> 스토어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 class="categoryStore">카테고리</h4>
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

	<!-- 메인입니다. -->
	<section style="position: relative;">
		<article id="consMenu">
			<div id="area">
				<!--  selected 지역선택메뉴  -->
				<select id="consArea" name="Company">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="부산">부산</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div id="category">
				<div class="category">
					<img class="cateImg cate01"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487641227160933.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487641227160933.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487641227160933.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487641227160933.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>도배</div>
				</div>
				<div class="category">
					<img class="cateImg cate02"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644545760381.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644545760381.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644545760381.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644545760381.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>장판</div>
				</div>
				<div class="category">
					<img class="cateImg cate03"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487643983545025.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487643983545025.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487643983545025.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487643983545025.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>시트필름</div>
				</div>
				<div class="category">
					<img class="cateImg cate04"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644245312359.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644245312359.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644245312359.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487644245312359.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>욕실</div>
				</div>
				<div class="category">
					<img class="cateImg cate05"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487659846222130.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487659846222130.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487659846222130.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487659846222130.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>주방</div>
				</div>
				<div class="category">
					<img class="cateImg cate06"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660098535429.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660098535429.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660098535429.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660098535429.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>타일</div>
				</div>
				<div class="category">
					<img class="cateImg cate07"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642300102400.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642300102400.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642300102400.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642300102400.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>도어</div>
				</div>
				<div class="category">
					<img class="cateImg cate08"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642521502350.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642521502350.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642521502350.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642521502350.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>마루</div>
				</div>
				<div class="category">
					<img class="cateImg cate09"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660352228893.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660352228893.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660352228893.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487660352228893.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>페인트</div>
				</div>
				<div class="category">
					<img class="cateImg cate10"
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642805755493.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
						srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642805755493.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642805755493.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/158487642805755493.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 3x">
					<div>목공</div>
				</div>
			</div>
			<div class="mLeft" onclick="moveScrollLeft()"></div>
			<div class="mRight" onclick="moveScrollRight()"></div>
		</article>
		<article id="consList"></article>
		<div id="ex">
			<div class="ex">지역을 선택한 후 카테고리를 눌러 주세요~</div>
		</div>

		<%-- 페이징 --%>
		<div class="center">
			<ul class="pagination" id="pagination">

			</ul>
		</div>
	</section>


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