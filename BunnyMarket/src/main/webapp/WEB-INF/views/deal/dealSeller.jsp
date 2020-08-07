<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>판매자의 거래 확인 페이지</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i>Home</a></li>
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
	<form
		action="${ pageContext.request.contextPath }/deal/dealSellerChk.do"
		method="post">
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
								<label for="name">보낸 이 성함 *</label> <input type="text"
									class="form-control" value="${ member.userName }" required>
								
								<input type="hidden" name="dno" value = "${ deal.dno }" />
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
							<!-- <div class="col-12 mb-4">
								<label for="company">주소</label> <input type="text"
									class="form-control" id="address" value="">
							</div>

							<div class="col-12 mb-4">
								<label for="company">상세 주소</label> <input type="text"
									class="form-control" id="address" value=""> 
							</div>
							<div class="col-12 mb-4">
								<label for="company">택배사</label> <input type="text"
									class="form-control" id="address" value="">
							</div>  -->
							<br /><br />
							<h5>거래수단 : </h5>
							<c:if test = "${ deal.DMethod == 1 }">
								<h5>직거래</h5>
							</c:if>
							
							<c:if test = "${ deal.DMethod == 3 }">
								<h5>미결정</h5>
							</c:if>
							
							<c:if test = "${ deal.DMethod == 2 }">
								<h5>택배거래</h5>
								<div class="col-12 mb-4">
									<label for="company">택배사 *</label> <input type="text"
										class="form-control" id="delNum" name = "delNum1"
										placeholder="택배사를 반드시 입력해주세요" required>
									<label for="company">송장번호 *</label> <input type="text"
										class="form-control" id="delNum" name = "delNum2"
										placeholder="송장번호를 반드시 입력해주세요" required>
								</div>
							</c:if>
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
									class="form-control" value="${ other.nickName }" disabled>
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
						<h5 class="title--">판매 금액</h5>
						<div class="products">
							<div class="products-data">
								<div class="single-products d-flex justify-content-between align-items-center">
									<h5>제품 가격 :</h5>
									<input type="hidden" id="originCarrot" value="${ product.PPrice }"/>
									<h5><span style="color:orange" id="commaCarrot"></span> 당근</h5>
								</div>
							</div>
						</div>
						<c:if test="${ product.PType == 2 }">
							<div class="subtotal d-flex justify-content-between align-items-center">
								<input type="hidden" id="originBCarrot" value="${ product.BPrice }"/>
								<h5><span style="color:orange" id="BcommaCarrot"></span> 당근</h5>
							</div>
						</c:if>
						<div
							class="shipping d-flex justify-content-between align-items-center">
							<h5>수수료</h5>
							<h5><span style="color:orange">10</span> 당근</h5>
						</div>
						<div
							class="order-total d-flex justify-content-between align-items-center">
							<h5>Order Total</h5>
							<c:if test="${ product.PType == 1 }">
								<h5><span style="color:orange" id="TcommaCarrot1"></span> 당근</h5>
							</c:if>
							<c:if test="${ product.PType == 2 }">
								<h5><span style="color:orange" id="TcommaCarrot2"></span> 당근</h5>
							</c:if>
						</div>
						<div class="checkout-btn mt-30">
							<button type="submit" class="btn alazea-btn w-100">판매 확인</button>
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
		$("#commaCarrot").text(parseInt($("#originCarrot").val()).toLocaleString());
		$("#BcommaCarrot").text(parseInt($("#BoriginCarrot").val()).toLocaleString());
		$("#TcommaCarrot1").text(parseInt($("#originCarrot").val()-10).toLocaleString());
		$("#TcommaCarrot2").text(parseInt($("#BoriginCarrot").val()-10).toLocaleString());
	});
  	
  	
</script>

<%@ include file="../common/footer.jsp"%>