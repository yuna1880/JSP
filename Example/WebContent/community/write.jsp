<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 네모 네모 -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">

<!-- Latest compiled and minified CSS --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 

<!-- jQuery library --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<!-- Popper JS --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> 

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 스크립트 적용 -->
<script type="text/javascript" src="../JS/BN/write_bn.js"></script>

<!-- 내 CSS 적용 -->
<link rel="stylesheet" href="../CSS/BN/main_write_view_bn.css" type="text/css">

<title>너네 집</title>

</head>

<body>

<!-- 로그인 확인 -->
<%
	if (session.getAttribute("id") == null) {
%>
	<script>
		alert("로그인이 필요한 페이지입니다.")
		location.href = "../sign_in.jsp"
	</script>
<%
	}
%>

<header id="simplified-gnb" class="simplified-gnb">
    <div class="container simplified-gnb__container">
		<a class="simplified-gnb__logo" href="../main.team">
            <span class="icon icon-etc-brand-icon-n-bi-md">
            	<img src="Image/icon.png"></span>
		</a>
	</div>
</header>


<main role="main">

	<div class="question-form container">
	
	<form id="question-form" class="new_question" action="writeOk.community" accept-charset="UTF-8" method="post">

	<header class="question-form__header">
		<h2 class="question-form__header__heading text-black bold">질문하기</h2>
		<div class="question-form__header__title form-group">
		<input placeholder="제목을 적어주세요." class="form-control" maxlength="60" size="1" type="text" name="question[title]" id="question_title">
		
        <p id="error1">제목을 7자 이상으로 적어주세요.</p>
        
      </div>
    </header>

   
    <!-- 문의사항 택스트 --> 
    <section class="question-form__body">
      <div class="question-form__body__content form-group">
        <div class="question-form__body__content__wrap">
        
          <!-- 텍스트 글쓰기 -->
          <div class="question-form__body__content__input" 
          	contenteditable="true" tabindex="0">
 	         <!-- question-form__body__content__input, 사용자가 내용 추가하면 여기에 작성 됨 -->
          </div>
          
          <!-- 텍스트 아무것도 안쓸때 생기는 힌트..!! -->
          <div class="question-form__body__content__placeholder">
            내용을 적어주세요.
            	<div class="question-form__body__content__placeholder__cs">
              ※ 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하며, 답변이 달린 질문글은 삭제할 수 없습니다.<br>
              ※ 인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다.
            	</div>
          	  </div>
          	  
          </div>
        
        <p id="error3">궁금한 내용을 텍스트로 10자 이상 적어주세요.</p>

      </div>
    </section>
    
    
    <!-- 키워드 선택 부분 -->
    <section class="question-form__keywords form-group">
      <div class="question-form__keywords__wrap">
      
        <div class="question-form__keywords__list__wrap keyword-list">
        
          <ul class="question-form__keywords__list">
	          	<!-- 여기에다가 키워드 추가해주는 코드 만들기 -->
          </ul>

          <!-- 모달창 여는 버튼, data-toggle="modal" -->
          <button data-toggle="modal" data-target="#modal-tag-select" type="button"
            class="question-form__keywords__keyword question-form__keywords__keyword--new keyword-item hint">
	          	<span class="question-form__keywords__keyword__name">키워드를 입력해주세요.</span>
	            <span class="question-form__keywords__keyword__name--hint">클릭하여 주요 키워드를 입력해주세요.</span>
          </button>
          
          <p id="error2">키워드는 1개 이상 입력해주세요.</p>
          	
        </div>
        <div class="question-form__keywords__counter">
          <span class="question-form__keywords__counter__current">0</span>개<span class="question-form__keywords__counter__divider"></span>최대 <span class="question-form__keywords__counter__max">5</span>개
        </div>
      </div>
    </section>
    
    <!-- 키워드 값을 DB에 저장하기 위한 input value 설정 -->
    <input id="keyword_value" name="keyword" value="" hidden="true">
    <!-- content 값을 리퀘스트 보내기 위해 -->
    <input id="content_value" name="content" value="" hidden="true">
    <!-- id 값을 리퀘스트 보내기 위해 -->
    <input name="qid" value="<%= session.getAttribute("id") %>" hidden="true">
    
    <footer class="question-form__footer">
      <div class="question-form__footer__submit row">
        <input id="btn_write_form" type="submit" name="commit" value="질문 저장하기" class="btn btn-lg">
      </div>
    </footer>
	</form>
	</div>


