<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>
 
<p>Date: <input type="text" id="datepicker"></p>
 <h1 align="center">회원가입</h1>
		<form action="join_do" id="join_form" method="post">
			<input type="hidden" id="id_valid" value='0'> <input
				type="hidden" id="real_id" name="real_id"> <input
				type="hidden" id="password_valid" value='0'>
			<table class="table table-hover">
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name"
						class="form-control">*</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
					<input type="text" id="visible_id" name="visible_id"
						   disabled="disabled" class="form-control">* 
					<input type="button" value="ID확인" id="id_check_bt"
						onClick="window.open('idCheck.jsp','confirm','width=500 height=200')"
						class="btn btn-info">
					</td>
				</tr>
				
				<tr>
					<td>암호</td>
					<td>
					<input type="password" id="password" name="password"
						class="form-control">* 
						<span id="password_valid_span"></span>
					</td>
				</tr>
				
				<tr>
					<td>암호확인</td>
					<td>
					<input type="password" id="password_check"
						   name="password_check" class="form-control">* 
				    <span id="password_check_span"></span>
				    </td>
				</tr>
				 
				 <tr>
					<td>이메일</td>
					<td>
					<input type="text" name="email" id="email" class="form-control">
            		<div class="email regex"></div>
            		</td>
				</tr> 
				
				<tr>
				<td>전화번호</td>
				<td>
				<input type="text" name="phone" id="phone" class="form-control">
            	<div class="phone regex"></div>
				</td>
				</tr>
				
				<tr>
				<td>생년월일</td>
				  <td> <input type="text" id="datepicker" class="form-control" /></td>
				</tr>

				
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipcode" id="zipcode"
						class="form-control"> <input type="button" value="검색"
						id="zip_search" class="btn btn-info"></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address" size=70
						class="form-control"></td>
				</tr>
				
				<tr>
					<td></td>
					<td>
					<input type="button" value="회원가입" id="join_bt" class="btn btn-info">
					<input type="reset"  value="다시입력" id="reset_bt" class="btn btn-info"> 
					<input type="button" value="취소" id="cancle_bt" class="btn btn-info"
						   onclick="location.href='../main.jsp'">
				    </td>
				</tr>
				</table>
 
</body>
</html>