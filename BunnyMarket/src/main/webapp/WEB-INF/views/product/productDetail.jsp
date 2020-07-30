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

.contents {font-weight:bold;display:block;}




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

						<h4 class="price"><span style="color:orange; font: bold;">${product.PPrice}</span>당근</h4>
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
									댓글<span class="text-muted">(${ pcommentSize })</span>
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
										<h4>${product.PWriter}</h4>
										<h5><a href="#" title="프로필 보기" style="font-size: 17px; color: green;">판매자 프로필 보기</a></h5>
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
									<h4 class="headline">${ pcommentSize } Comments</h4>
									<c:if test = "${ pcommentSize eq 0 }">
										<h5>첫번째 댓글의 주인공이 되어보세요!</h5>
									</c:if>

									<input type="hidden"  id="pcommentSize" value="${ pcommentSize }"/>
									<ol>
										<!-- Single Comment Area -->
										<c:forEach items="${ pcomments }" var="pcomment" varStatus="st">
											<li class="single_comment_area">
												<c:if test = "${ pcomment.pcLevel eq 0}">
													<div id="olPlz-${ pcommentSize }"></div>
													<div class="comment-wrapper d-flex">
														<!-- Comment Meta -->
														<div class="comment-author">
															<img src="${ pageContext.request.contextPath }/resources/img/bg-img/37.jpg" alt=""><!-- member의 대표이미지 경로 적어주기 -->
														</div>
														<!-- Comment Content -->
														<div class="comment-content">
															<input type="hidden" id="pcContent-${st.index}" value="${ pcomment.pcContent }"/>
															<div
																class="d-flex align-items-center justify-content-between">
																<h5>${ pcomment.pcWriter }</h5>
																<span class="comment-date">${ pcomment.pcDate }</span>
															</div>
															<p id="rpcContent-${st.index }">${ pcomment.pcContent }</p>
															<p id="rpcContent2-${st.index }"></p>
															<form id="replyForm-${pcomment.pcmno}" method="post">
																<input type="hidden" name="pno" value="${product.pno }"/>
																<input type="hidden" name="pcmno" value="${pcomment.pcmno}"/>
																<a class="active" href="#" onclick="replyComment(${st.index});">Reply</a>
																<c:if test="${pcomment.pcWriter eq member.userId }">
																		&nbsp;&nbsp;
																		<a class="active" onclick="updateViewComment(${pcomment.pcmno}, ${st.index });">Update</a>
																		&nbsp;&nbsp;
																		<a class="active" onclick="deleteComment(${pcomment.pcmno});">Delete</a>
																</c:if>
															</form>
															<div class="contact-form-area" id="reReplyDiv-${st.index }" style="display: none;">
																<!-- Comment Form -->
																<form action="${pageContext.request.contextPath }/product/pcommentInsert.do" method="post">
																	<input type="hidden" id="commentpno" name="pno" value="${product.pno }"/>
																	<input type="hidden" id="ref_pcmno" name="ref_pcmno" value="${pcomment.pcmno }">
																	<input type="hidden" id="pcLevel" name="pcLevel" value="1">
																	<div class="col-12">
																		<div class="form-group">
																			<textarea class="form-control" name="pcContent"
																					  id="replyComment-${st.index }" cols="30" rows="10" placeholder="Comment"></textarea>
																		</div>
																	</div>
																	<div class="col-12">
																		<button type="submit" class="btn alazea-btn">
																			Post Comment
																		</button>
																	</div>
																</form>
															</div>
															<div class="contact-form-area" id="upReplyDiv-${st.index }" style="display: none;">
																<!-- Comment Form -->
																<input type="hidden" id="ref_pcmno" name="ref_pcmno" value="${pcomment.pcmno }">
																<div class="col-12">
																	<div class="form-group">
																		<textarea class="form-control" name="pcContent"
																				   id="updateComment-${st.index }" cols="30" rows="10" placeholder="Comment"></textarea>
																	</div>
																</div>
																<div class="col-12">
																	<button type="submit" class="btn alazea-btn" onclick="updateComment(${pcomment.pcmno}, ${st.index })">
																		Post Comment
																	</button>
																</div>
															</div>
														</div>
													</div>
													<c:forEach items="${ pcomments }" var="reComment"> <!-- 리댓들 달아주기 -->
														<c:if test = "${ reComment.pcLevel eq 1 and reComment.ref_pcmno eq pcomment.pcmno}">
															<ol class="children">
																<li class="single_comment_area">
																	<div class="comment-wrapper d-flex">
																		<!-- Comment Meta -->
																		<div class="comment-author">
																			<img src="${ pageContext.request.contextPath }/resources/img/bg-img/38.jpg" alt="">
																		</div>
																		<!-- Comment Content -->
																		<div class="comment-content">
																			<div class="d-flex align-items-center justify-content-between">
																				<h5>${ reComment.pcWriter }</h5>
																				<span class="comment-date">${ reComment.pcDate }</span>
																			</div>
																			<p id="repcContent-${st.index }">${ reComment.pcContent }</p>
																			<p id="repcContent2-${st.index }"></p>
																			<c:if test="${pcomment.pcWriter eq member.userId }">
																				<form id="replyForm-${reComment.pcmno}" method="post">
																					<input type="hidden" name="pcmno" value="${reComment.pcmno}">
																					<input type="hidden" name="pno" value="${product.pno }"/>
																					<a class="active" href="#" onclick = "updateReViewComment(${reComment.pcmno}, ${st.index });">Update</a>&nbsp;&nbsp;
																					<a class="active" href="#" onclick = "deleteComment(${reComment.pcmno});">Delete</a>
																				</form>
																			</c:if>
																			<div class="contact-form-area" id="upReReplyDiv-${st.index }" style="display: none;">
																				<!-- Comment Form -->
																				<input type="hidden" id="reContent-${st.index }" value="${ reComment.pcContent }"/>
																				<div class="col-12">
																					<div class="form-group">
																						<textarea class="form-control" name="pcContent"
																								  id="updateReComment-${st.index }" cols="30" rows="10"></textarea>
																					</div>
																				</div>
																				<div class="col-12">
																					<button type="submit" class="btn alazea-btn"  onclick="updateReComment(${reComment.pcmno}, ${st.index })">
																						Post Comment
																					</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
															</ol>
														</c:if>
													</c:forEach>
													
												</c:if>
											</li>
										</c:forEach>
									</ol>
								</div>
								<!-- Comment Area End -->

								<!-- Leave A Comment -->
								<div class="leave-comment-area clearfix">
									<div class="comment-form">
										<h4 class="headline" id = "commentHead">댓글 남기기</h4>

										<div class="contact-form-area">
											<!-- Comment Form -->
											<form action="${pageContext.request.contextPath }/product/pcommentInsert.do" method="post">
												<input type="hidden" id="commentpno" name="pno" value="${product.pno }"/>
												<input type="hidden" id="ref_pcmno" name="ref_pcmno" value="0">
												<input type="hidden" id="pcLevel" name="pcLevel" value="0">
												<div class="col-12"><div class="form-group" id="forMessage"></div></div>
												<div class="col-12">
													<div class="form-group">
														<textarea class="form-control" name="pcContent"
															id="message" cols="30" rows="10" placeholder="Comment"></textarea>
													</div>
												</div>
												<div class="col-12">
													<!-- <button type="submit" class="btn alazea-btn"> -->
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
	    
	/* 
	// geolocation을 통해 사용자 위치 표시를 받아서 판매자와 사용자의 위경도를 받아 url에 한번에 도착지와 출발지로 이어주려고 했지만 
	// 웹용 길찾기 URL에서는 출발지를 지정하는 기능을 현재 제공하지 않는 이유로 도착지만을 지정해주었다. 
	// 그래서 사용자 위치 표시를 위한 geolocation을 쓰는 코드는 주석 처리 
	// 참고 : https://devtalk.kakao.com/t/url/60474
	
	// 사용자 위치 표시 
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            // 인포윈도우에 표시될 내용 
	            message = '<div class = "contents" style="width : 200px; padding:5px;">당신은 지금 여기에 있나요..?</div>'; 
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    //var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
	    var locPosition = coords, // GeoLocation을 사용할 수 없을 때 사용자의 위치를 판매자가 거래하고싶은 위치로 설정해주기 
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}  */
	    
	
	
