<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %>

<%
	//Controller로부터 결과 데이터 받음
	WriteDTO[] arr = (WriteDTO[])request.getAttribute("list");

	int writePages = (Integer)request.getAttribute("writePages");
	int totalPage = (Integer)request.getAttribute("totalPage");
	int curPage = (Integer)request.getAttribute("curPage");
	int pageRows = (Integer)request.getAttribute("pageRows");
	int totalCnt = (Integer)request.getAttribute("totalCnt");
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


<script type="text/javascript" src="../JS/yj.js"></script>
<script type="text/javascript" src="../JS/BN/admin_bn.js"></script>

<link rel="stylesheet" href="../CSS/BN/list_admin_bn.css" type="text/css">
<link rel="stylesheet" href="../CSS/wk.css" type="text/css">
<link rel="stylesheet" href="../CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="../CSS/yj.css" type="text/css">




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
						<li id="Q_li"><a href="communityAdmin.community?page=1&pagerow=10">등록된 게시글</a></li>
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
						<li id="Q_li"><a href="communityAdmin.community?page=1&pagerow=10">등록된 게시글</a></li>
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





	
	
	
	
	
	
	
	
<!-- 리스트 노출  -->
<main role="main" id="root">
<div id="questions-index-page">

  <!-- 헤더창 -->
  <section id="questions-header">
    <div class="container">
      <div class="questions-header__title">
         <h1>등록된 질문</h1>
      </div>
    </div>
  </section>
  
  
  
  <!-- 실질적으로 리스트 노출하는 화면  -->
  <section id="questions-list" class="container">
  
    <div id="page_change" style="margin-bottom: 5px;">
     <select id="page_choice" 
     	style="padding: 7px 15px;border: 1px solid rgb(200, 200, 200);border-radius: 5px">
      <option value="none" selected disabled>==선택==</option>
      <option value="10">10개</option>
      <option value="20">20개</option>
      <option value="50">50개</option>
      <option value="100">100개</option>
     </select>
     <button id="btn_page_choice" type="button"
     	style="background-color: #35C5F0;color: #ffffff;cursor: default;
     		padding: 10px; border: none; border-radius: 20px;">선택</button>
    </div>
    
   <article class="questions-item">
    <table style="width: 100%;">
   
     <tr style="width: 100%;">
       <!-- 게시글 제목 -->
       <td class="questions-item__title" style="width: 70%; text-align: center;">제목</td>
       <!-- 작성자 -->
       <td class="questions-item__title" style="width: 10%; text-align: center;">아이디</td>
       <!-- 게시글 올린 시간 -->
       <td class="questions-item__title" style="width: 20%; text-align: center;">시간</td>
     </tr>
    
     </table>
    </article>
   
    <%
	    int startPoint = (curPage - 1) * pageRows;
		int endPoint = curPage * pageRows;
		
		if(endPoint > totalCnt) {endPoint = totalCnt;}
		
    	if(arr != null) {
    		for(int i = startPoint; i < endPoint; i++) {
    %>
    
    <!-- 아래의 a태그는 view 화면에 갈수 있도록 주소 설정하기 -->
    <a class="questions-item__link" href="view.community?no=<%= arr[i].getNo() %>">
      <article class="questions-item">
      
       <table style="width: 100%;">
        <tr style="width: 100%;">
        
        <!-- 게시글 제목 -->
        <td style="width: 70%;">
          <h1 class="questions-item__title"><%= arr[i].getTitle() %></h1>
        </td>
        
        <!-- 글 남긴 사람 아이디 -->
        <td style="width: 10%; text-align: center;">
          <span class="questions-item__footer__author"><%= arr[i].getQid() %></span>
        </td>
        
        <!-- 글 올린 시간 -->
        <td style="width: 20%; text-align: right;">
         <span class="questions-item__footer__time">
           <time class="questions-item__footer__date"><%= arr[i].getRegDate() %></time>
         </span>
        </td>
        
        </tr>
       </table>
            
        
      </article>
    </a> 
      
    <%
   			} // end for
   		} // end if
    %>
  </section>
  
  <!-- 페이징 -->
  <jsp:include page="paginationAdmin.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
	<jsp:param value="<%= pageRows %>" name="pageRows"/>
  </jsp:include>
  
</div>
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
	
	
	
	