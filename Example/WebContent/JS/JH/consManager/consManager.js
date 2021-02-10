$(document).ready(
		function() {
			// 메뉴 초기설정
			$("#main_top2-1").css("display", "none");
			$("#main_top2-2").css("display", "none");
			$("#main_top2-3").css("display", "none");
			
			// 메인화면전환	
			$(document).on('click', '#main_title', function() {
				location.href = "managerMain.jsp";
			});
			
			$('.updateComplete').hide(); // 초기수정 완료 버튼
			$('.cancel').hide(); // 초기 취소 버튼
			$('.update')
					.click(
							function() {
								console.log($(this).text());
								// 상담정보 숨기기
								$(this).parents('.Info').children(
										'.consInfo').hide();
								// 상담수정 입력창 보이기
								$(this).parents('.Info').children(
									'.consUpdate:not(".csno01")').css({
									'display' : 'block'
								});
								// 수정버튼 숨기기
								$(this).hide();
								// 삭제버튼 숨기기
								$(this).parents('.Info')
										.children('.delete').hide();
								// 완료버튼 보이기
								$(this).parents('.Info').children(
										'.updateComplete').show();
								// 취소버튼 보이기
								$(this).parents('.Info')
										.children('.cancel').show();

							} // end function

					) // end update click

			$('.cancel')
					.click(
							function() {
								 console.log("cancle 들어옴")
								// 상담정보 보이기
								$(this).parents('.Info').children(
										'div:not(.cname)').show();
								// 상담수정 입력창 보이기
								$(this).parents('.Info').children(
										'.consUpdate').hide();
								// 완료버튼 숨기기
								$(this).parents('.Info').children(
										'.updateComplete').hide();
								// 수정버튼 보이기
								$(this).parents('.Info')
										.children('.update').show();
								// 삭제버튼 보이기
								$(this).parents('.Info')
										.children('.delete').show();
								$(this).hide();
							} // end function
					) // end update click

					
					
			// 검색 버튼클릭
			$('.searchBtn').click(function() {
				// console.log($('#searchSelect option:selected').val());

				switch ($('#searchSelect option:selected').val()) {
				case "csno":
					// console.log("들어오냐?");
					
					$(".searchForm").attr("action", "consCsnoSelect.cons");
					break;

				case "csuid":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCsuidSelect.cons");
					break;
			
				case "csname":
					 console.log("들어오냐?");
					$(".searchForm").attr("action", "consCsnameSelect.cons");
					break;

				case "cname":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCnameSelect.cons");
					break;

				case "cstel":
					// console.log("들어오냐?");
					$(".searchForm").attr("action", "consCstelSelect.cons");
					break;

				case "csarea":
					console.log("들어오냐?");
					$(".searchForm").attr("action", "consCsareaSelect.cons");
					break;
				} // end switch
			});

		$('#selectAll').click(function(){
			location.href= "consManager.cons?page=1";
		}) // end selectAll
			
			
			
		}) // end JS

