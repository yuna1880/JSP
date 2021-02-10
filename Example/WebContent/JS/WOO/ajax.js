				$(document).ready(function(){
					$("#kakaoBtn").click(function() {
						var p = $('#resutlt_pid').val();
// // 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('cd019b39ca4c0b571b734d4b2403551e');

				// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
				Kakao.Link
						.createDefaultButton({
							container : '#kakaoBtn',
							objectType : 'feed',
							content : {
								title : $('#s_name').text(),
								description : '#니네집 #team5 #가구 #인테리어시공 #우리집',
								imageUrl :$('#k_url').text(),
								link : {
									mobileWebUrl : 'http://localhost:8888/Team5/productView.y',
									webUrl : 'http://localhost:8888/Team5/productView.y',
									androidExecParams: 'test',
								},
							},
							social : {
								likeCount : 10,
								commentCount : 20,
								sharedCount : 30,
							},
							buttons : [
									{
										title : '웹으로 이동',
										link : {
											mobileWebUrl : 'http://localhost:8888/Team5/productView.y',
											webUrl : 'https://developers.kakao.com',
										},
									},
									{
										title : '앱으로 이동',
										link : {
											mobileWebUrl : 'https://developers.kakao.com',
										},
									}, ],
							success : function(response) {
								console.log(response);
							},
							fail : function(error) {
								console.log(error);
							}
						});
				
				
					});
				});