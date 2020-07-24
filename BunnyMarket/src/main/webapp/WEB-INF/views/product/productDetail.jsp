<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>
<style>
/* 커스텀 오버레이  */
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

/* 좌표로 주소 띄우기위한 css */
.map_wrap {position:relative;width:100%;height:350px;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

</style>
<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>상품 상세보기</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }"><i
								class="fa fa-home"></i> 홈화면</a></li>
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/views/product/productList.jsp">상품</a></li>
						<li class="breadcrumb-item active" aria-current="page">상품
							상세보기</li>
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
			<div class="row justify-content-between">
				<div class="col-12 col-md-6 col-lg-5">
					<div class="single_product_thumb">
						<div>
							<div id="pImgArea">
								<img id="titleImg" src="${ pageContext.request.contextPath }/resources/upload/product/${ product.PImg }" class="d-block w-100" width="344.8px"
									height="357.56px">
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-6">
					<div class="single_product_desc">
						<h4 class="title">${ product.PTitle }</h4>
						<button type="button" class="btn alazea-btn mt-15"
							style="float: right"
							onclick="location.href='${ pageContext.request.contextPath }/product/productView.do?pno=${ product.pno }'">수정하기</button>
						<br />

						<h4 class="price">${ product.PPrice } won</h4>
						<br />

						<h5>글 작성날짜</h5>
						<p>${ product.PDate }</p>
						<br />

					</div>
				</div>
			</div>
			<br /><br />
			<div class="row justify-content-between">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item">
								<a href="#description" class="nav-link active" data-toggle="tab" role="tab">상세 설명</a>
							</li>
							<li class="nav-item">
								<a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">추가 정보</a>
							</li>
							<li class="nav-item">
								<a href="#reviews" class="nav-link" data-toggle="tab" role="tab">
									댓글<span class="text-muted">(1)</span>
								</a>
							</li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<!-- 썸머노트 -->
									<div class="col-12 col-md-12">
										<br /> <br />
										<p>${ product.PContent }</p>
									</div>
									<br /><br />
									<hr />
									<div class="col-12">
										<br /> <br />
										<h4>판매자의 직거래 선호 지역</h4>
										<div class="map_wrap">
											<div id="map" style="width:100%; height: 460px; position:relative;overflow:hidden;"></div>
										</div>
										<br /><br /><br /><br /><br /><br />
									</div>

								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="addi-info">
								<div class="additional_info_area">
									<div class="col-12 col-md-6">
										<br /> <br />
										<h4>판매자 정보</h4>
										<!-- 여기다가 판매자 정보 적어주기 -->
									</div>
									<div class="col-12 col-md-12">
										<br /> <br />
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<!-- Comment Area Start -->
								<div class="comment_area clearfix">
									<h4 class="headline">2 Comments</h4>

									<ol>
										<!-- Single Comment Area -->
										<li class="single_comment_area">
											<div class="comment-wrapper d-flex">
												<!-- Comment Meta -->
												<div class="comment-author">
													<img src="${ pageContext.request.contextPath }/resources/img/bg-img/37.jpg" alt="">
												</div>
												<!-- Comment Content -->
												<div class="comment-content">
													<div
														class="d-flex align-items-center justify-content-between">
														<h5>Simona Halep</h5>
														<span class="comment-date">09:00 AM, 20 Jun 2018</span>
													</div>
													<p>Neque porro quisquam est, qui dolorem ipsum quia
														dolor sit amet, consectetu adipisci velit, sed quia non
														numquam eius modi</p>
													<a class="active" href="#">Reply</a>
												</div>
											</div>
											<ol class="children">
												<li class="single_comment_area">
													<div class="comment-wrapper d-flex">
														<!-- Comment Meta -->
														<div class="comment-author">
															<img src="${ pageContext.request.contextPath }/resources/img/bg-img/38.jpg" alt="">
														</div>
														<!-- Comment Content -->
														<div class="comment-content">
															<div
																class="d-flex align-items-center justify-content-between">
																<h5>Rafael Nadal</h5>
																<span class="comment-date">09:30 AM, 20 Jun 2018</span>
															</div>
															<p>Neque porro quisquam est, qui dolorem ipsum quia
																dolor sit amet, consectetu adipisci velit, sed quia non
																numquam eius modi</p>
															<a class="active" href="#">Reply</a>
														</div>
													</div>
												</li>
											</ol>
										</li>
										<li class="single_comment_area">
											<div class="comment-wrapper d-flex">
												<!-- Comment Meta -->
												<div class="comment-author">
													<img src="${ pageContext.request.contextPath }/resources/img/bg-img/39.jpg" alt="">
												</div>
												<!-- Comment Content -->
												<div class="comment-content">
													<div
														class="d-flex align-items-center justify-content-between">
														<h5>Maria Sharapova</h5>
														<span class="comment-date">02:20 PM, 20 Jun 2018</span>
													</div>
													<p>Neque porro quisquam est, qui dolorem ipsum quia
														dolor sit amet, consectetu adipisci velit, sed quia non
														numquam eius modi</p>
													<a class="active" href="#">Reply</a>
												</div>
											</div>
										</li>
									</ol>
								</div>
								<!-- Comment Area End -->

								<!-- Leave A Comment -->
								<div class="leave-comment-area clearfix">
									<div class="comment-form">
										<h4 class="headline">Leave A Comment</h4>

										<div class="contact-form-area">
											<!-- Comment Form -->
											<form action="#" method="post">
												<div class="col-12">
													<div class="form-group">
														<textarea class="form-control" name="message"
															id="message" cols="30" rows="10" placeholder="Comment"></textarea>
													</div>
												</div>
												<div class="col-12">
													<button type="submit" class="btn alazea-btn">
														Post Comment
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Leave A Comment End -->
							</div>
						</div>
						<!-- Tab Content End -->
					</div>
				</div>
			</div>
			<!-- Row and -->
		</div>
	</div>


</section>
<!-- ##### Single Product Details Area End ##### -->

<script>
		
	// 지도 넣기 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	var coords; // 주소로 좌표를 받을 변수 선언
	
	var imageSrc = 'https://www.pngrepo.com/png/264372/79/easter-bunny-rabbit.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${product.PAddress}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	    	coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		}
	    
	    
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords,
	        image: markerImage
	        
	    });
	    
	 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    var content = '<div class="customoverlay">' +
	        		  '  <a href="https://map.kakao.com/?q=${product.PAddress}" target="_blank">' +
	       			  '    <span class="title">판매자가 거래를 원하는 지역</span>' +
	       			  '  </a>' +
	       			  '</div>';

	    // 커스텀 오버레이가 표시될 위치입니다 
	    var position = coords;  

	    // 커스텀 오버레이를 생성합니다
	    var customOverlay = new kakao.maps.CustomOverlay({
	        map: map,
	        position: position,
	        content: content,
	        yAnchor: 1 
	    });
	
	    /* // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        				content: '<div style="width:180px;text-align:center;padding:6px 0;">거래자가 원하는 거래 지역</div>'
		});
		infowindow.open(map, marker);  */
	
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
		
	    
	});
	    
	
	
</script>


<%@ include file="../common/footer.jsp"%>