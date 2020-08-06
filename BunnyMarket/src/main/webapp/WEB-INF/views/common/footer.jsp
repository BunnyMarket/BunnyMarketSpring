<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area bg-img"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/3.jpg);">
		<!-- Main Footer Area -->
		<div class="main-footer-area">
			<div class="container">
				<div class="row">

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="footer-logo mb-30">
								<a href="#"><img src="${ pageContext.request.contextPath }/resources/img/core-img/bunnyLogo2.png" alt=""></a>
							</div>
							<p>
								당신이 원하던 바로 그 니즈(Needs) <br />
								우리 바니마켓에서 해결해보세요!
							</p>
							<div class="social-info">
								<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="widget-title">
								<h5>QUICK LINK</h5>
							</div>
							<nav class="widget-nav">
								<ul>
									<li><a href="${ pageContext.request.contextPath }/product/productList.do">일반 상품</a></li>
									<li><a href="${ pageContext.request.contextPath }/QNA/FAQ.do">F.A.Q</a></li>
									<li><a href="${ pageContext.request.contextPath }/auction/auctionList.do">경매 상품</a></li>
									<li><a href="${ pageContext.request.contextPath }/notice/mNotice.do">공지사항</a></li>
									<li><a href="${ pageContext.request.contextPath }/product/productListMap.do">지도로 보기</a></li>
									<li><a href="${ pageContext.request.contextPath }/QNA/QNAList.do">Q & A</a></li>
									<li><a href="${ pageContext.request.contextPath }/report/reportList.do">신고하기</a></li>
									<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
								</ul>
							</nav>
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="widget-title">
								<h5>BEST SELLER</h5>
							</div>

							<!-- Single Best Seller Products -->
							<div class="single-best-seller-product d-flex align-items-center">
								<div class="product-thumbnail">
									<a href="shop-details.html"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/4.jpg"
										alt=""></a>
								</div>
								<div class="product-info">
									<a href="shop-details.html">Cactus Flower</a>
									<p>$10.99</p>
								</div>
							</div>

							<!-- Single Best Seller Products -->
							<div class="single-best-seller-product d-flex align-items-center">
								<div class="product-thumbnail">
									<a href="shop-details.html"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/5.jpg"
										alt=""></a>
								</div>
								<div class="product-info">
									<a href="shop-details.html">Tulip Flower</a>
									<p>$11.99</p>
								</div>
							</div>
						</div>
					</div>

					<!-- Single Footer Widget -->
					<div class="col-12 col-sm-6 col-lg-3">
						<div class="single-footer-widget">
							<div class="widget-title">
								<h5>CONTACT</h5>
							</div>

							<div class="contact-information">
								<p>
									<span>Address:</span> 서울특별시 강남구 강남구 테헤란로14길 6
								</p>
								<p>
									<span>Phone:</span> +82 010 8282 8282
								</p>
								<p>
									<span>Email:</span> bunnyYaho@naver.com
								</p>
								<p>
									<span>Open hours:</span> Mon - Sun: 9 AM to 6 PM
								</p>
								<p>
									<span>Happy hours:</span> Sat: 1 PM to 2 PM
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer Bottom Area -->
		<div class="footer-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="border-line"></div>
					</div>
					<!-- Copywrite Text -->
					<div class="col-12 col-md-6">
						<div class="copywrite-text">
							<p>
								&copy;
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								
								<!-- 지도 마커 png이미지 출처 표기(이미지 출처 표기하래..ㅠ 아니면 고소당한대 ㅠ ) -->
								<a href='https://pngtree.com/so/자료-좀'>자료-좀 png from pngtree.com</a>
								
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/active.js"></script>
</body>

</html>