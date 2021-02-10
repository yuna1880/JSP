<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.member.db.MemberBean" %>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");
	String MEMBER_ZIPCODE=member.getMEMBER_ZIPCODE();
	String MEMBER_EMAIL=member.getMEMBER_EMAIL();
	String MEMBER_EMAIL_GET=member.getMEMBER_EMAIL_GET();	
	String[] zipcodes=MEMBER_ZIPCODE.split("-");	//"-"로 구분함
	String[] email=MEMBER_EMAIL.split("@");	//"@"로 구분함
%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자 정보</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음 주소API -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

</head>
<script src="JS/SJ/info_js.js"></script>
<script src="JS/SJ/sj.js"></script>
<body>
<table style="width:960; cellspacing:0'' cellpadding:0; border:0; align:center;">
<tr>
<td colspan=2>
<!-- 개인정보 수정 -->
<p align="center">
<form action="./MemberModifyAction_2.me" method="post" name="infoform" 
		onsubmit="return check1()">
<table style="border:1px solid black; margin-left:auto; margin-right:auto;">
	<tr>
	<td bgcolor="pink" align="center">
		
			<div style="font-weight: bold;">이름:</div>
		</td>
		<td>
			
			<input type="text" name="MEMBER_NAME" 
				size="20" value="${member.MEMBER_NAME }"  readonly/>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			 <div style="font-weight: bold;">아이디:</div>
		</td>
		<td>
			${member.MEMBER_ID }
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">비밀번호:</div>
		</td>
		<td>
			
			<input type="password"  id ="MEMBER_PW" name="MEMBER_PW" size="15"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">비밀번호 확인:</div>
		</td>
		<td>
			
			<input type="password" name="MEMBER_PW2" size="15" />
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
		<td>
		<font size="2">
		(아이디와 비밀번호는 문자와 숫자를 조합하여 2~12자리로 만들어 주세요)</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">주민등록번호:</div>
		</td>
		<td>
			
			${member.MEMBER_JUMIN1 } - ${member.MEMBER_JUMIN2}
		</td>
	</tr>
	<%-- <tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">메일주소:</div>
		</td>
		<td>
		
		<input type="text" id="MEMBER_EMAIL1" name="MEMBER_EMAIL1" size="13" value="${member.MEMBER_EMAIL }" />
		</td>
	</tr> --%>
	<tr>
    <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">메일주소:</div></td>
   
  
   <td>
    <input type="text"id="MEMBER_EMAIL1" name="MEMBER_EMAIL1" value="" /> @
    
	<input type="text" id="MEMBER_EMAIL2" name="MEMBER_EMAIL2" value="" ReadOnly="true"/>
<select name="emailCheck"
onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
    <option value="notSelected" >::선택하세요::</option>
    <option value="etc">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option>
    <option value="empal.com">empal.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="lycos.co.kr">lycos.co.kr</option>
    <option value="msn.com">msn.com</option>
    <option value="hanmail.net">hanmail.net</option>
    <option value="yahoo.com">yahoo.com</option>
    <option value="korea.com">korea.com</option>
    <option value="kornet.net">kornet.net</option>
    <option value="yahoo.co.kr">yahoo.co.kr</option>
    <option value="kebi.com">kebi.com</option>
    <option value="orgio.net">orgio.net</option>
    <option value="paran.com">paran.com</option>    
    <option value="gmail.com">gmail.com</option>
   </select>
</td>
	<tr>
		<td bgcolor="pink" align="center">
			 <div style="font-weight: bold;">메일 수신 여부:</div>
		</td>
		<td>
		
		<input type="radio" name="MEMBER_EMAIL_GET" 
		value="YES" <%if(MEMBER_EMAIL_GET.equals("YES")){%>checked<%} %>/>
		<font size="2">수신</font>
		
		<input type="radio" name="MEMBER_EMAIL_GET" 
		value="NO" <%if(MEMBER_EMAIL_GET.equals("NO")){%>checked<%} %>/>
		<font size="2">수신 안함</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">집전화</div>
		</td>
		<td>
			
			<input type="text" name="MEMBER_PHONE" size="24" 
				value="${member.MEMBER_PHONE }" />
		</td>
	</tr>
	<%-- <tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;우편번호</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_ZIPCODE1" 
				size="6" onkeypress="gNumCheck()" 
				maxlength="3" value="<%=zipcodes[0].trim() %>" /> - 
			<input type="text" name="MEMBER_ZIPCODE2" 
				size="6" onkeypress="gNumCheck()" 
				maxlength="3" value="<%=zipcodes[1].trim() %>" />&nbsp;&nbsp;
			<input type="button" name="zipcode" 
				value="우편번호 검색" onclick="openzipcode(this.form)" />
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;집 주소</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_ADDR1" size="50" 
				value="${member.MEMBER_ADDR1 }" />
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;상세 주소</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_ADDR2" size="50" 
				value="${member.MEMBER_ADDR2 }" />
		</td>
	</tr> --%>
	 <tr>
			<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">우편번호 </div>
          	</td> 
			<td>
			<input type="text" id="postcode" placeholder="우편번호" name="MEMBER_ZIPCODE1" value="${member.MEMBER_ZIPCODE }"/>
			<input type="button" name="zipcode" onclick="DaumPostcode()" value="우편번호 찾기" ><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집주소
            
           </div>
            </td> 
			<td>
				<input type="text" name="MEMBER_ADDR1" id="MEMBER_ADDR1" placeholder="도로명주소" value="${member.MEMBER_ADDR1 }"/><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">상세주소
           </div>
            </td> 
			<td>
				
				<input type="text" id="MEMBER_ADDR2" placeholder="상세주소" name="MEMBER_ADDR2" size="50" value="${member.MEMBER_ADDR2 }"/><br>
			</td>
		</tr>
	
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">휴대폰</div>
		</td>
		<td>
			
			<input type="text" name="MEMBER_MOBILE" size="24" 
				value="${member.MEMBER_MOBILE }" />
		</td>
	</tr>
</table>

<table style="width:80%;">
	<tr>
		<td align="center">
			<br/><input type="submit" value="회원정보 수정" />
			<input type="button" value="회원 탈퇴" name="bt" onclick="out()" />
			<input type="button" name="cancle"value="취소" onclick="location.href='./main.team'">
		</td>
	</tr>
</table>
</form>
<!-- 개인정보 수정 -->
</td>
</tr>	
</table>
</body>
</html>