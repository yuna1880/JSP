<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>탈퇴</title>
</head>
<body>
<table style="width:96px; cellspacing:0; cellpadding:0; border:0; align:center;">
<tr>
<td colspan=2>
<p align="center">

<form action="./MemberDeleteAction.me" method="post">
<table  style="border:1; width:380px; cellpadding:0; cellspacing:0;">
	<tr>
		<td align="center" colspan="2">
			<font size="4"><b>회원 탈퇴</b></font>
		</td>
	</tr>
	<tr>
		<td align="center" height="35" width="100">
		<font size="4">비밀번호</font></td>
		<td>
		
		<input type="password" name="MEMBER_PW" />
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2" height="35">
			<input type="submit" value="회원 탈퇴" />
			<input type="reset" value="다시입력" />
			<input type="button" name="cancle"value="취소" onclick="location.href='./main.jsp'">
		</td>
	</tr>				
</table>
</form>				
</td>
</tr>
</table>
</body>
</html>