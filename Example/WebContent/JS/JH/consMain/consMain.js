var comImg = [
		"https://shopping-phinf.pstatic.net/main_1590071/15900717776.20181031093411.jpg",
		"https://shopping-phinf.pstatic.net/main_2259546/22595462726.20200423162345.jpg",
		"https://shopping-phinf.pstatic.net/main_1855796/18557969001.20190408023734.jpg",
		"https://shopping-phinf.pstatic.net/main_1313805/13138057807.20191231185849.jpg",
		"https://shopping-phinf.pstatic.net/main_1314825/13148254276.20180116145415.jpg",
		"https://shopping-phinf.pstatic.net/main_1997485/19974859000.20190628180301.jpg",
		"https://shopping-phinf.pstatic.net/main_2282800/22828002639.20200511232757.jpg",
		"https://shopping-phinf.pstatic.net/main_5374722/5374722468.20191120112240.jpg",
		"https://shopping-phinf.pstatic.net/main_2084307/20843079794.20190909143646.jpg",
		"https://shopping-phinf.pstatic.net/main_1453461/14534617503.20180614165123.jpg",
		"https://shopping-phinf.pstatic.net/main_2242193/22421934241.20200408153623.jpg",
		"https://shopping-phinf.pstatic.net/main_1689820/16898205436.20190701114901.jpg",
		"https://shopping-phinf.pstatic.net/main_1960001/19600015813.20190715180635.jpg",
		"https://shopping-phinf.pstatic.net/main_1790146/17901460822.20200316103434.jpg",
		"https://shopping-phinf.pstatic.net/main_2186889/21868891241.20200131183058.jpg",
		"https://shopping-phinf.pstatic.net/main_1983820/19838204814.20190619141238.jpg",
		"https://cdn.pixabay.com/photo/2016/11/29/08/43/blank-1868502_1280.jpg",
		"https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060__480.jpg",
		"https://cdn.pixabay.com/photo/2015/04/20/13/38/furniture-731449__480.jpg",
		"https://cdn.pixabay.com/photo/2016/11/18/17/20/couch-1835923__480.jpg",
		"https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325__480.jpg",
		"https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939__480.jpg",
		"https://cdn.pixabay.com/photo/2017/03/22/17/39/kitchen-2165756__480.jpg",
		"https://cdn.pixabay.com/photo/2016/09/19/17/20/home-1680800__480.jpg",
		"https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390__480.jpg",
		"https://cdn.pixabay.com/photo/2017/08/27/10/16/interior-2685521__480.jpg",
		"https://cdn.pixabay.com/photo/2017/03/25/23/32/kitchen-2174593__480.jpg",
		"https://cdn.pixabay.com/photo/2018/03/08/18/13/chair-3209341__480.jpg",
		"https://cdn.pixabay.com/photo/2015/05/15/14/30/interior-768526__480.jpg"
		]; 	// 이미지 불러올 데가 없어서 url 적어놓음

var k = 0;	// 이미지 출력을 위한 변수

var page = 1 // 현재 페이지
var pageRows = 140 // 한 페이지에 보여지는 게시글 개수v

// 메인화면전환	
$(document).on('click', '#main_title', function() {
	location.href = "main.team";
});


$(document).ready(function() {
	
	// 메뉴 초기설정
	$("#main_top2-1").css("display", "none");
	$("#main_top2-2").css("display", "none");
	$("#main_top2-3").css("display", "inline-block");
	
	// 게시판 목록 1페이지 로딩
	loadPage(page);


	$('.category').click(function() {
		$('.cateImg').css({
			'border' : 'none'
		});

		$('.category').children('div').css({
			'color' : 'black'
		});

		$(this).children('.cateImg').css({
			'border' : '2px solid #0080c0'
		});

		$(this).children('div').css({
			'color' : '#0080c0'
		});
		isCheckLR();
	}); // end click function

	moveScrollRight = function() {

		var _scrollX = $('#category').scrollLeft();
		$('#category').animate({
			scrollLeft : (_scrollX + 1000)
		}, 1000, function() {
			isCheckLR()
		});
		isCheckLR();
		//console.log($(_scrollX));

	}; // end left click

	moveScrollLeft = function() {
		var _scrollX = $('#category').scrollLeft();
		$('#category').animate({
			scrollLeft : (_scrollX - 1000)
		}, 1000, function() {
			isCheckLR()
		});

	}; // end right click

	$('#category').hover(function() {
		//console.log($('#category').scrollLeft());
		if (_scrollX = $('#category').scrollLeft() != 292) {
			$('.mRight').css({
				'visibility' : 'visible'
			})
		} else if (_scrollX = $('#category').scrollLeft() != 0) {
			$('.mLeft').css({
				'visibility' : 'visible'
			})
		}
		;
		isCheckLR();
	}); // end mouseHover

	$('#category').mouseleave(function() {

		$('.mRight').css({
			'visibility' : 'hidden'
		})
		$('.mLeft').css({
			'visibility' : 'hidden'
		})
	}); // end mouseLeave

	$('.mLeft').hover(function() {
		$('.mLeft').css({
			'visibility' : 'visible'
		});
		isCheckLR();
	}); // end mLeft hover

	$('.mRight').hover(function() {
		$('.mRight').css({
			'visibility' : 'visible'
		});
		isCheckLR();
	}); // end mRight hover
	
	
	
}) // end JS

