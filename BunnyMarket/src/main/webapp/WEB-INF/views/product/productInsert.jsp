<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
		<h2>상품 등록하기</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/index.jsp"><i class="fa fa-home"></i> Home</a></li>
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
										onchange="loadImg(this, 1);" required />
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<!-- <h4 class="title">상품 제목</h4> -->
							<label for="pTitle">상품 제목 *</label>
							<input type = "text" name = "pTitle" class = "form-control" id = "pTitle" placeholder="게시글 제목을 입력" value="" required />
							<br />
							
							<label for="pPrice">가격 설정 *</label>
							<input type="hidden" name="pPrice" id="pPriceOrigin" value="0"/>
							<input type="text" class="form-control" id="pPriceComma" placeholder="상품 가격 설정" value="" required />
							<br />

							<label for="pcno" style="float: none;">카테고리 설정 *</label>
	                        <div class="search_by_terms">
                                <select class="custom-select widget-title" name="pcno" style="width: 100%" id="pcnoCheck" required="required">
                                  <option value="9" hidden>물품의 종류를 선택해주세요.</option>
                                  <option value="1">전자기기</option>
                                  <option value="2">가구</option>
                                  <option value="3">악세서리</option>
                                  <option value="4">의류</option>
                                  <option value="5">장난감</option>
                                  <option value="6">책</option>
                                  <option value="7">기타</option>
                                </select>
	                        </div>
	                        <br />
	                        
	                        <label for="pcno" style="float: none;">거래방식 설정 *</label>
	                        <div class="search_by_terms">
                                <select class="custom-select widget-title" name="gMethod" style="width: 100%" required="required" id="dMethodCheck">
                                  <option value="9" hidden>거래방식을 선택해주세요</option>
                                  <option value="3">미결정</option>
                                  <option value="2">택배</option>
                                  <option value="1">직거래</option>
                                </select>
	                        </div>
	                        
	                        <br /><br />
								<label for="pAddress">주소 입력 </label>
								<input type = "text" id = "showpAddress" class = "form-control pAddress" placeholder = "원하는 거래 장소를 입력" onclick = "addrSearch();" required />
								<input type = "hidden" id = "pAddress" class = "form-control pAddress" name = "pAddress" />
						</div>
					</div>
					
					
					<div class="col-12 col-md-12">
						<div class="single_product_thumb">
							<div id="mapwrap"> 
								<br />
							    <!-- 지도가 표시될 div -->
							    <div id="map" style="width:100%; height:400px; border : 4px dashed #bcbcbc;">
							    	<p style = "text-align : center;">주소를 입력하면 지도가 표시됩니다.⏎</p>
							    </div>
							</div>
						</div>
					</div>
					
					
					<!-- 썸머노트 -->
					<div class = "col-12 col-md-12">
						<br />
						<textarea name = "pContent" class="summernote" placeholder = "내용 입력" required></textarea>
					</div>
					
					<!-- 주의사항 -->
					<div class = "col-12 col-md-12">
						<br />
						<a href="javascript:void(window.open('${pageContext.request.contextPath }/product/productCaution.do', '_blank', 'width=1000px, height=800px'))">주의 사항 *
						<label for="checkCaution">주의사항을 확인하였습니다. </label></a> <input type="checkbox" id="termCheck" value="0">
					</div>
					<script>
						var check = $("#termCheck").val();
						if(check == 0){
							$("#termCheck").on("click", function(){
								window.open('${pageContext.request.contextPath }/product/productCaution.do', '_blank', 'width=1000px, height=800px');
								$("#termCheck").val(1);
							});
						} else {
							$("#termCheck").attr("readonly", "readonly");
						}
					</script>
				</div>
				<div align="center">
					<button type="button" id="submitBtn" class="btn alazea-btn mt-15">작성 완료</button>
				</div>
			</form>
		</div>
	</div>
<!-- 990 * 800 -->
	
