<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %>

<%
	//Controller로부터 결과 데이터 받음
	WriteDTO[] arr = (WriteDTO[])request.getAttribute("view");
	CommentDTO[] arr2 = (CommentDTO[])request.getAttribute("CommentList");
%> 

<%
	int no = arr[0].getNo();
	String title = arr[0].getTitle();
	String content = arr[0].getContent();
	String regDate = arr[0].getRegDate();
	int clickCnt = arr[0].getClickCnt();
	String keyword = arr[0].getKeyword();
	String qid = arr[0].getQid();
%>

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

<!-- 네모 네모 -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">

<!-- jQuery -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 스크립트 적용 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="../JS/yj.js"></script>
<script type="text/javascript" src="../JS/BN/view_bn.js"></script>

<!-- CSS 적용 -->
<link rel="stylesheet" href="../CSS/BN/main_write_view_bn.css" type="text/css">
<link rel="stylesheet" href="../CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="../CSS/yj.css" type="text/css">

<%
if(session.getAttribute("id") == null) {	// 비로그인 일때
%>
<title>너네 집</title>

</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<body>

   <!-- header -->
	   <header style="padding: 0px;" class="col-md-12" id="main_header">
      <div id="main_top1" class="row">
         <div id="main_top1_1" class="col-md-2">
            <h1 id="main_title">너네 집</h1>
         </div>
         <div id="main_top1_2" class="col-md-3">
            <nav>
               <ul>
                  <li><a href="#" id="main_a_comunity">커뮤니티</a></li>
                  <li><a href="../storeMain.y" id="main_a_store">스토어</a></li>
                  <li><a href="../consMain.jsp" id="main_a_cons">인테리어시공</a></li>
               </ul>
            </nav>
         </div>
         <div id="main_top1_3" class="col-md-7">
            <div id="search">
               <i class="fas fa-search"></i>
            </div>

            <button id="write"
               onclick="location.href='communityMain.jsp'">글쓰기</button>

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
                        <li><a href="../MemberModifyAction_1.me">마이페이지</a></li>
                        <li><a href="../uOrderList.woo">나의쇼핑</a></li>
                        <li><a href="../member/logout.jsp">로그아웃</a></li>
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
            <a href="../sign_in.jsp">로그인 </a> | <a href="../MemberJoin.me">회원가입</a>
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
                  <li><a href="../storeMain.y">스토어홈</a></li>
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
                  <li><a href="../main.team">홈</a></li>
                  <li><a href="list.community?page=1">질문과답변</a></li>
               </ul>
            </nav>
         </div>
         <div class="col-md-9" id="main_top2-3">
            <nav style="padding: 0px;">
               <ul class="menu">
                  <li><a href="../consMain.jsp">시공홈</a></li>
                  <li><a href="#">견적계산</a></li>
                  <li><a href="#">전문가찾기</a></li>
                  <li><a href="#">시공스토어</a></li>
                  <li><a href="#">방산시장</a></li>
               </ul>
            </nav>
         </div>
         <div calss="col-md-3 col-sm-offset-0">
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
            <h1 id="main_title">너네 집</h1>
         </div>

         <div id="main_top1_3" class="col-sm-8 col-8">

            <button id="write"
               onclick="location.href='communityMain.jsp'">글쓰기
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
         <button id="m_menu_logout" OnClick="location.href ='member/logout.jsp'">로그아웃</button>
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
               <h4 Onclick="location.href='list.community?page=1'"
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
<%
} else {	//로그인일 때
	if(session.getAttribute("id").equals("admin")) {	// 로그인 아이디, 어드민 아이디일때
%>
<title>너네집 Manager</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>
	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-4">
				<h1 id="main_title">너네 집 Manager</h1>
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
								<li><a href="../member/logout.jsp">로그아웃</a></li>
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
						<li id="menu_myshopping"><a href="community/communityAdmin.community">커뮤니티관리</a></li>
						<li><a href="../aQuestionList.y">스토어관리</a></li>
						<li><a href="../consManager.cons">인테리어 시공 관리</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="communityAdmin.community?page=1&pagerow=10">등록된 게시글</a></li>
						<li><a href="communityAdminComment.community?page=1&pagerow=10">댓글 목록</a></li>
						<li><a href="communityAdminReport.community?page=1&pagerow=10">신고 현황</a></li>
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
				<h1 id="main_title">너네 집 Manager</h1>
			</div>

			
		</div>
				<hr>
		<div id="main_top2" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="#">회원관리</a></li>
						<li id="menu_myshopping"><a href="communityAdmin.community">커뮤니티관리</a></li>
						<li><a href="../aQuestionList.y">스토어관리</a></li>
						<li><a href="../consManager.cons">인테리어 시공 관리</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<hr>
		<div id="main_top3" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="communityAdmin.community?page=1&pagerow=10">등록된 게시글</a></li>
						<li><a href="communityAdminComment.community?page=1&pagerow=10">댓글 목록</a></li>
						<li><a href="communityAdminReport.community?page=1&pagerow=10">신고 현황</a></li>
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
			<button id="m_menu_login" OnClick="location.href ='../sign_in.jsp'">로그인</button>
			<button id="m_menu_join" OnClick="location.href ='../MemberJoin.me'">회원가입</button>

			<%
				}
			%>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-user"></i> 회원 관리
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 Onclick="#"
					class="Hpointer">회원조회</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-comments" ></i> 커뮤니티
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 Onclick="location.href ='communityAdmin.community?page=1&pagerow=10'"
					class="Hpointer">등록된 게시글</h4>
					<h4 Onclick="location.href ='communityAdminComment.community?page=1&pagerow=10'"
					class="Hpointer">댓글 목록</h4>
					<h4 Onclick="location.href ='communityAdminReport.community?page=1&pagerow=10'"
					class="Hpointer">신고 현황</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-store"></i> 스토어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 OnClick="location.href ='../aQuestionList.y'">문의 관리</h4>
					<h4 OnClick="location.href ='../aProductList.y'">상품 관리</h4>
					<h4 OnClick="location.href ='../mOrderList.woo'">주문 배송 내역</h4>
				</div>
			</div>
			<div class="m_nav_menu">
				<h1 class="Hpointer">
					<i class="fas fa-tools"></i> 인테리어
				</h1>
				<div class="m_nav_menu_inner">
					<br>
					<h4 OnClick="location.href ='../consMain.jsp'" class="Hpointer">상담신청내역</h4>
					
				</div>
			</div>
			<div class="m_nav_menu" id="m_nav_menu_bottom">
				<h4>마이페이지</h4>
				<h4 class="Hpointer" OnClick="location.href ='../uOrderList.woo'" >나의쇼핑</h4>
				<h4>스크랩북</h4>
				<h4>질문하기</h4>

			</div>
		</div>
	</header>
<%
	} else {	// 로그인 했으나 어드민 아이디가 아닐때
%>
<title>너네 집</title>

</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<body>

   <!-- header -->
	   <header style="padding: 0px;" class="col-md-12" id="main_header">
      <div id="main_top1" class="row">
         <div id="main_top1_1" class="col-md-2">
            <h1 id="main_title">너네 집</h1>
         </div>
         <div id="main_top1_2" class="col-md-3">
            <nav>
               <ul>
                  <li><a href="#" id="main_a_comunity">커뮤니티</a></li>
                  <li><a href="../storeMain.y" id="main_a_store">스토어</a></li>
                  <li><a href="../consMain.jsp" id="main_a_cons">인테리어시공</a></li>
               </ul>
            </nav>
         </div>
         <div id="main_top1_3" class="col-md-7">
            <div id="search">
               <i class="fas fa-search"></i>
            </div>

            <button id="write"
               onclick="location.href='communityMain.jsp'">글쓰기</button>

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
                        <li><a href="../MemberModifyAction_1.me">마이페이지</a></li>
                        <li><a href="../uOrderList.woo">나의쇼핑</a></li>
                        <li><a href="../member/logout.jsp">로그아웃</a></li>
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
            <a href="../sign_in.jsp">로그인 </a> | <a href="../MemberJoin.me">회원가입</a>
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
                  <li><a href="../storeMain.y">스토어홈</a></li>
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
                  <li><a href="../main.team">홈</a></li>
                  <li><a href="list.community?page=1">질문과답변</a></li>
               </ul>
            </nav>
         </div>
         <div class="col-md-9" id="main_top2-3">
            <nav style="padding: 0px;">
               <ul class="menu">
                  <li><a href="../consMain.jsp">시공홈</a></li>
                  <li><a href="#">견적계산</a></li>
                  <li><a href="#">전문가찾기</a></li>
                  <li><a href="#">시공스토어</a></li>
                  <li><a href="#">방산시장</a></li>
               </ul>
            </nav>
         </div>
         <div calss="col-md-3 col-sm-offset-0">
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
            <h1 id="main_title">너네 집</h1>
         </div>

         <div id="main_top1_3" class="col-sm-8 col-8">

            <button id="write"
               onclick="location.href='communityMain.jsp'">글쓰기
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
         <button id="m_menu_logout" OnClick="location.href ='member/logout.jsp'">로그아웃</button>
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
               <h4 Onclick="location.href='list.community?page=1'"
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
<%
	} // end if
} // end if
%> 

	
	
	
	
	
	


