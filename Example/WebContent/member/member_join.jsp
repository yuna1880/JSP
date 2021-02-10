<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--  가져온거  -->
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
    
     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음 주소API -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style type="text/css">
</div>
    </style>
</head>
<script src="JS/SJ/sj.js"></script>
<body>
<h1 align="center">회원 가입</h1>


<FORM name="joinform" method="post" action="./MemberJoinAction.me" onsubmit="return validate()">


<table style="border:1px solid black; margin-left:auto; margin-right:auto;">
    <tr align="center">
        <td colspan="2" align="center" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">회원 기본 정보
            </div></td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center">
            <div style="font-weight: bold;">아이디:
            </div></td>
        <td>
        <input type="text" id= "MEMBER_ID" name="MEMBER_ID" size="30" maxlength=12/>
        <input type="button" id="confirm_id"name="confirm_id" value="중복확인" 
				onclick="openConfirmId(this.form)" />
            4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
 
    <tr>
        <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">비밀번호:</div></td>
        <td><input type="password" id="MEMBER_PW" name="MEMBER_PW" size="15"/>
           4~12자의 영문 대소문자와 숫자로만 입력</td>
    </tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호 확인:</div></td>
        <td><input type="password" id="MEMBER_PW2" name="MEMBER_PW2" size="15" maxlength="12"></td>
    </tr>
    <!-- <tr>
        <td bgcolor="pink" align="center">
        <div style="font-weight: bold;">메일주소:</div></td>
        <td><input type="text" id="MEMBER_EMAIL1" name="MEMBER_EMAIL1" size="50"/>
			예)id@domain.com</td>
    </tr> -->
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
        <div style="font-weight: bold;">메일 수신 여부:</div></td>
        <td>
        	<input type="radio" name="MEMBER_EMAIL_GET" value="YES" checked/>
			<font size="2">수신</font>
			&nbsp;&nbsp;<input type="radio" name="MEMBER_EMAIL_GET" value="NO"/>
			<font size="2">수신 안함</font>
		</td>
    </tr>
    <tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집전화
           </div>
            </td> 
        <td> <input type="text" name="MEMBER_PHONE" size="30"/></td>
	</tr>
	<!-- 주소 테이블 이용 -->
		<!-- <tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">우편번호
           </div>
            </td> 
			<td>
			<input type="text" id ="postcode" name="MEMBER_ZIPCODE1" size="6" 
				onkeypress="gNumCheck()" maxlength="3"/>- 
			<input type="text" name="MEMBER_ZIPCODE2" size="6" 
				onkeypress="gNumCheck()" maxlength="3" />&nbsp;&nbsp;
			<input type="button" name="zipcode" value="우편번호 검색" 
				onclick="openZipcode(this.form)" />
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집주소
           </div>
            </td> 
			<td>
				<input type="text" name="MEMBER_ADDR1" size="50" />
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">상세주소
           </div>
            </td> 
			<td>
				<input type="text" id="MEMBER_ADDR2"name="MEMBER_ADDR2" size="50" />
			</td>
		</tr>  -->
		 
		 <tr>
			<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">우편번호 </div>
          	</td> 
			<td>
			<input type="text" id="postcode" placeholder="우편번호" name="MEMBER_ZIPCODE1">
			<input type="button" name="zipcode" onclick="DaumPostcode()" value="우편번호 찾기" ><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">집주소
            
           </div>
            </td> 
			<td>
				<input type="text" name="MEMBER_ADDR1" id="MEMBER_ADDR1" placeholder="도로명주소" ><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">상세주소
           </div>
            </td> 
			<td>
				
				<input type="text" id="MEMBER_ADDR2" placeholder="상세주소" name="MEMBER_ADDR2" size="50"/><br>
			</td>
		</tr>
		
		
		<tr>
			<td bgcolor="pink" align="center">
            <div style="font-weight: bold;">휴대폰
           </div>
            </td> 
			<td>
				<input type="text" id="MEMBER_MOBILE"name="MEMBER_MOBILE" size="24" />
				예)010-1234-5678</td>
			</tr>
    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
        <td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" size="10" maxlength="10"></td>
    </tr>

    <tr>
        <td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
        <td><input type="text" id ="MEMBER_JUMIN1" name="MEMBER_JUMIN1" size="12" 
				 maxlength="6"/>-	
            
            <input type="password" id ="MEMBER_JUMIN2" name="MEMBER_JUMIN2" size="12" 
				 maxlength="7"/>
            예) 750615, 1862133</td>
    </tr>
 </table>
    <p align="center">
    <input type="submit" name="submit" value="회원 가입" >
    <input type="reset" value="다시 입력">
    <input type="button" name="cancle"value="취소" onclick="location.href='./main.team'">
    </FORM>

</body>
</html>
