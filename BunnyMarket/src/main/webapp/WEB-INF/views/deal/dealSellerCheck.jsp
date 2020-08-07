<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>판매자 거래 완료 내역</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">거래 완료
							페이지</li>
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
			<div class="col-12">
				<div class="checkout_details_area clearfix">
					<h4>주문 내역</h4>
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
				</div>
			</div>
			<div class="col-12">
				<div class="checkout_details_area clearfix">
					<h4>구매자 정보</h4>
					<div class="row">
						<div class="col-12 mb-4">
							<label for="name">받는 이 성함 : </label>${ member.userName }
						</div>
						<div class="col-12 mb-4">
							<label for="email_address">이메일 : </label>${ member.email }
						</div>
						<div class="col-12 mb-4">
							<label for="phone_number">연락처 : </label>${ member.phone }
						</div>
						<div class="col-12 mb-4">
							<label for="address">주소 : </label>${ deal.DAddress }
						</div>
					</div>
				</div>
			<br />
			<hr />
			</div>

				<!-- <div class="col-md-12 mb-4">
								<label for="order-notes">주문 시 요청 사항</label>
								<textarea class="form-control" id="order-notes" cols="30" rows="10"
									      placeholder="주문 시 요청 사항을 입력해주세요. 예) 경비실에 맡겨주세요.">
							    </textarea>
							</div> -->


			<div class="col-12">
			<br />
				<div class="checkout_details_area clearfix">
					<h4>판매자 정보</h4>
					<div class="row">
						<div class="col-12 mb-4">
							<label for="name">보낸 이 성함 : </label>${ other.userName }
						</div>
						<div class="col-12 mb-4">
							<label for="name">닉네임 : </label>${ other.nickName }
						</div>
						<div class="col-12 mb-4">
							<label for="name">연락처 : </label>${ other.phone }
						</div>
					</div>
				</div>
			</div>

			<div class="col-12">
				<div class="checkout-content">
				<br /><br /><hr />
					<h4 class="title--">구매 금액</h4>
					<div class="products">
						<div class="products-data">
							<div
								class="single-products d-flex justify-content-between align-items-center">
								<h4>제품 가격 :</h4>
								<h4><span style="color:orange" id="PcommaCarrot"></span> 당근</h4>
							</div>
						</div>
					</div>
					<c:if test="${ product.PType == 2 }">
						<div
							class="subtotal d-flex justify-content-between align-items-center">
							<h4>입찰 가격 :</h4>
							<h4><span style="color:orange" class="commaCarrot"></span> 당근</h4>
						</div>
					</c:if>
					<div
						class="order-total d-flex justify-content-between align-items-center">
						<h4>Order Total</h4>
						<c:if test="${ product.PType == 1 }">
							<h4><span style="color:orange" class="commaCarrot"></span> 당근</h4>
						</c:if>
						<c:if test="${ product.PType == 2 }">
							<h4><span style="color:orange" class="commaCarrot"></span> 당근</h4>
						</c:if>
					</div>
				</div>
			</div>
			<div class="checkout-btn mt-30">
				<a href="${ pageContext.request.contextPath }/"
					class="btn alazea-btn mt-15">홈으로</a>
			</div>

		</div>
	</div>
</div>
<!-- ##### Checkout Area End ##### -->

<script>

	var originP = '${product.PPrice}';
	var originB = '${product.BPrice}';
	
	console.log("pPrice" + originP + " / bPrice" +originB);
		
	if(originP > originB){
		$(".commaCarrot").text(parseInt(originP).toLocaleString());
	} else {
		$(".commaCarrot").text(parseInt(originB).toLocaleString());
	}
	$("#PcommaCarrot").text(parseInt(originP).toLocaleString());
</script>
<%@ include file="../common/footer.jsp"%>