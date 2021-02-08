<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS Ajax</title>
</head>
<body>
	<h1>서버로부터 응답받은 결과</h1>
<script>
	//1) XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	var cnt = 1;
	// readyState 상태가 변할 때 실행시킬 콜백함수 작성
	request.onreadystatechange = requestAjax;
		
	
	// 2) open ("전송방식","요청정보","비동기여부")
	request.open("GET","data2.html",false);
	
	// 3) send() : 실행
	request.send();
	
	function requestAjax() {
		//응답데이터를 모두 받고 오류없이 성공적으로 실행되었을 때 
		if(request.readyState == 4 && request.status == 200) {
			// 4) 응답데이터에 대한 처리
			document.body.innerHTML += request.responseText;
		}
	}
</script>	
</body>
</html>