<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 지울것 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery.min.js"></script>
<!-- Google 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Google 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">


<link rel="stylesheet" href="CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="CSS/yj.css" type="text/css">
<link rel="stylesheet" href="CSS/wk.css" type="text/css">
<script type="text/javascript" src="JS/wk.js"></script>
<script type="text/javascript" src="JS/yj.js"></script>
<script type="text/javascript" src="JS/WOO/ajax.js"></script>
<script type="text/javascript" src="JS/WOO/postcode.v2.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">



<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>



<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>


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
						<li><a href="community/write.community">질문과답변</a></li>
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



	<!------------------------------------------- 내용입니다 . ------------------------------------------------------------------- -->

	<div class="s_info row">
		<br>

		<div class="s_image col-md-6 col-sm-12 col-12">
			<h3 class="s_title">가구 > ${view[0].pname }</h3>
			<br> <img class="p_image" id="p_image" src="${view[0].pimage}" />
			<div id="k_url">${view[0].pimage}</div>
		</div>
		<br>

		<div class="s_content col-md-6 col-sm-12 col-12">
			<br> <br>


			<div class="s_brand" id="s_brand">
				${view[0].pbrand }<br>
			</div>

			<div class="s_name">
				${view[0].pname }<br>
			</div>


			<div class="p_star" id="p_star">
				<pre id="star"></pre>
				<pre id="star"></pre>
				<pre id="star"></pre>
				<pre id="star"></pre>
				<pre id="halfStar"></pre>
				75개리뷰
			</div>
			<div class="p_link" id="p_link">
				<button id="kakaoBtn"></button>
				<button id="linkBtn"></button>
			</div>
			<div class="p_content">
				<div class="s_price" id="s_price">${view[0].pprice}원</div>
				<fmt:formatNumber value="${view[0].pprice}" />
				원
			</div>
			<div class="low" id="low">최저가</div>
			<div class="free" id="free">무료배송</div>
			<div class="team5" id="team5">team5</div>


			<div class="ignore" id="ignore">
				<div id="i_1">일반택배</div>
				<div id="i_2">
					(3개월) 무이자할부<br> <br>*조건에 따라 추가비용 발생 가능 (상품 상세 정보 참고)<br>
					<br> 제주도/도서산간 지역 배송 불가
				</div>
			</div>

			<div class="p_fix">
				<form class="p_option" name="myform1" action="">
					<div id="p_position">
						<!-- 						<div >
							<span>수량 :</span> <input class="figure" type="number" name="number" min="1" max="50" step="1" /><br>
						</div> -->
						<span id="s_option">수량 : </span> <select id="figure"
							class="figure" name="figure">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="" selected>선택</option>
						</select>


						<div class="total" id="total"></div>

					</div>
				</form>

				<div class="buy">
					<button id="cashBtn">바로구매</button>
				</div>

			</div>
		</div>

	</div>
	<div id="product_nav" class="floating-menu">
		<nav style="padding: 0px;">
			<ul class="menu">
				<%-- 	<li>상품정보</li>
					<li>문의 ${fn:length(Qlist) }</li>
					<li>배송/환불</li> --%>
				<li class="m"><a href="#section-01" class="menu-01"><span>상품정보</span></a></li>
				<li class="m"><a href="#section-02" class="menu-02"><span>문의</span></a></li>
				<li class="m"><a href="#section-03" class="menu-03"><span>배송안내</span></a></li>

			</ul>
		</nav>

	</div>
	<div id="detail_image" class="section-01 scroll">
		<br> <br> <br> <br>
		<h1>상품 정보</h1>
		<c:if test="${fn:length(file) > 0 }">
			<ul>
				<c:forEach var="element" items="${file }">
					<c:if test="${element.image == true }">
						<div class="detail_image_div">
							<img class="detail_image_img" src="upload/${element.file }" />
						</div>
					</c:if>

				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${fn:length(file) < 0 }">
			<h2>이미지 중비중 입니다.</h2>
		</c:if>
	</div>


	<!-------------------------------문의입니다. ******복사할부분----------------------------------------------->
	<div id="detail_question" class="section-02 scroll">
		<br> <br> <br> <br> <br>
		<div class="row">

			<h1 id="detail_question_1" class="col-md-10">
				문의<a> ${fn:length(Qlist) }</a>
			</h1>
			<div class="col-md-2" id="detail_questiondiv_2">
				<h1 id="detail_question_2">문의하기</h1>
			</div>
		</div>

		<div id="detail_question_list">
			<c:choose>
				<c:when test="${empty Qlist || fn:length(Qlist) ==0}">
					<div id="main_qlist">
						<h2>아직 문의한 내역이 없습니다.</h2>
					</div>
				</c:when>
				<c:otherwise>


					<c:forEach var="dto" items='${Qlist }'>
						<br>
						<br>
						<div id="detail_question_list_container">
							<h2 id="detail_question_list_2">
								<a>${dto.pqid }</a> | 구매 |
								<c:if test="${dto.pqanswer!='답변준비중 입니다.' }">
									<a id="ql_status"
										style="color: #fff; background-color: rgb(53, 197, 240);">
										답변완료 </a>
								</c:if>
								<c:if test="${dto.pqanswer=='답변준비중 입니다.' }">
									<a id="ql_status"
										style="color: rgb(53, 197, 240); background-color: #fff; border: 1px solid rgb(53, 197, 240)">
										답변대기 </a>
								</c:if>
							</h2>
							<br>
							<h2 id="detail_question_list_1">[ ${dto.pbrand } ]
								${dto.pname }</h2>
							<br>
							<h2 id="detail_question_list_3">${dto.pquid }
								| <a>${dto.pqregdate }</a>
							</h2>
							<br> <br> <br> <br>
							<h2 id="detail_question_list_4">
								Q. <a> ${dto.pqcontent }</a>
							</h2>
							<br>
							<h2 id="detail_question_list_5">
								A. <a> ${dto.pqanswer }</a>
							</h2>


						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>


	</div>

	<!-- --문의 등록 -->
	<div id="QModal">

		<!-- Modal content -->
		<div class="QModal_content">
			<span class="Qclose">&times;</span> <br> <br> <br>



			<h1 id="QModal_title">상품 문의하기</h1>
			<br> <br> <br>
			<h2 class="QModal_h2">문의내용</h2>
			<form id="QModal_form" action="QuestionWriteOk.y" method="post">
				<input id="QModal_input" type="text" name="pqcontent"
					placeholder="문의내용을 입력하세요 "> <input type="hidden" id="pquid"
					name="pquid" value="<%=session.getAttribute("id")%>">
				<!-- TODO uid 들어가ㅣ -->
				<input type="hidden" name="pqanswer" value="답변준비중 입니다."> <input
					type="hidden" name="pqpid" value="${param.pid }"> <br>
				<br> <br>
				<h3 id="QModal_detail">문의내용에 대한 답변은 ‘마이페이지 > 나의 쇼핑 > 나의 문의내역’
					또는 ‘상품 상세페이지’에서 확인 가능합니다.</h3>
				<button id="QModal_btn" type="submit">완료</button>
			</form>
		</div>

	</div>



	<!-------------------------------배송안내입니다. ******복사할 부분----------------------------------------------->
	<div class="clear"></div>
	<br>
	<div id="detail_delivery" class="section-03 scroll">

		<br> <br> <br> <br> <br>
		<h1>배송</h1>
		<table>
			<tr>
				<td>배송</td>
				<td>일반택배</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>무료배송</td>
			</tr>
			<tr>
				<td>도서산간 추가배송비</td>
				<td>5,000원</td>
			</tr>
			<tr>
				<td>배송불가 지역</td>
				<td>배송불가 지역이 없습니다.</td>
			</tr>
		</table>
		<br> <br> <br> <br>
		<h1>교환/환불</h1>
		<table>
			<tr>
				<td>반품배송비</td>
				<td>3,000원 (최초 배송비가 무료인 경우 6,000원 부과)</td>
			</tr>
			<tr>
				<td>교환배송비</td>
				<td>6,000원</td>
			</tr>
			<tr>
				<td>보내실 곳</td>
				<td>(42982) 서울 강남구 테헤란로 146</td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br>
		<h1>반품/교환 사유에 따른 요청 가능 기간</h1>
		<h3>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해
			주시기 바랍니다.</h3>
		<h3>1. 구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품배송비 부담)</h3>
		<h3>2. 표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터
			30일 이내. 둘 중 하나 경과 시 반품/교환 불가 (판매자 반품배송비 부담)</h3>

		<br> <br> <br> <br> <br> <br>
		<h1>반품/교환 불가능 사유</h1>
		<h3>아래와 같은 경우 반품/교환이 불가능합니다.</h3>
		<br>
		<h3>1. 반품요청기간이 지난 경우</h3>
		<h3>2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장
			등을 훼손한 경우는 제외)</h3>
		<h3>3. 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예: 식품, 화장품)</h3>
		<h3>4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는
			태그가 떨어진 명품관 상품인 경우)</h3>
		<h3>5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (예: 식품, 화장품)</h3>
		<h3>6. 고객주문 확인 후 상품제작에 들어가는 주문제작상품</h3>
		<h3>7. 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)</h3>

	</div>

	<!-- ------------------------------------------------------------------ -->

	<!------------- modal입니다 -------------------------------------------------------- -->

	<!-- The Modal -->
	<div id="id01" class="modal">
		<form id="reg" name="reg" class="modal-content animate"
			action="purchaseOk.woo" method="post">

			<span class="close" id="close">&times;</span> <br>
			<div class="imgcontainer row">
				<div class="col-md-4 col-sm-12 col-12">
					<img src="${view[0].pimage}" class="avatar" id="avatar"
						alt="Avatar">
				</div>
				<div id="p_imgcontainer" class="col-md-7 col-sm-12 col-12">
					<div class="s_brand" id="s_brand">
						${view[0].pbrand }<br>
					</div>

					<div class="s_name" id="s_name">
						${view[0].pname }<br>
					</div>

					<div class="p_content_price">
						<div class="pc_price" id="pc_price"></div>
					</div>
				</div>

			</div>
			<div class="container">
				<!-- 로그인 form 스크립트넣어주기-->

				<input type="hidden" name="pclpid" id="resutlt_pid"
					value="${view[0].pid}"> <input type="hidden"
					name="ptotalprice" id="result_price"> <input type="hidden"
					name="pclpnt" id="result_cnt"> <label for="uname"><b>UserID</b></label>
				<input id="pcuid" type="text"
					placeholder="<%=session.getAttribute("id")%>" name="pcuid"
					value=<%=session.getAttribute("id")%> readonly="readonly" required>


				<div class="o_button">
					<button id="daum" onclick="Daum()"></button>
				</div>
				<label for="addressnum"><b>AddressNum</b></label>
				<div>
					<input id="pcaddressnum" type="text" placeholder="우편번호 입력 "
						name="pcaddressnum" maxlength="5" style="width: 200px" required>
				</div>
				<label for="address"><b>Address</b></label> <input id="pcaddress"
					type="text" placeholder="주소입력" name="pcaddress"><label
					for="address2"><b>AddressDetail</b></label> <input id="pcaddress2"
					type="text" placeholder="상세주소 입력" name="pcaddress2"> <label
					for="tel"><b>Request</b></label> <input id="pccontent" type="text"
					placeholder="배송메모" name="pccontent"> <label for="psw"><b>CardNumber</b></label>
				<div>
					<input id="pccardnum" type="text" placeholder="카드번호입력"
						name="pccardnum" maxlength="4" style="width: 200px" required> ㅡ <input
						id="pccardnum2" maxlength="4" style="width: 200px" type="password" required>
					 ㅡ <input
						id="pccardnum3" maxlength="4" style="width: 200px" type="password" required>
					 ㅡ <input
						id="pccardnum4" maxlength="4" style="width: 200px" type="password" required>
				</div>

				<button id="reg">구매 완료</button>
					<button id="check_module" type="button">결제 하기</button>
				<!-- <input type="submit" name="okay" class="okay" id="okay" value="구매 하기"> -->
				<label> <input type="checkbox" name="remember" checked>Remember
				</label>
				<div class="container" style="background-color: #f1f1f1">
					<button type="button" class="cancelbtn" id="cancelbtn">Cancel</button>
					<span class="psw">Forgot <a href="#">password?</a></span>
				</div>
			</div>
		</form>
			
	</div>





	<!---------------------- 바닥입니다. ------------------------------------------------------------------------------------------------------>
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