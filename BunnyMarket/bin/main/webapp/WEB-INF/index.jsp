<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="views/common/header.jsp"/>
<!-- ##### Hero Area Start ##### -->
<section class="hero-area">
	<div class="hero-post-slides owl-carousel">

		<!-- Single Hero Post -->
		<div class="single-hero-post bg-overlay">
			<!-- Post Image -->
			<div class="slide-img bg-img"
				style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/1.jpg);"></div>
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<!-- Post Content -->
						<div class="hero-slides-content text-center">
							<h2>Welcome. Bunny Market</h2>
							<p>
								<span><b>바</b></span>로, 당신의 <span><b>니</b></span>즈가 존재하는 마켓<br />
								좋은 제품 안전하게 구매하세요 
							</p>
							<div class="welcome-btn-group">
								<a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
									href="#" class="btn alazea-btn active">CONTACT US</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Single Hero Post -->
		<div class="single-hero-post bg-overlay">
			<!-- Post Image -->
			<div class="slide-img bg-img"
				style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/2.jpg);"></div>
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<!-- Post Content -->
						<div class="hero-slides-content text-center">
							<h2>Welcome. Bunny Market</h2>
							<p>
								<span><b>바</b></span>로, 당신의 <span><b>니</b></span>즈가 존재하는 마켓<br />
								좋은 제품 안전하게 구매하세요 
							</p>
							<div class="welcome-btn-group">
								<a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
									href="#" class="btn alazea-btn active">CONTACT US</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</section>
<!-- ##### Hero Area End ##### -->

<!-- ##### Product Area Start ##### -->
<section class="new-arrivals-products-area bg-white section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center">
					<h2>일반 상품</h2>
					<p>현재 판매중인 일반 판매 상품입니다.</p>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/9.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>
			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="200ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/10.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="300ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/11.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="400ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/12.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<div class="col-12 text-center">
				<a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp" class="btn alazea-btn">더보기</a>
			</div>

		</div>
	</div>
</section>
<!-- ##### Product Area End ##### -->
<!-- ##### Product Area Start ##### -->
<section class="new-arrivals-products-area bg-gray section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center">
					<h2>경매상품</h2>
					<p>현재 진행중인 경매 상품입니다.</p>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/9.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <p>경매 참가자 : 1명</p>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>
			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="200ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/10.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <p>경매 참가자 : 1명</p>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="300ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/11.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <p>경매 참가자 : 1명</p>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="400ms">
                    <!-- Product Image -->
                    <div class="product-img">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                        	<img src="${ pageContext.request.contextPath }/resources/img/bg-img/12.jpg" alt="">
                        </a>
                        <!-- Product Tag -->
                        <div class="product-tag">
                            <a href="#">Hot</a>
                        </div>
                        <div class="product-meta d-flex">
                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                        </div>
                    </div>
                    <!-- Product Info -->
                    <div class="product-info mt-15 text-center">
                        <a href="${ pageContext.request.contextPath }/views/auction/auctionDetail.jsp">
                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                        </a>
                        <p>경매 참가자 : 1명</p>
                        <h6>10,000원</h6>
                    </div>
                </div>
            </div>

			<div class="col-12 text-center">
				<a href="${ pageContext.request.contextPath }/views/auction/auctionList.jsp" class="btn alazea-btn">더보기</a>
			</div>

		</div>
	</div>
</section>
<!-- ##### Product Area End ##### -->


<!-- ##### Testimonial Area Start ##### -->
<section class="testimonial-area section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="testimonials-slides owl-carousel">

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img src="${ pageContext.request.contextPath }/resources/img/bg-img/13.jpg" alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>TESTIMONIAL</h2>
										<p>Some kind words from clients about Alazea</p>
									</div>
									<p>“Alazea is a pleasure to work with. Their ideas are
										creative, they came up with imaginative solutions to some
										tricky issues, their landscaping and planting contacts are
										equally excellent we have a beautiful but also manageable
										garden as a result. Thank you!”</p>
									<div class="testimonial-author-info">
										<h6>Mr. Nick Jonas</h6>
										<p>CEO of NAVATECH</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img src="${ pageContext.request.contextPath }/resources/img/bg-img/14.jpg" alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>TESTIMONIAL</h2>
										<p>Some kind words from clients about Alazea</p>
									</div>
									<p>“Alazea is a pleasure to work with. Their ideas are
										creative, they came up with imaginative solutions to some
										tricky issues, their landscaping and planting contacts are
										equally excellent we have a beautiful but also manageable
										garden as a result. Thank you!”</p>
									<div class="testimonial-author-info">
										<h6>Mr. Nazrul Islam</h6>
										<p>CEO of NAVATECH</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img src="${ pageContext.request.contextPath }/resources/img/bg-img/15.jpg" alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>TESTIMONIAL</h2>
										<p>Some kind words from clients about Alazea</p>
									</div>
									<p>“Alazea is a pleasure to work with. Their ideas are
										creative, they came up with imaginative solutions to some
										tricky issues, their landscaping and planting contacts are
										equally excellent we have a beautiful but also manageable
										garden as a result. Thank you!”</p>
									<div class="testimonial-author-info">
										<h6>Mr. Jonas Nick</h6>
										<p>CEO of NAVATECH</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- ##### Testimonial Area End ##### -->



<c:import url="views/common/footer.jsp"/>