</section>
<!-- ##### Single Product Details Area End ##### -->

	<script>
	
	$(function(){
		$("#submitBtn").on("click", function(){
			if($("#titleImgArea").val() == 0){
				alert("메인 이미지를 등록해주시기 바랍니다.");
				$("#titleImgArea").focus();
			} else if($("#pTitle").val() == ""){
				alert("상품 제목을 등록해주시기 바랍니다.");
				$("#pTitle").focus();
			} else if($("#pPriceComma").val() ==  "") {
				alert("상품 가격을 등록해주시기 바랍니다.");
				$("#pPriceComma").focus();
			} else if($("#pcnoCheck").val() == 9) {
				alert("카테고리를 선택해주시기 바랍니다.");
				$("#pcnoCheck").focus();
			} else if($("#dMethodCheck").val()== 9){
				alert("거래 방식을 선택해주시기 바랍니다.");
				$("#dMethodCheck").focus();
			} else if($("#showpAddress").val() == null){
				alert("주소를 등록해주시기 바랍니다.");
				$("#showpAddress").focus();
			} else {
				if(confirm("상품을 등록하시겠습니까?")){
					$("#productInsert").submit();
				} else {
					alert("등록을 취소합니다.");
				}
			}
		});
	});
	$("#pPriceComma").focusout(function(){
		$("#pPriceOrigin").val($("#pPriceComma").val());
		var origin = $("#pPriceOrigin").val();
		$("#pPriceComma").val(parseInt(origin).toLocaleString());
	});
	
	// 사진 게시판 미리보기 기능 지원 스크립트
		$(function(){
			$('#pImgFileArea').hide();
			
			$('#pImgArea').click(() => {
				$('#titleImgArea').click();
			});
			
			$("#submitBtn").on("click", function(){
				if($("#termCheck").val() == 1){
					$("#productInsert").submit();	
				}
				
			});
		}); 
	</script>
	
	<script>
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
	</script>
	
	<script>	
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
	               url : '${pageContext.request.contextPath}/product/pImgInsert.do', // servlet url
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
	
	</script>
	
	<script>

	
	
	
		/* 주소 검색을 위한 스크립트 */ 
		var showfullAddr; // 화면단에서 보여주기 위한 주소를 입력받는 변수 선언
		var fullAddr;
		
		function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
					/* 지도 생성 */
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
	
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                fullAddr = ''; // 최종 주소 변수
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
	                    showshowfullAddr = fullAddr + (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                    // fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                    	// 이건 주석처리한다. 주소 뒤에 괄호가 추가되면 지도에서 길찾기 url로 넘어갈때 도착지에 주소지를 입력받지 못하기 때문...
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                $('#showpAddress').val(showshowfullAddr);
	                $('#pAddress').val(fullAddr);
	                
	               
			        console.log("입력받은 주소 : " + fullAddr);
			        console.log("보여주기 위해 입력받은 주소 : " + showshowfullAddr); // 사용자에게 보여주기 위한 괄호까지 들어간 주소 

			        
			        
			     	// 주소로 좌표를 검색합니다
			        geocoder.addressSearch(fullAddr, function(result, status) {

			            // 정상적으로 검색이 완료됐으면 
			             if (status === kakao.maps.services.Status.OK) {

			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			                // 결과값으로 받은 위치를 마커로 표시합니다
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });

			                // 인포윈도우로 장소에 대한 설명을 표시합니다
			                var infowindow = new kakao.maps.InfoWindow({
			                    content: '<div style="width:150px;text-align:center;padding:6px 0;">지정한 위치</div>'
			                });
			                infowindow.open(map, marker);

			                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			                map.setCenter(coords);
			                
			            } 
			        });    
			        
			        document.getElementById('map').style.border = "4px solid #bcbcbc";
				 
	            }
	        }).open();
	        
	    };
	</script>


<%@ include file="../common/footer.jsp"%>