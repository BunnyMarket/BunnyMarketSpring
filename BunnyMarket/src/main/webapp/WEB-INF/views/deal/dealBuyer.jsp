<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>거래 페이지</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
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
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-12 col-lg-7">
				<div class="checkout_details_area clearfix">
					<h5>물품 정보</h5>
					<div class="row">
							<div class="col-4 mb-4">
								<img id="titleImg" src="${ pageContext.request.contextPath }/resources/upload/product/${ product.PImg }" class="d-block w-100" width="50px"
									height="50px">
							</div>
							<div class="col-8 mb-4">
								<label for="na8me">물품 제목</label>
								
								<c:if test = "${ product.PType == 1 }">
									<a href="/bunny/product/productDetail.do?pno=${ deal.pno }" target = "_blank" ><p>${ product.PTitle }</p></a> 
								</c:if>
								<c:if test = "${ product.PType == 2 }">
									<a href="/bunny/auction/auctionDetail.do?pno=${ deal.pno }" target = "_blank" ><p>${ product.PTitle }</p></a> 
								</c:if>
							
							</div>
					</div>
					<hr />
					<h5>내 거래 정보</h5>
					<form action="#" method="post">
						<div class="row">
							<div class="col-md-6 mb-4">
								<label for="name">받는 이 성함 *</label> 
								<input type="text"
									   class="form-control" value = "${ member.userName }" disabled>
							</div>
							<div class="col-12 mb-4">
								<label for="email_address">이메일 </label> 
								<input type="email"
									   class="form-control" id="email_address" name="email" value="${ member.email }">
							</div>
							<div class="col-12 mb-4">
								<label for="phone_number">연락처 *</label> 
								<input type="text"
									   class="form-control" id="phone_number" name="phone" min="0"
									   value="${ member.phone }">
							</div>
							<div class="col-12 mb-4">
								<label for="company">주소 *</label> 
								<input type="text" name = "email"
									   class="form-control" id="address" placeholder = "주소를 입력하세요.">
							</div>

							<div class="col-12 mb-4">
								<label for="company">상세 주소 *</label> 
								<input type="text"
									   class="form-control" id="address" value="">
							</div>
							<div class="col-md-12 mb-4">
								<label for="order-notes">주문 시 요청 사항</label>
								<textarea class="form-control" id="order-notes" cols="30" rows="10"
									      placeholder="주문 시 요청 사항을 입력해주세요. 예) 경비실에 맡겨주세요.">
							    </textarea>
							</div>
						</div>
					</form>
					
					<hr />
					<h5>판매자 정보</h5>
					<div class="row">
						<div class="col-md-6 mb-4">
							<label for="name">이름</label> <input type="text"
								class="form-control" value="${ other.userName }"
								disabled>
						</div>
						<div class="col-12 mb-4">
							<label for="name">닉네임</label> <input type="text"
								class="form-control" placeholder="${ other.nickName }"
								disabled>
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
							<div
								class="single-products d-flex justify-content-between align-items-center">
								<h5>제품 가격 : </h5>
								<h5>${ product.PPrice }</h5>
							</div>
						</div>
					</div>
					<div
						class="subtotal d-flex justify-content-between align-items-center">
						<h5>입찰 가격 : </h5>
						<h5>${ product.PPrice }</h5>
					</div>
					<div
						class="shipping d-flex justify-content-between align-items-center">
						<h5>수수료</h5>
						<h5>1,000 won</h5>
					</div>
					<div
						class="order-total d-flex justify-content-between align-items-center">
						<h5>Order Total</h5>
						<h5>${ product.PPrice + 1000} won</h5>
					</div>
					<div class="checkout-btn mt-30">
						<a href="#" class="btn alazea-btn w-100">주문 확인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Checkout Area End ##### -->

<%@ include file="../common/footer.jsp"%>