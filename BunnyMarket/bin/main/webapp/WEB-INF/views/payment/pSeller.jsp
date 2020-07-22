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
							<div class="col-12 mb-4">
								<label for="name">물품 제목</label> <input type="text"
									class="form-control" placeholder="물품 제목입니다요. 여기다가 pTitle가져오세요."
									disabled>
							</div>
							<div class="col-12 mb-4">
								<label for="name">거래 번호</label> <input type="text"
									class="form-control" placeholder="여기다가 거래번호를 입력하시죠." disabled>
							</div>
					</div>
					<hr />
					<h5>내 거래 정보</h5>
					<form action="#" method="post">
						<div class="row">
							<div class="col-md-6 mb-4">
								<label for="name">보낸 이 성함 *</label> <input type="text"
									class="form-control" name="name" required>
							</div>
							<div class="col-12 mb-4">
								<label for="email_address">이메일 </label> <input type="email"
									class="form-control" id="email_address" name="email" value="">
							</div>
							<div class="col-12 mb-4">
								<label for="phone_number">연락처 *</label> <input type="text"
									class="form-control" id="phone_number" name="phone" min="0"
									value="">
							</div>
							<div class="col-12 mb-4">
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
							</div>
							<div class="col-12 mb-4">
								<label for="company">송장 번호*</label> <input type="text"
									class="form-control" id="address" value="" placeholder = "송장번호를 반드시 입력해주세요" required>
							</div>
						</div>
					</form>
					
					<hr />
					<h5>판매자 정보</h5>
					<div class="row">
						<div class="col-md-6 mb-4">
							<label for="name">이름</label> <input type="text"
								class="form-control" placeholder="물품 제목입니다요. 여기다가 pTitle가져오세요."
								disabled>
						</div>
						<div class="col-12 mb-4">
							<label for="name">닉네임</label> <input type="text"
								class="form-control" placeholder="물품 제목입니다요. 여기다가 pTitle가져오세요."
								disabled>
						</div>
						<div class="col-12 mb-4">
							<label for="name">연락처</label> <input type="text"
								class="form-control" placeholder="판매자의 전화번호" disabled>
						</div>
					</div>

				</div>
			</div>

			<div class="col-12 col-lg-4">
				<div class="checkout-content">
					<h5 class="title--">판매 금액</h5>
					<div class="products">
						<div class="products-data">
							<div
								class="single-products d-flex justify-content-between align-items-center">
								<h5>제품 가격 : </h5>
								<h5>여기엔 제품가격(하한가) 적기</h5>
							</div>
						</div>
					</div>
					<div
						class="subtotal d-flex justify-content-between align-items-center">
						<h5>입찰 가격 : </h5>
						<h5>여기엔 입찰가격적기</h5>
					</div>
					<div
						class="shipping d-flex justify-content-between align-items-center">
						<h5>수수료</h5>
						<h5>1,000 won</h5>
					</div>
					<div
						class="order-total d-flex justify-content-between align-items-center">
						<h5>Order Total</h5>
						<h5>입찰가격 - 수수료 won</h5>
					</div>
					<div class="checkout-btn mt-30">
						<a href="#" class="btn alazea-btn w-100">판매 완료</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Checkout Area End ##### -->

<%@ include file="../common/footer.jsp"%>