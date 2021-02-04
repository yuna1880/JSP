<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 현재 페이지에 표시할 데이터를 화면에 표시. 
	1. 페이징 처리를 위해 객체(paging) 생성해서, 필요한 데이터 참조.
	2. 페이징 객체에 설정할 데이터 저장.
	3. DB데이터 조회 (건수 확인)
	4. 현재 페이지에 표시할 데이터 조회.
		4-1. 전달받은 페이지 번호 활용
		4-2. 전체 페이지 수, 블록갯수 확인
		4-3. 현재 블록의 시작페이지, 끝 페이지
		4-4. 현재페이지의 begin, end
	5. 데이터 화면에 표시(스타일 적용해서)
--%>
<%
	//페이징 처리를 위한 Paging 객체 생성해서 값을 읽고 
	Paging p = new Paging();

	// 1. 전체 게시글 수 구하기
	p.setTotalRecord(DAO.getTotalCount());
	p.setTotalPage();
	System.out.println(">전체 게시글 수 : " + p.getTotalRecord());
	System.out.println(">전체 페이지 수 : " + p.getTotalPage());
	
	// 2. 현재 페이지 구하기 
	String cPage = request.getParameter("cPage");
	if(cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	// 3. 현재 페이지에 표시할 게시글 시작번호 (begin), 끝번호(end) 구하기  
	p.setEnd(p.getNowPage() * p.getNumPerPage()); // 2 * 3 = 6
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1); // 6 - 3 + 1 = 4
	
	// (선택) 3-1 끝 글번호가 데이터건수보다 많은 경우 데이터건수와 일치.
	if(p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	System.out.println("---------------");
	System.out.println(">>현재 페이지 : " + p.getNowPage());
	System.out.println(">>시작 글 번호 : " + p.getBegin());
	System.out.println(">>끝 글 번호 : " + p.getEnd());
	
	//--------------------block 계산-------------------------
	// 4. 블록의 시작페이지, 끝페이지 구하기 (현재 페이지 번호 사용)
	// 시작 페이지 구하기 
	int nowPage = p.getNowPage();
	int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	//마지막 페이지 구하기 
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
	
	// 4-1 끝페이지(endPage) > 전체 페이지(totalPage)
	// 끝 페이지  = 전체 페이지 
	if(p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">>시작 페이지 (beginPage): " + p.getBeginPage());
	System.out.println(">>끝 페이지 (endPage): " + p.getEndPage());
	
	//---------------------------------------------------------
	// 현재 페이지 기준으로 DB데이터(게시글) 가져오기
	// 시작 글번호, 끝 글번호 // 저장용 Map 만들기(전달할 파라미터 값 저장용)
	Map<String, Integer> map = new HashMap<>();
	map.put("begin",p.getBegin());
	map.put("end",p.getEnd());
	
	//DB에서 현재 페이지에 표시할 게시글 조회
	List<BBSVO> list = DAO.getList(map);
	System.out.println(">>현재 페이지 글 목록 (list): " + list);
%>
<%
	//==========================================================
	// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th, #bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { 
		list-style: none;
		
	 }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid rgba(56, 56, 56, 0.986);;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid pink;
		padding: 3px 7px;
		background-color: pink;
	}
	.paging li a:hover {
		background-color: rgba(56, 56, 56, 0.986);
		color: white;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<link href="/14_BBS/css/board.css" rel="stylesheet">
</head>
<body>
	<div id="bbs">
		<table>
			<caption>Message Board</caption>
			<thead>
				<tr>
					<th class="no">NO</th>
					<th class="subject">SUBJECT</th>
					<th class="writer">WRITER</th>
					<th class="regdate">DATE</th>
					<th class="hit">HIT</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan='5'>
							<p>★ 게시글이 없습니다. 다시 확인해주세요 ★</p>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.b_idx }</td>
							<td>
								<!-- 글 번호, 페이지 번호 넘겨주기. -->
								<a href="view.jsp?b_idx=${vo.b_idx }&cPage=${pvo.nowPage }">${vo.subject }</a>
							</td>
							<td>${vo.writer }</td>
							<td>${vo.write_date.substring(0,10) }</td>
							<td>${vo.hit }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<%-- [이전으로] 에 대한 사용여부 처리 
								시작페이지(beginPage) == 1 비 활성화
								1보다 크면 활성화
								--%>
							<c:choose>
									<c:when test="${pvo.beginPage == 1 }">
										<li class="disable">PREVIOUS</li>
									</c:when>
								<c:otherwise>
									<li><a href="list.jsp?cPage=${pvo.beginPage - 1}">PREVIOUS</a></li>
								</c:otherwise>
							</c:choose>
								<%-- 블록내에 표시할 페이지 태그 작성 (시작페이지 ~ 끝페이지) 
									  현재페이지 = 페이지 번호 -> 현재페이지 처리
								--%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li>
										<a href="list.jsp?cPage=${pageNo }">${pageNo }</a>
									</li>
								</c:if>
							</c:forEach>
								<%-- [다음으로] 에 대한 사용여부 처리                                                                                                                       
								마지막페이지(lastPage) < 전체페이지(totalPage) 활성화
								마지막페이지(lastPage) > 전체페이지(totalPage) 비 활성화 --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li>
										<a href="list.jsp?cPage=${pvo.endPage + 1 }">NEXT</a>
									</li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">NEXT</li>
								</c:if>
						</ol>
					</td>
					<div class="container">
					<td>
						<input type="button" value="WRITE" class="btn btn-5"
							onclick="javascript:location.href='write.jsp'">
					</td>
					</div>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>