<!-- 작업해야할 메인 화면 -->
<main class="qna-detail">

<!-- 질문 내용 전체적인 화면 -->
<article class="qna-detail__container container">
  <section class="qna-detail__container__content">

  
    <!-- 질문과 답변, 질문 제목 노출 화면 -->
    <header class="qna-detail__content__header-container">
    
      <!-- 질문 제목 title -->
      <h1 class="qna-detail__content__header-title"><%= title %></h1>
      <!-- 수정 삭제 버튼은 해당 글 작성자만 노출 -->
      <%
      	if(session.getAttribute("id") != null) {	// 로그인을 한 상태에
      		if(session.getAttribute("id").equals(qid)) {	// 아이디도 일치하면
      %>
      <!-- 수정 삭제 버튼 노출시키기 -->
      <div class="qna-detail__content__action-group">
      <a href="update.community?no=<%= no %>"><button class="qna-detail__content__action-item" type="button">수정</button></a>
      <button onclick="chkDelete(<%= no %>)" class="qna-detail__content__action-item" type="button">삭제</button>
      </div>
      <%
      		} // end if
      	}
      %>
      </header>
	
      <!-- 모바일 버전 사용자 아이디 노출 -->
      <div class="qna-detail-author__profile-link__summary">
        <div class="qna-detail-author__profile-link__summary-section">
          <span class="qna-detail-author__profile-link__summary-nickname"><%= qid %></span>
        </div>
        <div class="qna-detail-author__profile-link__summary-introduction"></div>
      </div>
	
      <!-- 질문 내용 content -->
      <section class="qna-detail__content__body">
      	<!-- 사용자가 작성한 문의내용이 들어와야 할 곳 -->
        <p><%= content %></p>
        
      </section>
      
      
      <!-- 키워드, 등록일, 조회, 댓글이 보여지는 총 화면단 -->
      <footer class="qna-detail__footer">

        <!-- 키워드 개수만큼 버튼 만들기 위해! 우선 데이터 먼저 받기 -->
        <input id="btn_keyword_value" name="keyword" value="<%= keyword %>" hidden="">
        <!-- 키워드 keyword -->
        <ul id="keyword_list_group" class="qna-detail__footer__keyword-list">
          <!-- keyword 내용 들어가는 곳, JS로 유동적으로 만듦 -->
		</ul>
		
		<!-- 공유하기 -->
		<script type="text/javascript">
		
		  Kakao.init('7991917d4f0d79e81d524ea00682946b');
		  
		  function sendLink() {
		    Kakao.Link.sendDefault({
		      objectType: 'text',
		      text:
		        '<%= title %>',
		      link: {
		        mobileWebUrl:
		          'http://localhost:8888/Team5/community/view.community?no=<%= no %>',
		        webUrl:
		          'http://localhost:8888/Team5/community/view.community?no=<%= no %>',
		      },
		    })
		  }
		</script>
		
		<!-- 사용자 정보와 공유 버튼 -->
		<aside class="qna-detail-actions qna-detail__footer__action-group">
		 <div class="drop-down qna-detail-actions__wrapper">
		  <a href="javascript:sendLink()">
			<button class="view_btn button--color-gray-14-inverted qna-detail-actions__action" type="button">
			  <span class="qna-detail-actions__action__label">공유</span>
			</button>
		  </a>
		 </div>
		</aside>
		

		<!-- 등록일, 조회 노출 -->
		<div class="qna-detail__footer__metadata">
		  <!-- 등록일 regDate 들어가는 곳 -->
		  <time><%= regDate %></time>
		  <!-- 조회수 chlickCnt 들어가는 곳 -->
		  <span>조회 <span class="qna-detail__footer__metadata-view-count-value"><%= clickCnt %></span></span>
		  <!-- 신고버튼, 모달창 여는 버튼, data-toggle="modal" -->
		  <% // 작성자 제외하고는 안보이게 설정
		  if(session.getAttribute("id") != null) {	// 로그인을 한 상태에
			if(!session.getAttribute("id").equals(qid)) {	// 현재 로그인된 아이디와 작성자 일치 여부 확인
		  %>
		  <button data-toggle="modal" data-target="#create_report" class="qna-detail__footer__metadata-report-link" type="button">신고</button>
		  <%
			} // end if
		  } // end if
		  %>
		</div>
      
      </footer>


      <% // 댓글이 1개라도 있을때
      	if(arr2 != null) {
      %>
      <!-- 댓글  작성하는 총 화면 노출단-->
      <section class="qna-detail__comment-section">
	      <section class="comment-feed">
	      	<!-- 댓글이 몇개인지 파악하여 노출 -->
		    <h1 class="comment-feed__header">댓글&nbsp;<span class="comment-feed__header__count"><%= arr2.length %></span></h1>
		      
		    <!-- 작성한 댓글 db에 보내기 위한 form -->
		    <form class="comment-feed__form" action="commentWriteOk.community?no=<%= no %>" accept-charset="UTF-8" method="post">
		      
	          <!-- id 값을 리퀘스트 보내기 위해 -->
	          <input name="Comment_id" value="<%= session.getAttribute("id") %>" hidden="true">
	          
		      <div class="comment-feed__form__input">
		      
		        <!-- 댓글 택스트 작성 영역 -->
		        <div class="comment-feed__form__content">
		          <!-- 댓글 hint, 댓글이 없을때만 노출하기 -->
		          <div class="comment-content-input">
		            <input class="comment-content-iDDt comment-feed__form__content__text" placeholder="댓글을 남겨 보세요." name="commentContent">
		          </div>
		        </div>
		        
		        
		        
		        <!-- 댓글 등록 버튼, 로그인시 활성화, 비로그인시 비활성화 -->
		        <%
		        	if (session.getAttribute("id") != null) {	// 로그인 했을때
		        %>
		        <!-- 댓글 등록 버튼, 등록하는 순간 DB에 저장되어야 함 -->
		        <div class="comment-feed__form__actions">
		          <button class="comment-feed__form__submit" aria-label="등록" type="submit">등록</button>
		        </div>
		        <%
		        	} else { // 로그인 안했을때 비활성화
		        %>
		        <div class="comment-feed__form__actions">
		          <button class="comment-feed__form__submit" aria-label="등록" type="submit" disabled="disabled">등록</button>
		        </div>
		        <%
		        	}
		        %>


							
		      </div>
		      
		      </form>
		      
		      <!-- 댓글 리스트 보는 곳 -->
		      <ul class="comment-feed__list">
		        <%
			    	for(int i = 0; i < arr2.length; i++) {
		        %>
		        <!-- 실제 댓글 , 댓글 하나당 아래의 li 전체가 추가되어야 함-->
		        <li class="comment-feed__list__item">
		          <article class="comment-feed__item">
		            <!-- 댓글 남긴 사람과 댓글 내용 -->
		            <p class="comment-feed__item__content">
		              <span style="width: 15%" class="comment-feed__item__content__author__name"><%= arr2[i].getCid()%></span>
		              <span style="width: 80%" class="comment-feed__item__content__content"><%= arr2[i].getCcomment() %></span>
		              
		             
		              <% // 댓글 삭제란
		              	if(session.getAttribute("id") != null) {	// 로그인을 한 상태에
			          		if(session.getAttribute("id").equals(arr2[i].getCid())) {	// 아이디도 일치하면
		              %> 
		              <!-- 삭제 버튼 -->
		              <input id="cno_comment_value" value="<%= arr2[i].getCno() %>" hidden="true">
		              <button id="btn_comment_delete">
		                <span>
		                  <i class="far fa-times-circle" style="float: right; color: #ff0000;" 
		                  onmouseover="this.style.color='#ff00006b';" onmouseout="this.style.color='#ff0000';"></i>
		                </span>
		              </button>
		              <%
			          		}
			          	}
		              %>
		              
		              
		              
		            </p>
		        
		            <!-- 댓글 등록 시간 노출 -->
		            <footer class="comment-feed__item__footer">
		              <time class="comment-feed__item__footer__time"><%= arr2[i].getCregDate() %></time>
		            </footer>
		          </article>
		        </li>
		        <%
			    	} // end for
			    %>
			   
		      </ul>
		      
	      </section>
	      
	  <!-- end 댓글  작성하는 총 화면 노출단 -->
      </section>
      <%
        } else {	// 댓글이 하나도 없을때
      %>		      
      <!-- 댓글  작성하는 총 화면 노출단-->
      <section class="qna-detail__comment-section">
	      <section class="comment-feed">
	      
	        
	      	<!-- 댓글이 몇개인지 파악하여 노출 -->
		    <h1 class="comment-feed__header">댓글&nbsp;<span class="comment-feed__header__count">0</span></h1>
		      
		    <!-- 작성한 댓글 db에 보내기 위한 form -->
		    <form class="comment-feed__form" action="commentWriteOk.community?no=<%= no %>" accept-charset="UTF-8" method="post">

	        <!-- id 값을 리퀘스트 보내기 위해 -->
	        <input name="Comment_id" value="<%= session.getAttribute("id") %>" hidden="true">
		      <div class="comment-feed__form__input">

		        <!-- 댓글 택스트 작성 영역 -->
		        <div class="comment-feed__form__content">
		          <!-- 댓글 hint, 댓글이 없을때만 노출하기 -->
		          <div class="comment-content-input">
		            <input class="comment-content-iDDt comment-feed__form__content__text" placeholder="댓글을 남겨 보세요." name="commentContent">
		          </div>
		        </div>
		        
		        
		        <!-- 댓글 등록 버튼, 로그인시 활성화, 비로그인시 비활성화 -->
		        <%
		        	if (session.getAttribute("id") != null) {	// 로그인 했을때
		        %>
		        <!-- 댓글 등록 버튼, 등록하는 순간 DB에 저장되어야 함 -->
		        <div class="comment-feed__form__actions">
		          <button class="comment-feed__form__submit" aria-label="등록" type="submit">등록</button>
		        </div>
		        <%
		        	} else { // 로그인 안했을때 비활성화
		        %>
		        <div class="comment-feed__form__actions">
		          <button class="comment-feed__form__submit" aria-label="등록" type="submit" disabled="disabled">등록</button>
		        </div>
		        <%
		        	}
		        %>
		        
		        
		        
		      </div>
		    </form>
	      </section>
	  <!-- end 댓글  작성하는 총 화면 노출단 -->
      </section>
      <%
        } // end if
      %>

      <!-- 질문하러 가기, 모바일 버전에서 보여지기 위해서 필요...!! -->
      <aside class="qna-detail-aside qna-detail__aside">
        <div class="qna-detail-aside__section">
          <h2 class="qna-detail-aside__section__header">인테리어 궁금한 것물어보세요!</h2>
          <a href="write.community">
            <button class="view_btn button--size-60 button--color-blue qna-detail-aside__section__new-question-button" type="button">질문하러 가기</button>
          </a>
        </div>
      </aside>