function loadPage(page) {
	$("#category>.category")
			.click(
					function() {
					    comImg.sort(function(){
					    	return Math.random() - Math.random();
					    });
						
						$("#ex").remove();
						// console.log($('#consArea').val().trim());
						// console.log($(this).text().trim());
						var category = $(this).text().trim();
						var area = $('#consArea').val().trim();

						// JSON
						url = "list.ajax?page=" + page + "&pageRows=" + pageRows
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							success : function(data, status) {
								if (status == "success")
									parseJSON(data, category);
							}
						});

						function parseJSON(jsonObj) {
							
							var data = jsonObj.data;
//								console.log(data[0]);
//								console.log(data[2]);
//								console.log(data[3]);
//								console.log(data[4]);
							
							var count = jsonObj.count;
							var cnt = 0;
							
							// 전역변수 업데이트!
							window.page = jsonObj.page;
							window.pageRows = jsonObj.pagerows;
							
							var table = "<div id = \"comList\">";
							// 본문 태그 아이디
							if (area != "기타") {
								k = 0;
								for (var i = 0; i < count; i++) {
									if (category == data[i].ccategory
											&& $('#consArea').val().trim() == data[i].carea
													.trim()) {
										table += "<div class = \"comList\">";
										table += "<img class = \"comImg\" src ="
												+ comImg[k] + ">";
										table += "<div class =\"comInfoImdang\">";
										table += "<div class = \"comname\">"
												+ data[i].cname + "</div>";
										table += "<div class = \"cominfo\">"
												+ data[i].cadr + "</div>";
										table += "<div class = \"cominfo\">"
												+ data[i].ctel + "</div>";
										table += "<div class = \"btnCons\">상담신청</div>"
										table += "<div class = \"comNo\">"
												+ data[i].cno + "</div>";
										table += "</div>";
										table += "</div class = \"comList\">"
										cnt++;
										k++;
									} // end if
								} // end for

							} else {
								k = 0;
								// console.log(count);
								for (var i = 0; i < count; i++) {
									switch (data[i].carea.trim()) {
									case "서울":
									case "경기":
									case "인천":
									case "부산":
										break;
									default:
										if (category == data[i].ccategory) {
											table += "<div class = \"comList\">";
											table += "<img class = \"comImg\" src ="
													+ comImg[k] + ">";
											table += "<div class =\"comInfoImdang\">";
											table += "<div class = \"comname\">"
													+ data[i].cname + "</div>";
											table += "<div class = \"cominfo\">"
													+ data[i].cadr + "</div>";
											table += "<div class = \"cominfo\">"
													+ data[i].ctel + "</div>";
											table += "<div class = \"btnCons\">상담신청</div>"
											table += "<div class = \"comNo\">"
													+ data[i].cno + "</div>";
											table += "</div>";
											table += "</div class = \"comList\">"
											cnt++;
											k++;
										}
									} // end switch
								} // end for
							} // end if
							if (cnt == 0)
								table = "<div id=\"ex\"> <div class = \"ex\">아직 업체가 없습니다...<br>지역을 선택한 후 카테고리를 눌러 주세요~</div></div>"
							table += "</div>";
							$("#consList").html(table);

							return true;
						} // end function()
					}); // end main function
}


function isCheckLR() {
	if (_scrollX = $('#category').scrollLeft() >= 1) {
		$('.mRight').css({
			'visibility' : 'hidden'
		})
		$('.mLeft').css({
			'visibility' : 'visible'
		})
	} else if (_scrollX = $('#category').scrollLeft() <= 0) {
		$('.mRight').css({
			'visibility' : 'visible'
		})
		$('.mLeft').css({
			'visibility' : 'hidden'
		})
	}
} // end isCheckLR


