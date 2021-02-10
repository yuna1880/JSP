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
		];

$(document).ready(function() {
	var k = 0;
    var length = comImg.length;
    
    // 아래에서 length 후위 감소 연산자를 사용하면서 결국 0이된다.
    // 프로그래밍에서 0은 false를 의미하기에 0이되면 종료.
    comImg.sort(function(){
    	return Math.random() - Math.random();
    })
    //console.log(comImg[1]);
	
	for (var i = 0; i < 6; i++) {
		console.log("hi");
		var table = '<img class = "comImgInfo'+i+'" src ="'+comImg[k]+'">';
		$('.comImg'+i).html(table);
		k++;
	}
});

// consWrite로 화면 전환
$(document).on('click', '.btnCons', function() {
	var str = $(this).children('.cno').text().trim();
	console.log(str);
	location.href = "consWrite.cons?cno=" + str;
});	