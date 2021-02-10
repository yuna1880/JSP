function open_win()
{
 window.open('popup.jsp',
		     'popup', 
		     'width=300, height=200, left=0, top=0, toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
} // 왼쪽 상단 팝업창 생성

var windowW = 300;  // 창의 가로 길이
var windowH = 300;  // 창의 세로 길이
var left = Math.ceil((window.screen.width - windowW)/2);
var top = Math.ceil((window.screen.height - windowH)/2);

window.open("popup.jsp","pop_01","l top="+top+", left="+left+", height="+windowH+", width="+windowW); // 가운데 팝업 설정