</script>
<script>
	/* function replyComment1(){
		var pno = $("#Icommentpno").val();
		var ref = $("#Iref_pcmno").val();
		var pcLevel = $("#IpcLevel").val();
		var content = $("#message").val();
		var pCount = $("#pcommentSize").val();
		
		console.log("댓글달기 버튼 클릭");
		console.log(pno);
		$.ajax({
			  data : {
						pno : pno
				 	  , ref_pcmno : ref
				 	  , pcLevel : pcLevel
				 	  , pcContent : content
				 	}
			, url : '${pageContext.request.contextPath }/product/pcommentInserta.do'
			, dataType : 'json'
			, success : function(data){
				if(data.isInsert == true){
					// 인서트 성공하고 level 이 0이면 / 1이면 두가지로 나누어야 함.
					alert("성공" + data.isInsert);
					alert("성공 데이터" + data.pcomment.pcmno);
					$('#commentHead').html('이걸 이렇게?');
					$('#olPlz-${ pcommentSize }').html('<li class="single_comment_area">'
									 	 + '<div class="comment-wrapper d-flex">'
									 	 + '<div class="comment-author">'
									 	 + '<img src="${ pageContext.request.contextPath }/resources/img/bg-img/39.jpg"></div>'
									 	 + '<div class="comment-content">'
									 	 + '<div class="d-flex align-items-center justify-content-between">'
									 	 + '<h5>' + data.pcomment.pcWriter + '</h5>'
									 	 + '<span class="comment-date">' + data.pcomment.pcDate + '</span></div>'
									 	 + '<p id="rpcContent-${st.index }">' + content + '</p>'
									 	 + '<a class="active" href="#">Reply</a>'
									 	 + '</div></div></li>'
										 + '<p id="rpcContent2-${st.index }"></p>'
										 + '<form id="replyForm-${pcomment.pcmno}" method="post">'
										 + '<input type="hidden" name="pno" value="${product.pno }"/>'
										 + '<input type="hidden" name="pcmno" value="${pcomment.pcmno}"/>'
										 + '<a class="active" href="#" onclick="replyComment(${st.index});">Reply</a>'
										 + '<c:if test="${pcomment.pcWriter eq member.userId }">'
										 + '&nbsp;&nbsp;<a class="active" onclick="updateViewComment(${pcomment.pcmno}, ${st.index });">Update</a>'
										 + '&nbsp;&nbsp;<a class="active" onclick="deleteComment(${pcomment.pcmno});">Delete</a>'
										 + '</c:if></form></div></div></li>');
				} else {
					alert("댓글 등록에 실패하였습니다.");
				}
			}, fail : function(data) {
				alert("ajax로 댓글 실패");
			}
		});
	} */
	
	function replyComment(st){
		
		$("#reReplyDiv-"+st).toggle();
		$("#replyComment--"+st).focus();
	}
	
	function updateViewComment(pcmno, st){
		
		var pcContent = $("#pcContent-"+st).val();
		$("#upReplyDiv-"+st).toggle();
		$("#updateComment-"+st).text(pcContent);
	}
	
	function updateComment(pcmno, st){
		var upPcContent = $("#updateComment-"+st).val();
		var updateConfirm = confirm("수정하시겠습니까?");
		
		if(updateConfirm){
			$.ajax({
				  data : {
					  	  pcContent : upPcContent
					  	, pcmno : pcmno
					  }
				, type : 'post'
				, dataType : 'json'
				, url : '${pageContext.request.contextPath}/product/pcommentUpdate.do'
				, success : function(data){
					if(data.updateCheck == true){
						$("#upReplyDiv-"+st).css("display", "none");
						$("#rpcContent-"+st).remove();
						$("#rpcContent2-"+st).text(upPcContent);
					}
					
				}, fail : function(data){
					alert("실패하였습니다.");
				}
			});
		} else {
			alert("수정이 취소되었습니다.");
			$("#upReplyDiv-"+st).css("display", "none");
		}
	}
	
	function updateReViewComment(pcmno, st){
		var pcContent = $("#reContent-"+st).val();
		$("#upReReplyDiv-"+st).toggle();
		$("#updateReComment-"+st).text(pcContent);
	}
	
	function updateReComment(pcmno, st){
		var upPcContent = $("#updateReComment-"+st).val();
		var updateConfirm = confirm("수정하시겠습니까?");
		
		if(updateConfirm){
			$.ajax({
				  data : {
					  	  pcContent : upPcContent
					  	, pcmno : pcmno
					  }
				, type : 'post'
				, dataType : 'json'
				, url : '${pageContext.request.contextPath}/product/pcommentUpdate.do'
				, success : function(data){
					if(data.updateCheck == true){
						$("#upReReplyDiv-"+st).css("display", "none");
						$("#repcContent-"+st).remove();
						$("#repcContent2-"+st).text(upPcContent);
					}
					
				}, fail : function(data){
					alert("실패하였습니다.");
				}
			});
		} else {
			alert("수정이 취소되었습니다.");
			$("#upReReplyDiv-"+st).css("display", "none");
		}
	}
	
	
	function deleteComment(pcmno){
		console.log('삭제 버튼 클릭!');
		if(confirm("정말 삭제하시겠습니까?") == true){
			$("#replyForm-"+pcmno).attr("action", "${pageContext.request.contextPath}/product/pcommentDelete.do").submit();
		} else {
			return;
		}
	}
	

</script>

<%@ include file="../common/footer.jsp"%>