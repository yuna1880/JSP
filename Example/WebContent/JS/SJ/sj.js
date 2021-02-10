//$(document).ready(function() {
//	
//	var getName= RegExp(/^[A-Za-z가-힣]{2}/);
//	var re = RegExp(/[a-zA-Z0-9]{4,12}$/);
//	var getPass = RegExp(/[a-zA-Z]{1}[0-9]{1}/);
//	var re2 = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
//	var getPhone = RegExp(/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/);
//	var getEmail = RegExp(/^[\w\.-]{1,64}@[\w\.-]{1,252}\.\w{2,4}$/);	
//	var getBirth = RegExp(/^[0-9]{2}[0,1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/);
//	
//	
//	$("#id_sp2").hide()
//	$("#pass_sp1").hide()
//	$("#pass_sp2").hide()
//	$("#pass_sp3").hide()
//	$("#name_sp").hide()
//	$("#ph_sp").hide()
//	$("#email_sp").hide()
//	$("#birth_sp").hide()
//	
//	
//	$("#id").blur(function() {
//				 
//		 if(!re.test($("#id").val())){
//			 $("#id_sp2").show('fast');
//			 $("#id").val("");
//			/* alert("id는 4자이상 입력해야 합니다."); */
//		 }else{$("#id_sp2").hide('fast');}
//	
//	});//id
//	
//	$("#pass").blur(function() {
//		 if(!re.test($("#pass").val())){
//			 $("#pass_sp1").show('fast');
//			 $("#pass").val("");
//		 }else{$("#pass_sp1").hide('fast');}
//	 
//		 if(!getPass.test($("#pass").val())){
//			 $("#pass_sp2").show('fast');
//			 $("#pass").val("");
//		 }else{$("#pass_sp2").hide('fast');}
//	
//	});//pass
//	
//	$("#pass-repeat").blur(function() {
//		var pass1 = $("#pass").val();
//		var pass2 = $("#pass-repeat").val();
//		 if(pass1!=pass2){
//			 $("#pass_sp3").show('fast');
//			 $("#pass-repeat").val("");
//		 }else{$("#pass_sp3").hide('fast');}
//	
//	});//pass
//	
//	$("#name").blur(function() {		
//		 if(!getName.test($("#name").val())){
//			 $("#name_sp").show('fast');
//			 $("#name").val("");
//		 }else{$("#name_sp").hide('fast');} 
//	});//name
//	$("#phone").blur(function() {	
//		 if(!getPhone.test($("#phone").val())){
//			 $("#ph_sp").show('fast');
//			 $("#phone").val("");
//		 }else{$("#ph_sp").hide('fast');} 	 
//	});//phone
//	
//	$("#email").blur(function() {	
//		 if(!getEmail.test($("#email").val())){
//			 $("#email_sp").show('fast');
//			 $("#email").val("");
//		 }else{$("#email_sp").hide('fast');} 	 
//	});//email
//	
//	$("#birth").blur(function() {	
//		 if(!getBirth.test($("#birth").val())){
//			 $("#birth_sp").show('fast');
//			 $("#birth").val("");
//		 }else{$("#birth_sp").hide('fast');} 	 
//	});//birth
//});
//	  
//	//아이디 중복 체크 버튼 클릭시 호출 되는 함수 
// 	function winopen() {
// 		 
//		//id입력란이 공백일경우  아이디를 입력하세요 !! 메세지를 띄우고  아이디입력란에 포커스가 깜박이게 
//		if(document.fr.id.value == ""){
//			window.alert("아이디를 입력해주세요");
//			document.fr.id.focus();
//			return;
//		}
// 		
//		//창열기 
//		var chkid = document.fr.id.value; //아이디입력란에 작성한 값 얻기 
//		window.open("IDcheck.jsp?chkid="+ chkid, "", "width=400, height=200");
//		
//		
//	}
// 	function openmail(){
// 		
// 		if(document.fr.email.value == ""){
// 			alert("이메일을 입력하세요.");
// 			//아이디 입력 <input>태그에 포커스깜빡
// 			document.fr.email.focus();
// 			return;
// 		}
// 		
// 		var femail = document.fr.email.value;
// 		var check = -1;
// 		
// 		
// 		window.open("join_IDCheck2.jsp?email="+femail+"&check="+check,"","width=400,height=200");
// 		
// 	
// 	}
//	
//	
//	
//    function sample6_execDaumPostcode() {
//        new daum.Postcode({
//            oncomplete: function(data) {
//                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
//                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
//                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//                var fullAddr = ''; // 최종 주소 변수
//                var extraAddr = ''; // 조합형 주소 변수
//                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
//                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
//                    fullAddr = data.roadAddress;
//                } else { // 사용자가 지번 주소를 선택했을 경우(J)
//                    fullAddr = data.jibunAddress;
//                }
//                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
//                if(data.userSelectedType === 'R'){
//                    //법정동명이 있을 경우 추가한다.
//                    if(data.bname !== ''){
//                        extraAddr += data.bname;
//                    }
//                    // 건물명이 있을 경우 추가한다.
//                    if(data.buildingName !== ''){
//                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//                    }
//                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
//                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
//                }
//                // 우편번호와 주소 정보를 해당 필드에 넣는다.
//                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
//                document.getElementById('sample6_address').value = fullAddr;
//                // 커서를 상세주소 필드로 이동한다.
//                document.getElementById('sample6_address2').focus();
//            }
//        }).open();
//    }
//	
//    function inputIdChk(){
//        document.fr.idDuplication.value ="idUncheck";
//    }
//    function checkVlaue() {
//    	
//    	if(!fr.pass.value){
//    		alert("비밀번호를 입력해주세요");
//    		return false;
//    	}
//    	
//    	if(!fr.name.value){
//    		alert("이름을 입력해주세요");
//    		return false;
//    	}
//    	
//    	if(!fr.phone.value){
//    		alert("전화번호를 입력해주세요");
//    		return false;
//    	}
//    	
//    	if(!fr.email.value){
//    		alert("이메일을 입력해주세요");
//    		return false;
//    	}
//    	
//    	
//		if(fr.idDuplication.value != "idcheck"){
//			alert("아이디 중복체크를 해주세요");
//			return false;
//		}
//		
//		else{
//			document.fr.submit();
//		}
//	}
//    

 function validate() {
        //event.preventDefault();
        var objID = document.getElementById("MEMBER_ID");
        var objPwd1 = document.getElementById("MEMBER_PW");
        var objPwd2 = document.getElementById("MEMBER_PW2");
        var objEmail = document.getElementById("MEMBER_EMAIL1");
        var objEmail2= document.getElementById("MEMBER_EMAIL2"); 
        var objName = document.getElementById("MEMBER_NAME");
        var objNum1 = document.getElementById("MEMBER_JUMIN1");
        var objNum2 = document.getElementById("MEMBER_JUMIN2");
        var postcode = document.getElementById("postcode"); // 우편번호
        var adress = document.getElementById("MEMBER_ADDR2"); //상세주소
        /* var adress = document.getElementById("MEMBER_ADDR2"); //전화번호 */
        var mobile = document.getElementById("MEMBER_MOBILE"); //핸드폰번호
        
 
        var arrNum1 = new Array();
        var arrNum2 = new Array();
 
        var tempSum=0;//주민번호 합을 넣는 공간
 
        //아이디와 패스워드 값 데이터 정규화 공식
        var regul1 = /^[a-zA-Z0-9]{4,12}$/;
        //이메일 값 데이터 유효성 체크
        //[]안에 있는 값만 쓰겠다
 
        //이메일 정규화 공식
        var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        //이름 정규화 공식
        var regul3 = /^[가-힝a-zA-Z]{2,}$/;
        //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
 
        //핸드폰 번호 정규식
        var regul4 = /^\d{3}-\d{3,4}-\d{4}$/;
        
        //일반 전화번호 정규식
		var regul5 = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		//휴대폰번호 체크 정규식
		var regul6 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
        
        
        //아이디 입력 하지 않았을 경우
        if ((objID.value) == ""){
            alert("아이디를 입력하지 않았습니다.");
            objID.focus();
            return false;
        }
        
        
        //아이디 유효성 검사
        //내가 입력한 데이터를 검사하는 check()
        //만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
        if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;//반환 할 곳 없이 if문 탈출
        }
        //비밀번호 입력 하지 않았을 경우
        if ((objPwd1.value) == ""){
            alert("비밀번호를 입력해 주세요");
            objPwd1.focus();
            return false;
        }
        if ((objPwd2.value=="")){
            alert("비밀번호를 확인해 주세요");
            objPwd2.focus();
            return false;
        }
 
        //비밀번호 유효성 검사
        //만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
        if (!check(regul1,objPwd1,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;
        }
        
        //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
        if ((objPwd1.value)!=(objPwd2.value)) {
            alert("비밀번호가 일치 하지 않습니다.");
            objPwd1.focus();
            objPwd2.focus();
            return false;
        }
        //이메일 입력 안했을 경우
        if ((objEmail.value)=="") {
            alert("이메일을 입력해 주세요");
            objEmail.focus();
            return false;
        }
        //이메일이 잘못된 경우
       /* if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
            return false;
        }*/
        if ((objEmail2.value)=="") {
            alert("이메일을 입력해 주세요");
            objEmail2.focus();
            return false;
        }
        //-------0604----------------
        if ((postcode.value) == ""){
            alert("우편번호 입력해주세요");
            postcode.focus();
            return false;
        } 
         if ((adress.value) == ""){
            alert("상세주소를 입력해주세요");
            adress.focus();
            return false;
        }
         if ((mobile.value) == ""){
            alert("휴대폰 번호를 입력해주세요");
            mobile.focus();
            return false;
        }
        if (!check(regul4,mobile,"휴대폰 번호를 잘못 입력 했습니다.")) {
             return false;
         }
        
        //이름 입력 안 한 경우
        if ((objName.value)=="") {
            alert("이름 2자 입력해 주세요");
            objName.focus();
            return false;
        }
        //이름에 특수 문자가 들어간 경우
        if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
            return false;
        }
 
        //주민번호 앞자리를 각 배열에 넣어 검색 및 비교하기위한 단계
        //앞자리 값 만큼 돌림
        for (var i = 0; i <objNum1.value.length; i++) {
            //배열 칸마다 앞자리 값 하나씩 넣어줌
            arrNum1[i]=objNum1.value.charAt(i);
        }
 
        //주민번호 뒷자리를 각 배열에 넣어 검색 및 비교하기위한 단계
        //뒷자리 값 만큼 돌림
        for (var i = 0; i <objNum2.value.length; i++) {
            //배열 칸마다 뒷자리 값 하나씩 넣어줌
            arrNum2[i]=objNum2.value.charAt(i);
        }
        //주민번호 앞자리를 tempSum에 집어 넣기
        //앞자리 만큼 돌림
        for (var i = 0; i <objNum1.value.length; i++) {
            //tempSum에 앞자리를 연이어 넣어줌
            tempSum += arrNum1[i]*(2+i);
        }
        //주민번호 뒷자리를 tempSum에 집어 넣기
        //뒷자리 -1을 해주는 이유 : 뒷자리 마지막 자리는 더할 필요 없어서
        //뒷자리의 -1만큼 돌림
        for (var i = 0; i <objNum2.value.length-1; i++) {
            //뒷자리 2번째 자리 부터 
            if (i>=2) {
                //tempSum에 2~6번째까지 넣어줌
                tempSum += arrNum2[i]*i;
            }else{//뒷자리 0~1번째 자리
                //tempSum에 0~1번째까지 넣어줌
                tempSum += arrNum2[i]*(8+i);
            }
        }
        //주민번호 유효성 체크
        //주민번호 구하는 식
        if (((11-(tempSum%11))%10)!=arrNum2[6]) {
            alert("올바른 주민 번호가 아닙니다.");
            objNum1.value="";
            objNum2.value="";
            objNum1.focus();
            return false;
        }
        //주민번호를 입력하면 생년월일이 자동으로 입력된다.
        //substring은 시작문자와 끝문자를 검색하는 역할
       if (arrNum2[0]==1 || arrNum2[0]==2) {//1900년생 일때
            var y = parseInt(objNum1.value.substring(0,2));
            var m = parseInt(objNum1.value.substring(2,4));
            var d = parseInt(objNum1.value.substring(4,6));
            //년도,월,일을 각각 구함
            f.my_year.value = 1900+y;//년도
            f.month.value = m;//월
            f.day.value = d;//일
        }else if(arrNum2[0]==3||arrNum2[0]==4){//2000년생 일때
            var y = parseInt(objNum1.value.substring(0,2));
            var m = parseInt(objNum1.value.substring(2,4));
            var d = parseInt(objNum1.value.substring(4,6));
            
            f.my_year.value = 2000+y;//년도
            f.month.value = m;//월
            f.day.value = d;//일
        }
       
    }
    
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
               
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("MEMBER_ADDR1").value = roadAddr;
            }
        }).open();
    }
    
    
    
    
    
    
    
    
    function check(re,what,message){//정규화데이터,아이템 id,메세지
        if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
        //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
            return true;
        }
        alert(message);
        what.value = "";
        what.focus();
    }
 //------------------------------------------
 function openConfirmId(joinform){			
	var id=joinform.MEMBER_ID.value;
	var url="./MemberIDCheckAction.me?MEMBER_ID="+joinform.MEMBER_ID.value;
	
	if(id.length == 0 || id.length <4){
		alert("아이디는 4~12자의 영문 대소문자와 숫자로만 가능합니다.");
		joinform.MEMBER_ID.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+
						 "scrollbars=no,resizable=no,width=400,height=200");
}

function openZipcode(joinform){			
	var url="./Zipcode.me"
	open(url, "confirm", "toolbar=no,location=no,"
						+"status=no,menubar=no,"
						+"scrollbars=yes,resizable=no,"
						+"width=410,height=400");
}	


function SetEmailTail(emailValue) {
	  var email = document.all("MEMBER_EMAIL2")    // 사용자 입력
	  var emailTail = document.all("MEMBER_EMAIL2") // Select box
	  
	  if ( emailValue == "notSelected" )
	   return;
	  else if ( emailValue == "etc" ) {
	   emailTail.readOnly = false;
	   emailTail.value = "";
	   emailTail.focus();
	  } else {
	   emailTail.readOnly = true;
	   emailTail.value = emailValue;
	  }
	 }

	