<!-- 키워드 추가, 모달 영역 -->
<div id="modal-tag-select" class="modal fade" role="dialog">
    <div class="modal-dialog">
        
	<!-- Modal content-->
	<div class="modal-content modal-tag-select__wrap">
  
		<!-- Modal 헤더 -->
	    <header class="modal-header">
		<h2 class="modal-tag-select__header__name">키워드 선택 
			<span class="modal-tag-select__header__name__tip">(최대 5개 선택 가능)</span>
		</h2>
	    </header>
	    
		<!-- Modal 텍스트 문구 -->
		<div class="modal-body">
	    <dl class="modal-body modal-tag-select__groups">
	        <dt class="modal-tag-select__groups__name">일반</dt>
	        <dd class="modal-tag-select__groups__list">
	          <ul class="row">
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="리모델링/올수리">
	                  <span class="check-img"></span>
	                  <span class="value">리모델링/올수리</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="견적">
	                  <span class="check-img"></span>
	                  <span class="value">견적</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="업체 추천">
	                  <span class="check-img"></span>
	                  <span class="value">업체 추천</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="셀프인테리어">
	                  <span class="check-img"></span>
	                  <span class="value">셀프인테리어</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="신혼">
	                  <span class="check-img"></span>
	                  <span class="value">신혼</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="리폼">
	                  <span class="check-img"></span>
	                  <span class="value">리폼</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="디자인 추천">
	                  <span class="check-img"></span>
	                  <span class="value">디자인 추천</span>
	                </label>
	              </li>
	          </ul>
	        </dd>
	        <dt class="modal-tag-select__groups__name">가구</dt>
	        <dd class="modal-tag-select__groups__list">
	          <ul class="row">
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="가구배치/이동">
	                  <span class="check-img"></span>
	                  <span class="value">가구배치/이동</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="냉장고">
	                  <span class="check-img"></span>
	                  <span class="value">냉장고</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="블라인드">
	                  <span class="check-img"></span>
	                  <span class="value">블라인드</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="손잡이">
	                  <span class="check-img"></span>
	                  <span class="value">손잡이</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="수전/싱크대">
	                  <span class="check-img"></span>
	                  <span class="value">수전/싱크대</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="소파">
	                  <span class="check-img"></span>
	                  <span class="value">소파</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="식탁">
	                  <span class="check-img"></span>
	                  <span class="value">식탁</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="유리">
	                  <span class="check-img"></span>
	                  <span class="value">유리</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="에어컨">
	                  <span class="check-img"></span>
	                  <span class="value">에어컨</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="침대">
	                  <span class="check-img"></span>
	                  <span class="value">침대</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="TV">
	                  <span class="check-img"></span>
	                  <span class="value">TV</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="기타가구">
	                  <span class="check-img"></span>
	                  <span class="value">기타가구</span>
	                </label>
	              </li>
	          </ul>
	        </dd>
	        <dt class="modal-tag-select__groups__name">공간</dt>
	        <dd class="modal-tag-select__groups__list">
	          <ul class="row">
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="단독주택">
	                  <span class="check-img"></span>
	                  <span class="value">단독주택</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="아파트">
	                  <span class="check-img"></span>
	                  <span class="value">아파트</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="상가">
	                  <span class="check-img"></span>
	                  <span class="value">상가</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="원룸">
	                  <span class="check-img"></span>
	                  <span class="value">원룸</span>
	                </label>
	              </li>
	          </ul>
	        </dd>
	        <dt class="modal-tag-select__groups__name">실내 공간</dt>
	        <dd class="modal-tag-select__groups__list">
	          <ul class="row">
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="화장실">
	                  <span class="check-img"></span>
	                  <span class="value">화장실</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="베란다">
	                  <span class="check-img"></span>
	                  <span class="value">베란다</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="거실">
	                  <span class="check-img"></span>
	                  <span class="value">거실</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="주방">
	                  <span class="check-img"></span>
	                  <span class="value">주방</span>
	                </label>
	              </li>
	              <li class="modal-tag-select__groups__list__item form-check">
	                <label class="form-check-label">
	                  <input class="form-che" type="checkbox" value="현관">
	                  <span class="check-img"></span>
	                  <span class="value">현관</span>
	                </label>
	              </li>
	          </ul>
	        </dd>
	    </dl>
	  </div>
	  
		<footer class="modal-footer modal-tag-select__footer">
		  <!-- btn-dismiss 모달 닫는 버튼, data-dismiss="modal" -->
		  <button class="btn btn-dismiss" type="button" data-dismiss="modal">취소</button>
		  
		  <button id="btnCommit" class="btn btn-priority" type="button" disabled=true>선택 완료</button>
		</footer>
	</div>
  
    </div>
</div>

<!-- 메인 화면 끝 -->
</main>


</body>
</html>