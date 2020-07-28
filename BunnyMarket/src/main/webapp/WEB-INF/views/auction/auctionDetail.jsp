<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>

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
							href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i> 홈화면</a></li>
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/auction/auctionList.do">경매</a></li>
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
<c:set value="${auction}" var="a" />
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">

			<div class="row justify-content-between">
				<div class="col-12 col-md-6 col-lg-5">
					<div class="single_product_thumb">
						<div>
							<div id="pImgArea">
								<img id="titleImg" class="d-block w-100" width="344.8px"
									src="${pageContext.request.contextPath}/resources/upload/auction/${a.PImg}"
									height="357.56px">
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="single_product_desc">
						<h3 class="title">${a.PTitle}</h3>
						<c:if test="${sessionScope.member.userId ne a.PWriter}">
							<button type="button" class="btn alazea-btn mt-15" style="float: right" id="bidding" 
									data-toggle="modal" data-target="#myModal">
								입찰하기
							</button>
						</c:if>
						<c:if test="${sessionScope.member.userId eq a.PWriter}">
							<button type="button" class="btn alazea-btn mt-15" style="float: right" id="giveBidder" 
									data-toggle="modal" data-target="#myModal">
								입찰자 명단 보기
							</button>
						</c:if>
						<div class="modal-layout"></div>
						<br />
						
						<c:if test="${a.PPrice gt a.BPrice }">
                        	<h4 class="price"><span style="color:orange; font: bold;">${a.PPrice}</span>당근</h4>
						</c:if>
						<c:if test="${a.PPrice lt a.BPrice }">
                        	<h4 class="price"><span style="color:orange; font: bold;">${a.BPrice}</span>당근</h4>
						</c:if>
						
						<br /> 

						<h5>총 입찰자 : ${bCount}명</h5>
						<br />
						
						<h5>경매 시작일</h5>
						<h5>${a.PDate }</h5>
						<br />

						<h5>경매 종료일</h5>
						<h5>${a.aeDate}</h5>
						<br />

					</div>
				</div>
			</div>
			<div class="row justify-content-between">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#description"
								class="nav-link active" data-toggle="tab" role="tab">상세 설명</a></li>
							<li class="nav-item"><a href="#addi-info" class="nav-link"
								data-toggle="tab" role="tab">추가 정보</a></li>
							<li class="nav-item"><a href="#reviews" class="nav-link"
								data-toggle="tab" role="tab"> 댓글<span class="text-muted">(1)</span>
							</a></li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active"
								id="description">
								<div class="description_area">
									<!-- 썸머노트 -->
									<div class="col-12 col-md-12">
										<br /> <br />
										<p>${a.PContent}</p>
									</div>
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
										<h4>${a.PWriter}</h4>
										
										<button type="button" class="btn btn-outline-secondary" id="sellerInfo" data-toggle="modal" data-target="#handleModal">프로필 보기</button>
										<br />
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
													<img
														src="${ pageContext.request.contextPath }/resources/img/bg-img/37.jpg"
														alt="">
												</div>
												<!-- Comment Content -->
												<div class="comment-content">
													<div class="d-flex align-items-center justify-content-between">
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
															<img
																src="${ pageContext.request.contextPath }/resources/img/bg-img/38.jpg"
																alt="">
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
													<img
														src="${ pageContext.request.contextPath }/resources/img/bg-img/39.jpg"
														alt="">
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
														<textarea class="form-control" name="message" id="message"
															cols="30" rows="10" placeholder="Comment"></textarea>
													</div>
												</div>
												<div class="col-12">
													<button type="submit" class="btn alazea-btn">Post
														Comment</button>
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
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">입찰</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<form action="${pageContext.request.contextPath}/auction/insertBidder.do" method="post">
				<input type="hidden" name="pno" value="${a.pno }" />
				<div class="modal-body row">
					<div class="col-12">
					<c:if test="${a.PPrice gt a.BPrice }">
						<h4>현재 상품의 가격 : <span style="color:orange; font: bold;">${a.PPrice }</span>당근</h4>
					</c:if>
					<c:if test="${a.PPrice lt a.BPrice }">
						<h4>현재 상품의 가격 : <span style="color:orange; font: bold;">${a.BPrice }</span>당근</h4>
					</c:if>
						<br />
					</div>
					<div class="col-12">
						<div class="form-group">
							<h4 class="title">입찰금액을 입력해주세요.</h4>
							<input type="text" class="form-control" name="bPrice" id="contact-subject" style="border: 1px solid #e1e1e1;" />
							<br />
						</div>
					</div>
					<div class="col-12">
						<h5>경매 시작일</h5>
						<h5>${a.PDate }</h5>
						<br />
					</div>
					<div class="col-12">
						<h5>경매 종료일</h5>
						<h5>${a.aeDate}</h5>
						<br />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn alazea-btn mt-15" style="float: right">입찰하기</button>
					<button type="button" class="btn alazea-btn mt-15" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content" >
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">입찰자 명단보기</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<form>
				<input type="hidden" name="pno" value="${a.pno }" />
				<div class="modal-body row">
					<div class="col-12">
						<h4>등록한 상품의 가격 : <span style="color:orange; font: bold;">${a.PPrice }</span>당근</h4>
						<h4>현재 상품의 가격 : <span style="color:orange; font: bold;">${a.BPrice }</span>당근</h4>
						<hr />
					</div>
					<c:forEach items="${bList }" var="b" varStatus="bst">
						<div class="col-12">
							<h5><span style="font: bold; color: orange;">${bst.index +1 }.</span> 입찰자 닉네임 : ${b.userId}</h5>
							<h5>입찰금액 : ${b.BPrice}</h5>
							<br />
						</div>
					</c:forEach>
					<div class="col-12">
						<h5>경매 시작일</h5>
						<h5>${a.PDate }</h5>
						<br />
					</div>
					<div class="col-12">
						<h5>경매 종료일</h5>
						<h5>${a.aeDate}</h5>
						<br />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn alazea-btn mt-15" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ##### Single Product Details Area End ##### -->


