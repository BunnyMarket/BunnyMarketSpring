<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>구매자의 거래 확인 페이지</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i> 홈 화면</a></li>
						<li class="breadcrumb-item active" aria-current="page">거래 페이지</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<!-- ##### Checkout Area Start ##### -->
<div class="checkout_area mb-100">
	<form action="${ pageContext.request.contextPath }/deal/dealBuyerChk.do" method="post">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-12 col-lg-7">
					<div class="checkout_details_area clearfix">
						<h5>물품 정보</h5>
						<div class="row">
							<div class="col-4 mb-4">
								<img id="titleImg"
									src="${ pageContext.request.contextPath }/resources/upload/product/${ product.PImg }"
									class="d-block w-100" width="50px" height="50px">
							</div>
							<div class="col-8 mb-4">
								<label for="na8me">물품 제목</label>

								<c:if test="${ product.PType == 1 }">
									<a href="/bunny/product/productDetail.do?pno=${ deal.pno }"
										target="_blank"><p>${ product.PTitle }</p></a>
								</c:if>
								<c:if test="${ product.PType == 2 }">
									<a href="/bunny/auction/auctionDetail.do?pno=${ deal.pno }"
										target="_blank"><p>${ product.PTitle }</p></a>
								</c:if>

							</div>
						</div>
						<hr />
						<h5>내 거래 정보</h5>
						<div class="row">
							<div class="col-md-6 mb-4">
								<label for="name">받는 이 성함 *</label> <input type="text"
									class="form-control" value="${ member.userName }" disabled>
							</div>
							<div class="col-12 mb-4">
								<label for="email_address">이메일 </label> <input type="email"
									class="form-control" id="email_address" name="email"
									value="${ member.email }">
							</div>
							<div class="col-12 mb-4">
								<label for="phone_number">연락처 *</label> <input type="text"
									class="form-control" id="phone_number" name="phone" min="0"
									value="${ member.phone }">
							</div>

							<div class="col-12 mb-4">
								<!-- <input type="radio" name="dMethod" value = "0" /> 거래중지 -->
								<div class="search_by_terms">
									<label for="phone_number">거래수단 *</label>
									<c:if test="${product.DMethod eq 1}">
										<select class="custom-select widget-title" name="dMethod" id = "dMethod" style="width: 100%" disabled="disabled">
		                                  <option value="3">미결정</option>
		                                  <option value="2">택배</option>
		                                  <option value="1" selected="selected">직거래</option>
		                                </select>
									</c:if>
									<c:if test="${product.DMethod eq 2}">
										<select class="custom-select widget-title" name="dMethod" id = "dMethod" style="width: 100%" disabled="disabled">
		                                  <option value="3">미결정</option>
		                                  <option value="2" selected="selected">택배</option>
		                                  <option value="1">직거래</option>
		                                </select>
									</c:if>
									<c:if test="${product.DMethod eq 3}">
		                                <select class="custom-select widget-title" name="dMethod" id = "dMethod" style="width: 100%">
		                                  <option value="" hidden>거래 수단을 선택해주세요.</option>
		                                  <option value="2">택배</option>
		                                  <option value="1">직거래</option>
		                                </select>
	                                </c:if>
	                        	</div>
								
							</div>
							<c:if test="${product.DMethod eq 2}">
								<div class="col-12 mb-4" id = "dAddressDiv">
									<label for="address">주소 *</label> <input type="text"
										name="dAddress1" class="form-control" id="address1" 
										placeholder="주소를 입력하세요." onclick = "addrSearch();"> <br />
									<label for="address">상세 주소 *</label> <input type="text"
										name = "dAddress2" class="form-control" id="address2">
									<input type="hidden" name="dno" id = "dAddressPlus" value = "${ deal.dno }" /> 
								</div>
							</c:if>
							<div class="col-12 mb-4" id = "dAddressDiv" style = "display : none;">
								<label for="address">주소 *</label> <input type="text"
									name="dAddress1" class="form-control" id="address1" 
									placeholder="주소를 입력하세요." onclick = "addrSearch();"> <br />
								<label for="address">상세 주소 *</label> <input type="text"
									name = "dAddress2" class="form-control" id="address2">
								<input type="hidden" name="dno" id = "dAddressPlus" value = "${ deal.dno }" /> 
							</div>
							<!-- <div class="col-md-12 mb-4">
								<label for="order-notes">주문 시 요청 사항</label>
								<textarea class="form-control" id="order-notes" cols="30" rows="10"
									      placeholder="주문 시 요청 사항을 입력해주세요. 예) 경비실에 맡겨주세요.">
							    </textarea>
							</div> -->
							
						</div>


						<hr />
						<h5>판매자 정보</h5>
						<div class="row">
							<div class="col-md-6 mb-4">
								<label for="name">이름</label> <input type="text"
									class="form-control" value="${ other.userName }" disabled>
							</div>
							<div class="col-12 mb-4">
								<label for="name">닉네임</label> <input type="text"
									class="form-control" placeholder="${ other.nickName }" disabled>
							</div>
							<div class="col-12 mb-4">
								<label for="name">연락처</label> <input type="text"
									class="form-control" value="${ other.phone }" disabled>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-4">
					<div class="checkout-content">
						<h5 class="title--">구매 금액</h5>
						<div class="products">
							<div class="products-data">
								<div class="single-products d-flex justify-content-between align-items-center">
									<h5>제품 가격 :</h5>
									<input type="hidden" id="originCarrot" value="${ product.PPrice }"/>
									<h5><span style="color:orange" id="commaCarrot"></span> 당근</h5>
								</div>
							</div>
						</div>
						<c:if test = "${ product.PType == 2 }">
							<div class="subtotal d-flex justify-content-between align-items-center">
								<h5>입찰 가격 :</h5>
								<input type="hidden" id="originBCarrot" value="${ product.BPrice }"/>
								<h5><span style="color:orange" id="BcommaCarrot"></span> 당근</h5>
							</div>
						</c:if>
						<div class="checkout-btn mt-30">
							<button type="submit" class="btn alazea-btn w-100">구매 확인</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
</div>
<!-- ##### Checkout Area End ##### -->

<script type = "text/javascript">

	$(function(){
		$('#dMethod').change(function(){
			if(this.value == 2){
				$('#dAddressDiv').show()
				$('#address1').attr("required", true);
				$('#address2').attr("required", true);
				
				
			} else {
				$('#dAddressDiv').hide();
				$('#address1').attr("required", false);
				$('#address2').attr("required", false);
			}
		});
		$("#commaCarrot").text(parseInt($("#originCarrot").val()).toLocaleString());
		$("#BcommaCarrot").text(parseInt($("#BoriginCarrot").val()).toLocaleString());
	});
  	
  	
</script>




<script>
	//참조 API : http://postcode.map.daum.net/guide
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
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#address1').val(fullAddr);
	
	            // 커서를 상세주소 필드로 이동한다.
	            $('#address2').focus();
	            
	            // $('#dAddress').val($('#address1').val()+$('#address2').val());
	        }
	    }).open();
	};


</script>

<%@ include file="../common/footer.jsp"%>