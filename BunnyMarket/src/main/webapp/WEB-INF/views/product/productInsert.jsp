<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>상품 등록하기</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/index.jsp"><i class="fa fa-home"></i> 홈화면</a></li>
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/views/product/productList.jsp">상품</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품 게시글 등록</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">

			<form id = "productInsert" method = "post" action="${pageContext.request.contextPath}/product/productInsertEnd.do" enctype="multipart/form-data">
				<div class="row justify-content-between">
					<div class="col-12 col-md-6 col-lg-5">
						<div class="single_product_thumb">
							<div>
								<div id="pImgArea">
									<img id="titleImg" class = "d-block w-100" width="344.8px" height="357.56px">
								</div>
								<div id="pImgFileArea">
									<input type="file" id="titleImgArea" name = "pTitleImg"
										onchange="loadImg(this, 1);" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<!-- <h4 class="title">상품 제목</h4> -->
							<label for="pTitle">상품 제목 *</label>
							<input type = "text" name = "pTitle" class = "form-control" id = "pTitle" placeholder="게시글 제목을 입력" required />
							<br />
							
							<label for="pPrice">가격 설정 *</label>
							<input type = "text" name = "pPrice" class = "form-control" id = "pPrice" placeholder="상품 하한가 설정" required />
							<br />

							<!-- <label for="pEndDate">경매 종료일 *</label>
							<input type = "date" class = "form-control"  required />
							
								필요에 따라 해당 attribute추가  
								value : 기본날짜 설정, 
								min : 입력 가능한 가장 빠른 날짜, 
								max : 입력 가능한 가장 늦은 날짜 
							
							<br />
							
							<label for="pEndTime">경매 종료 시각 *</label>
							<input type = "time" class = "form-control"  required />
							
								value : 기본 시간 설정, 
								min : 입력 가능한 가장 빠른 시간, 
								max : 입력 가능한 가장 늦은 시간
							
							<br /> -->

							<label for="pAddress">주소 입력 </label>
							<input type = "text" id = "pAddress" name = "pAddress" class = "form-control" placeholder = "원하는 거래 장소를 입력" onclick = "addrSearch();" required />
						</div>
					</div>
					
					<!-- 썸머노트 -->
					<div class = "col-12 col-md-12">
						<br />
						<textarea name = "pContent" class="summernote" placeholder = "내용 입력"></textarea>
					</div>
				</div>
				<div align="center">
					<button type="submit" class="btn alazea-btn mt-15">수정완료</button>
				</div>
			</form>
		</div>
	</div>

	
</section>
<!-- ##### Single Product Details Area End ##### -->

	<script>
	// 사진 게시판 미리보기 기능 지원 스크립트
		$(function(){
			$('#pImgFileArea').hide();
			
			$('#pImgArea').click(() => {
				$('#titleImgArea').click();
			});
			
		}); 
	
		function loadImg(value, num){
			
			if(value.files && value.files[0])  {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					switch(num) {
					case 1 : $('#titleImg').attr('src', e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		
	// 서머노트 실행 
	   var check = $('.summernote').summernote({
	        height : 600 // 에디터 높이
	      , minHeight : null // 최소 높이
	      , maxHeight : null // 최대 높이
	      , focus : true  // 에디터 로딩후 포커스를 맞출지 여부
	      , lang : "ko-KR" // 한글 설정
	      , placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
	      , toolbar: [
	         // [groupName, [list of button]]
	         ['style', ['style']],
	         ['font', ['strikethrough', 'bold', 'underline', 'clear']],
	         ['Font Style', ['fontname']],
	         ['fontsize', ['fontsize']],
	         ['color', ['color']],
	         ['para', ['ul', 'ol', 'paragraph']],
	         ['table', ['table']],
	         ['height', ['height']],
	         ['insert', ['link', 'picture', 'video']],
	         ['view', ['fullscreen', 'codeview', 'help']]
	      ], callbacks : {
	         onImageUpload : function(files, editor,
	               welEditorble) {
	            data = new FormData();
	            data.append("file", files[0]);
	            var $note = $(this);
	            
	            $.ajax({
	               data : data,
	               type : "post",
	               url : '/dream/pImgInsert.pl', // servlet url
	               cache : false,
	               contentType : false,
	               processData : false,
	               success : function(fileUrl) {
	                  check.summernote('insertImage', fileUrl);
	                  alert("이미지 등록 성공!");
	               },
	               error : function(request, status, error) {
	                  alert("code:" + request.status + "\n"
	                        + "message:"
	                        + request.responseText + "\n"
	                        + "error:" + error);
	               }
	            });
	         }
	      }
	   });
	

		/* 주소 검색을 위한 스크립트 */ 
		function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                $('#pAddress').val(fullAddr);

	            }
	        }).open();
	    };
	    
	    
	
	</script>


<%@ include file="../common/footer.jsp"%>