</section>

<!-- 작성자, 공유, 질문하러 가기의 총 화면단 -->
<nav class="qna-detail__container__sidebar">
  <div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="81" class="sticky-container" style="position: sticky; top: 81px;">
    <div class="sticky-child" style="position: relative">
      <div class="qna-detail__container__sidebar__content">
        <address class="qna-detail-author qna-detail__container__sidebar__author">
						
          <!-- 작성자 아이디 -->
          <div class="qna-detail-author__profile-link__summary-section qna-detail-author__profile-link__summary-nickname"><%= qid %></div>
          
        </address>
					
		<aside class="qna-detail-actions question__sidebar__actions">
          <div class="drop-down qna-detail-actions__wrapper">
            <a href="javascript:sendLink()">
	          <button class="view_btn qna-detail-actions__action" type="button">
                <div class="qna-detail-actions__action__label">공유</div>
              </button>
            </a>
          </div>
		</aside>

 		<!-- 인테리어 궁금한 것 물어보세요 문구, 질문하러 가기 버튼 -->
 		<aside class="qna-detail-aside qna-detail__container__sidebar__aside">
 		  <div class="qna-detail-aside__section">
 		    <!-- 인테리어 궁금한 것 물어보세요 문구 -->
		    <h2 class="qna-detail-aside__section__header">인테리어 궁금한 것 물어보세요!</h2>
 		    <!-- 질문하러 가기 버튼 -->
 		    <a href="write.community">
 		      <button class="view_btn button--color-blue button--size-60 qna-detail-aside__section__new-question-button" type="button">질문하러 가기</button>
 		  	</a> 
 		  </div>
		</aside>
        		
		<!-- 끝end qna-detail__container__sidebar__content -->								
        </div>
      <!-- 끝end sticky-child -->
      </div>
    <!-- 끝end sticky-container -->
    </div>
    
  </nav>
