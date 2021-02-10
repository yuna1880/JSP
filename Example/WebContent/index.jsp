<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span { width: 150px; color: red;}
	input{border:1px solid red;}
	table{width: 80%; margin: 0 auto;}
	table,th,td {border: 1px solid gray; text-align: center;}
	h2{text-align: center;}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   $(function() {
	   
		function getList() {
			$.ajax({
				url : "/Controller01",
				dataType: "xml",
				type : "get",
				success : function(data) {
					var table ="";
					$(data).find("ajoin").each(function() {
						table += "<tr>";
						table += "<td>"+ $(this).find("num").text() +"</td>";
						table += "<td>"+ $(this).find("id").text()  +"</td>";
						table += "<td>"+ $(this).find("pw").text()  +"</td>";
						table += "<td>"+ $(this).find("name").text()  +"</td>";
						table += "<td>"+ $(this).find("age").text()  +"</td>";
						table += "<td>"+ $(this).find("addr").text()  +"</td>";
						table += "<td><button id='del' name='"+$(this).find("num").text()+"'>삭제</button></td>";
						table += "</tr>";
					});
					
					$("#tbody").append(table);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		};
		
		// 아이디 중복 체크
		// data : 서버주소에 갈때 같이 넘어가는 파라미터를 말함
		$("#id").keyup(function() {
			$.ajax({
				url: "/Controller02",
				data : "id="+$("#id").val(),
				dataType:"text",
				type : "get",
				success : function(data) {
					if(data.trim() == "사용 가능"){
						$("span").html("<b><font color ='blue'>"+data+"</font></b>");
					}else if(data.trim() =="사용 불가"){
					   $("span").html("<b><font color ='red'>"+data+"</font></b>");
					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		
		// 회원 가입 
		// serialize() : 파라미터가 여러개 일때 직렬화로 서버 정보를 보내다.
		$("#btn").click(function(){
			$.ajax({
				url : "/Controller03",
				data : $("#myform").serialize(),
				dataType : "text",
				type : "get",
				success : function(data) {
					if(data.trim()=="0"){
						alert("가입실패1");
					}else{
						alert("가입성공");
					}
				},
				error : function() {
					alert("가입실패2")
				}
			});
		});
		// 동적으로 생성된 요소는 on 사용 => click() 사용 못함
		$("table").on("click","#del",function(){
			$.ajax({
				url : "/Controller04",
				data : "num="+$(this).attr("name"),
				dataType : "text",
				type : "get",
				success: function(data) {
							if(data.trim()=="0"){
								alert("삭제실패");
							}else{
								alert("삭제성공");
								$("#tbody").empty();
								getList();
							}
				        },
				error : function() {
					alert("삭제실패");
				}
			});
		});
		// 리스트구하는 메소드 실행하세요
		getList();
   });
</script>
</head>
<body>
	<h2> 회원 정보 입력하기 </h2>
	<form name="myform" method="post" id="myform" >
		<table>
			<thead>
				<tr>
					<th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th><th>주소</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> <input type="number" size="8" name="num" /></td>  
					<td>
						<input type="text" size="14" name="id" id="id" /><span>중복여부</span>
					</td>
					<td> <input type="password" size="8" name="pw" /></td>  
					<td> <input type="text" size="14" name="name" /></td>  
					<td> <input type="number" size="8" name="age" /></td>  
					<td> <input type="text" size="25" name="addr" /></td>  
				</tr>
			</tbody>
			<tfoot>
				<tr><td colspan="6" align="center"><button id="btn">가입하기</button></td></tr>
			</tfoot>
		</table>
	</form>
	<br /> <br /> <br />
	<h2> 회원 정보 보기 </h2>
	<div>
		<table id="list">
			<thead>
				<tr>
					<th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th><th>주소</th><th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
</body>
</html>