<script>
		
	//지도 넣기 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	var coords; // 주소로 좌표를 받을 변수 선언
	var sellerLat;
	var sellerLong;
	
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
	    	/*
	    		sellerLat = result[0].y;
	    		sellerLong = result[0].x;
	    		
	    		coords.getLat(), .getLng()으로 위경도를 가져올 수 있다. 
	    	*/
		}
	    
	    
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords,
	        image: markerImage
	        
	    });
	    
	    /* console.log("coords : " + coords);
	    console.log("lat : " + sellerLat);
	    console.log("long : " + sellerLong); */
	    
	    var sellerURL = 'https://map.kakao.com/link/to/${product.PAddress},'+coords.getLat()+','+coords.getLng();
	    // console.log(sellerURL); 
	    
	 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    var content = '<div class="customoverlay">' +
	        		  '  <a href="' + sellerURL + '" target="_blank">' +
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
	
	// 취소시 모달창만 꺼지게 하는기능
	function goBack(){
		window.history.go();
	}
	$(function(){
		$("#bidding").click(function(){
			$('#myModal1').modal();
		});
	});
	$(function(){
		$("#giveBidder").click(function(){
			$('#myModal2').modal();
		});
	});
	$(function(){
		$(".modal-layout").click(function(){
			$('.modal').modal('hide');
		});
	});
	
	$('#sellerInfo').click(function(){
		/* $('#sellerName').text('${a.PWriter}'); */
		$.ajax({
			  data : {nickName : '${a.PWriter}'}
			, url : "${ pageContext.request.contextPath }/member/sellerProfile.do"
			, dataType : "Json"
			, success : function(data){
				
				
				/* $.each(result , function(idx, val) {
					console.log(idx + " " + val.introduce);
				}); */
				var photo = data.member.photo;
				$('#sellerName').text(data.member.nickName);
				$('#sellerIntroduce').text(data.member.introduce);
				$('#sellerPhoto').attr('src','/bunny/resources/member/profile/'+photo);
				console.log(data.member.nickName);
				console.log(data.member.introduce);
				console.log(photo);
			}, fail : {
				
			}
		});
		
	});
	
	

</script>


<%@ include file="../common/footer.jsp"%>