</article>




<!-- 신고 페이지, 모달 열기 -->
<div id="create_report" class="modal fade" role="dialog">
 <div class="modal-dialog">
        
  <!-- Modal content-->
  <div class="modal-content modal-tag-select__wrap">
  <span style="float: right;">
  <button class="dismiss_popup" type="button" data-dismiss="modal"><i class="far fa-times-circle" style="font-size: 30px;"></i></button>
  </span>
  <!-- Modal 헤더 -->
  <header class="modal-header">
    <div class="title">신고사유를 선택해주세요.</div>
  </header>
  
  <!-- Modal 텍스트 문구 -->
  <div class="modal-body">
    <!-- 총 8개(0 ~ 7) -->
    <div class="ui-checked-right-left-text">
      <input type="radio" value="0" name="report_type" id="report_report_type_0">
      <label for="report_report_type_0">주제와 맞지 않음</label>
    </div>
        
    <div class="ui-checked-right-left-text">
          <input type="radio" value="1" name="report_type" id="report_report_type_1">
          <label for="report_report_type_1">정보가 부정확함</label>
    </div>
        
    <div class="ui-checked-right-left-text">
          <input type="radio" value="2" name="report_type" id="report_report_type_2">
          <label for="report_report_type_2">지나친 광고성 게시물</label>
    </div>
        
    <div class="ui-checked-right-left-text">
          <input type="radio" value="3" name="report_type" id="report_report_type_3">
          <label for="report_report_type_3">도배 및 중복 게시물</label>
    </div>
        
    <div class="ui-checked-right-left-text">
    <input type="radio" value="4" name="report_type" id="report_report_type_4">
    <label for="report_report_type_4">저작권 침해가 우려됨</label>
    </div>
        
    <div class="ui-checked-right-left-text">
      <input type="radio" value="5" name="report_type" id="report_report_type_5">
      <label for="report_report_type_5">욕설/비방이 심함</label>
    </div>
    
    <div class="ui-checked-right-left-text">
      <input type="radio" value="6" name="report_type" id="report_report_type_6">
      <label for="report_report_type_6">외설적인 게시물</label>
    </div>
        
    <div class="ui-checked-right-left-text">
      <input type="radio" value="7" name="report_type" id="report_report_type_7">
      <label for="report_report_type_7">개인정보노출</label>
    </div>
  </div>
  
  <footer class="modal-footer modal-tag-select__footer">
    <button name="button" type="button" class="close_popup">신고하기</button>
  </footer>
  
  <!-- 신고 아이디 -->
  <input id="reportID" value="<%= session.getAttribute("id") %>" hidden="true"> 
  
  <!-- 게시글 번호 -->
  <input id="reportQno" value="<%= no %>" hidden="true">
  
  <!-- Modal content-->
  </div>
 <!-- modal-dialog -->
 </div>
<!-- 신고 모달창 종료 -->
</div>




<!-- end 작업해야할 메인 -->
</main>


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