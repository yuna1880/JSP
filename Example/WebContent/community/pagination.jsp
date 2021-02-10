<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한 페이지에 표시될 페이지의 수
	int writePages = Integer.parseInt(request.getParameter("writePages"));
   	// 총 페이지의 수
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
   	// 현재 페이지
	int curPage = Integer.parseInt(request.getParameter("curPage"));
   	
	// 위 url에 추가로 붙어야 할 것들.
	String add = request.getParameter("add"); 
	if(add == null){ add = ""; }
	
	// 페이징 버튼 링크 url 주소에 넣을 문자열 준비
	String url = request.getContextPath().toString() + "/community/list.community?page=";
	
	String str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성
	
	
	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    int start_page = ( ( (int)( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    int end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
    
	// prev 표시 여부
	if (start_page > 1){
		str += "<li rel='prev' role='button' class='pointer-left'>"
			+ "<a href='" + url + (start_page - 1) + add + "' class='tooltip-top' title='이전'>"
			+ "<span class='icon-pointer-button-square-left'><i class='fas fa-chevron-left'></i></span></li>\n";
	}
	
	// 페이징 안의 '숫자' 표시
	if (totalPage > 1) {
    	for (int k = start_page; k <= end_page; k++) {
        	if (curPage != k){
        		str += "<li role='button' class='' data-page='" + k + "'><a href='" + url + k + add + "'>" + k + "</a></li>\n";
        	} else {
        		str += "<li role='' class='active' data-page='" + k + "'>" + k + "</li>\n";
        	}
        } // end for
    } // end if
	
	// next
    if (totalPage > end_page){
    	str += "<li rel='next' role='button' class='pointer-right'>"
    		+ "<a href='" + url + (end_page + 1) + add + "' class='tooltip-top' title='다음'>"
    		+ "<span class='icon-pointer-button-square-right'><i class='fas fa-chevron-right'></i></span></a></li>";
    }
%>


<!-- 페이징 -->
<div id="questions-paginator">
  <nav class="paginator">
    <ul>
      <%= str %>
    </ul>
  </nav>
</div>



<!--
<li rel="prev" role="button" class="pointer-left"><span class="icon-pointer-button-square-left"><i class="fas fa-chevron-left"></i></span></li>
  
  <li role="" class="active" data-page="1">1</li>
  <li role="button" class="" data-page="2">2</li>
  <li role="button" class="" data-page="3">3</li>
  <li role="button" class="" data-page="4">4</li>
  <li role="button" class="" data-page="5">5</li>
  <li role="button" class="" data-page="6">6</li>
  <li role="button" class="" data-page="7">7</li>
  <li role="button" class="" data-page="8">8</li>
  <li role="button" class="" data-page="9">9</li>
  <li role="button" class="" data-page="10">10</li>
  
<li rel="next" role="button" class="pointer-right"><span class="icon-pointer-button-square-right"><i class="fas fa-chevron-right"></i></span></li>
-->