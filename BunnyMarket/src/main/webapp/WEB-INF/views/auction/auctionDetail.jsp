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
								data-toggle="tab" role="tab"> 댓글<span class="text-muted">(${pcommentSize })</span>
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

									<ol>
										<!-- Single Comment Area -->
										<c:forEach items="${ pcomments }" var="pcomment" varStatus="st">
											<li class="single_comment_area">
												<c:if test = "${ pcomment.pcLevel eq 0}">
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
																<input type="hidden" name="pno" value="${a.pno }"/>
																<input type="hidden" name="pcmno" value="${pcomment.pcmno}"/>
																<a class="active" onclick="replyComment(${st.index});">Reply</a>
																<c:if test="${pcomment.pcWriter eq member.userId }">
																		&nbsp;&nbsp;
																		<a class="active" onclick="updateViewComment(${pcomment.pcmno}, ${st.index });">Update</a>
																		&nbsp;&nbsp;
																		<a class="active" onclick="deleteComment(${pcomment.pcmno});">Delete</a>
																</c:if>
															</form>
															<div class="contact-form-area" id="reReplyDiv-${st.index }" style="display: none;">
																<!-- Comment Form -->
																<form action="${pageContext.request.contextPath }/auction/pcommentInsert.do" method="post">
																	<input type="hidden" id="commentpno" name="pno" value="${a.pno }"/>
																	<input type="hidden" id="ref_pcmno" name="ref_pcmno" value="${pcomment.pcmno }">
																	<input type="hidden" id="pcLevel" name="pcLevel" value="1">
																	<div class="col-12">
																		<div class="form-group">
																			<textarea class="form-control" name="pcContent"
																					  id="umessage" cols="30" rows="10" placeholder="Comment"></textarea>
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
																					<input type="hidden" name="pno" value="${a.pno }"/>
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
											<form action="${pageContext.request.contextPath }/auction/pcommentInsert.do" method="post">
												<input type="hidden" name="pno" value="${a.pno }"/>
												<input type="hidden" name="ref_pcmno" value="0">
												<input type="hidden" name="pcLevel" value="0">
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
	geocoder.addressSearch('${a.PAddress}', function(result, status) {
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
	    
	    var sellerURL = 'https://map.kakao.com/link/to/${a.PAddress},'+coords.getLat()+','+coords.getLng();
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
	
	function replyComment(st){
		$("#reReplyDiv-"+st).toggle();
		$("#updateComment-"+st).focus();
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
				, url : '${pageContext.request.contextPath}/auction/pcommentUpdate.do'
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
			$("#pcContent-"+st).clear();
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
				, url : '${pageContext.request.contextPath}/auction/pcommentUpdate.do'
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
			$("#repcContent-"+st).clear();
		}
	}
	
	
	function deleteComment(pcmno){
		if(confirm("정말 삭제하시겠습니까?") == true){
			$("#replyForm-"+pcmno).attr("action", "${pageContext.request.contextPath}/auction/pcommentDelete.do").submit();
		} else {
			return;
		}
	}

</script>


<%@ include file="../common/footer.jsp"%>