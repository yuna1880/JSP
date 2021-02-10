//kakao local
$(document)
		.ready(
				function() {
					var consCategory = ['욕실', '주방',  '타일', '도어', '마루', '페인트', '목공'];
					// '도배', '장판', 
					// '시트필름' 얘만 5개
					// '욕실', '주방',  '타일', '도어', '마루', '페인트', '목공', 
					var table = ""; // 회사정보
					var categoryCnt = 0; // 카테고리 임당
					
					$("#btn_search").click(function() {
						parseJSON();
					})

					function parseJSON() {

						for (var i = 0; i < consCategory.length; i++) {
							// console.log("1");	// 순서확인용
							// 키워드로 장소검색
							$
									.ajax(
											{
												url : 'https://dapi.kakao.com/v2/local/search/keyword.json',
												headers : {
													'Authorization' : 'KakaoAK 96456f6d0e5f0db221b5025473bb3a0e'
												},
												type : 'GET',
												data : {
													'query' : consCategory[i],
												},
												success : function(data) {
													// console.log("3"); 	// 순서확인용
													
													// 호출 성공하면 작성할 내용
													if (data.documents.length != 0) { // 값이
														// 있으면
														// alert("성공?")
														parseJSON2(data) // 15개가
														// 넘어온다

													}
												}
											}).done(function(data){
										// console.log(data);
									});
							// console.log("2");	// 순서확인용
						} // end for
						// console.log(table);
						
					} // end parseJSON();

					function parseJSON2(jsonObj) {
						// place list
						var documents = jsonObj.documents
						
						var cnt = 0;
						
						table += "<table>";
						for (var j = 0; j < documents.length; j++) {
							// console.log("4" + documents.length);	// 순서확인용
							// console.log(j);	// 순서확인용

							
							
							table += "<tr>";
							table += "<td>INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES("
									+ "get_seq" + ",</td>";
							table += "<td>'" + documents[j].place_name
									+ "',</td>";
							table += "<td>'" + documents[j].address_name
									+ "',</td>";
							if(documents[j].phone.trim() != ""){
								table += "<td>'" + documents[j].phone + "',</td>";
							} else{
								table += "<td> '전화번호가 없습니다.' ,</td>";
							}
							var str = documents[j].address_name.split(" ")[0]
							table += "<td>'"
									+ str
							+ "',</td>";
							table += "<td>'"
										+ consCategory[categoryCnt]
										+ "'</td>";
							table += "<td>)</td>"
							table += "</tr>";
							if(j == 14){categoryCnt++;}
						} // end for
						table += "</table>";
						$("#company").html(table); // 데이터 출력
					} // end parseJSON2()
				})
