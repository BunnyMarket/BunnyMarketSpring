<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
	/* .modal {text-align: center;
	@media screen and (min-width: 768px) { 
    .adminwarning:before {display: inline-block;vertical-align: middle;content: " ";height: 100%;}}
	.modal-dialog {display: inline-block;text-align: left;vertical-align: middle;}
	 */
	.wblur{-webkit-filter:blur(5px);-moz-filter:blur(5px);-o-filter:blur(5px);-ms-filter:blur(5px);filter:blur(5px);}
	.disabledbutton { pointer-events: none;opacity: 0.4;}
	.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}


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
						<li class="breadcrumb-item">
							<a href="${ pageContext.request.contextPath }/"> <i class="fa fa-home"></i> Home</a>
						</li>
						<li class="breadcrumb-item">
							<a href="${ pageContext.request.contextPath }/product/productList.do">상품</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">상품 상세보기</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->

<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area mb-50" >
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

						<!-- 판매자 -->
						<c:if test="${sessionScope.member.nickName eq product.PWriter}">
							
							<c:if test="${product.PStatus == 2 or product.PStatus == 3}">
								<button type = "button" class="btn alazea-btn mt-15" style="float: right" disabled>축하해요! 구매가 완료되었네요!</button>  <!-- pstatus 2 or 3-->
								<br /><br /><br />
								<%-- <c:if test="${product.PStatus == 2}"> --%>
									<c:if test="${dno ne 0 }"> 
										<button type = "button" class="btn alazea-btn mt-15" style="float: right" onclick="goDealPlz();">거래페이지로 이동</button> <!-- pstatus2 or 3-->
										<br /><br /><br />
									</c:if>
								<%-- </c:if> --%>
							</c:if>
							
							<c:if test="${product.PStatus == 1}">
								<button type="button" class="btn alazea-btn mt-15" style="float: right" onclick="location.href='${ pageContext.request.contextPath }/product/productView.do?pno=${ product.pno }'">수정하기</button>
							</c:if>
						
						</c:if>
						
						<!-- 구매자-->
						<c:if test="${sessionScope.member.nickName ne product.PWriter}">
							<c:if test = "${sessionScope.member.nickName eq product.PBuyer}">
								<c:if test="${product.PStatus == 2}">
									<button type = "button" class="btn alazea-btn mt-15" style="float: right" onclick="goDealPlz();">거래페이지로 이동</button>
									<br /><br /><br />
									
									
									<c:if test="${reCount == 0}">
										<button type="button" onclick="goReview();" class="btn alazea-btn mt-15" style="float: right">리뷰 작성하러 가기</button>
										<br/><br/><br/>
									</c:if>	
								
								</c:if>
							</c:if>
							
							<c:if test="${product.PStatus == 1}">
								<c:if test="${dno ne 0 }">
									<button type="button" class="btn alazea-btn mt-15" style="float: right" id="bidding" data-toggle="modal" onclick="goBuy();"> 구매하기 </button>
									<button type="button" class="btn alazea-btn mt-15" style="float: right" onclick="location.href='${ pageContext.request.contextPath }/love/loveInsert.do?pno=${product.pno}'">찜하기</button>
									<button type="button" class="btn alazea-btn mt-15" style="float: right" onclick="location.href='${ pageContext.request.contextPath }/report/reportInsertView.do?pno=${ product.pno }&pTitle=${ product.PTitle }'">신고하기</button>
									<br /><br /><br />
								</c:if>
							</c:if>
						
						</c:if>
						
						<c:if test="${!empty admin}">
							<button type="button" id="warn" class="btn alazea-btn mt-15" style="float: right">잠금</button>
						</c:if>
							
						<input type="hidden" id="originPPrice" value="${product.PPrice}"/>
						<h4 class="price"><span id="pCarrot" style="color:orange; font: bold;"></span>당근</h4>
						<br />
						
						<h4>카테고리</h4>
						<h5 style="color:orange; font: bold;">${product.PCategory}</h5>
						<br />
						
						<h4>거래방식</h4>
						<h5 style="color:orange; font: bold;" id="dMethod"></h5>
						<br />
						
						<h4>글 작성날짜</h4>
						<h5 style="color:orange; font: bold;">${ product.PDate }</h5>
						<br />

						<script type="text/javascript">
						   	$(function(){
								var originP = $("#originPPrice").val();
					    		$("#pCarrot").text(parseInt(originP).toLocaleString());
					    		
					    		var dMethod = '${product.DMethod}';
					    		if(dMethod == 1){
					    			$("#dMethod").text("직거래");
					    		} else if(dMethod == 2){
					    			$("#dMethod").text("택배");
					    		} else {
					    			$("#dMethod").text("미결정");
					    		}
						   	});
						   	
						</script>
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
										<%-- <c:if test="${seller.photo == null }">
											<img src="/bunny/resources/img/usericon.png" id="userImg" class="circleImg" width="150px" height="150px"
											alt="userImg" />
										</c:if> --%>
										<%-- <c:if test="${seller.photo != null }"> --%>
											<img src="/bunny/resources/member/profile/${seller.photo}" id="userImg" class="circleImg" width="150px" height="150px"
											alt="userImg"/>
										<%-- </c:if> --%> <br />
										<button type="button" class="btn alazea-btn mt-15"  id="sellerInfo" data-toggle="modal" data-target="#handleModal">프로필 보기</button> <br/>
										<button type="button" class="btn alazea-btn mt-15"  id="sellerReview" onclick="location.href='${pageContext.request.contextPath }/review/sellerReview.do?userId=${product.PWriter}'">판매자 리뷰</button> <br/>
										<button type="button" class="btn alazea-btn mt-15"  id="sellerProductList" onclick="location.href='${ pageContext.request.contextPath }/member/sellerTradeView.do?nickName=${product.PWriter}'" class="btn btn-success">판매중인 상품 보기</button>
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
															<c:if test="${sellerPhoto == null }">
																<img src="/bunny/resources/img/usericon.png" id="userImg" class="circleImg" width="150px" height="150px"
																alt="userImg" />
															</c:if>
															<c:if test="${sellerPhoto != null }">
																<img src="/bunny/resources/member/profile/${ sellerPhoto }" id="userImg" class="circleImg" width="150px" height="150px"
																alt="userImg"/>
															</c:if> <br />
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
																			<c:if test="${userImg == null }">
																				<img src="/bunny/resources/img/usericon.png" id="userImg" class="circleImg" width="150px" height="150px"
																				alt="userImg" />
																			</c:if>
																			<c:if test="${userImg != null }">
																				<img src="/bunny/resources/member/profile/${ userImg }" id="userImg" class="circleImg" width="150px" height="150px"
																				alt="userImg"/>
																			</c:if> <br />
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

<div class="modal fade" id="adminwarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel"></h3>
				
			</div>
				<div class="modal-body row">
					<div class="col-12">
					<h1>관리자가 확인중인 상품입니다.</h1>
				</div>
				<div class="modal-footer">
					
				</div>
			
		</div>
	</div>
</div>
</div>


<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">구매</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<form id="goBuyer" method="post">
				<input type="hidden" name="pno" id="BidderPno" value="${product.pno }" />
				<div class="modal-body row">
					<div class="col-12">
						<div class="form-group">
							<input type="hidden" id="BoriginPPrice" value="${product.PPrice}"/>
							
							<label for="Ptitle" style="font-size: 23px;">상품명</label>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${product.PTitle}</h5>
							<br />
							
							<label for="price" style="font-size: 23px;">상품의 가격</label>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:orange; font: bold;" id="bidPrice">${ product.PPrice }</span>당근</h5>
							<br />
						</div>
					</div>
					<div class="col-12 mb-4">
						<!-- <input type="radio" name="dMethod" value = "0" /> 거래중지 -->
						<div class="search_by_terms">
							<label for="dMethodCheck" style="font-size: 23px;">거래수단 확인</label>
							<input type="checkbox" id="dMethodCheck"/>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:orange; font: bold;" id="dMethodModal"></span></h5>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn alazea-btn mt-15" onclick="goBuyer();" style="float: right">구매하기</button>
					<button type="button" class="btn alazea-btn mt-15" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="reportMemberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">신고하기</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<form action="${pageContext.request.contextPath }/report/reportMember.do" id="reportMember" method="post">
				<input type="hidden" name="pno" value = "${ product.pno }"/>
				<input type="hidden" name="pType" value = "${ product.PType }" />
				<input type="hidden" name="reported" id="reportedName" value="${product.PWriter }" />
				<div class="modal-body row">
				
					<div class="col-12">
						<div class="form-group">
							<h4 class="title"><font color = "orange">${product.PWriter}</font> 님에 대한 신고 사유가 무엇인가요?</h4>
							<select name="rcNo" id="" class = "form-control" required>
								<option value="">----</option>
								<option value="11">전문 판매업자로 의심</option>
								<option value="12">욕설 혹은 비방</option>
								<option value="13">거래/환불 분쟁 신고</option>
								<option value="14">사기 신고</option>
								<option value="15">기타</option>
							</select>
							<br />
							<label for="">신고글 제목</label>
							<input type="text" class="form-control" name="rTitle" id="rTitle" style="border: 1px solid #e1e1e1;" required/>
							<br />
							<label for="">신고글 내용</label>
							<textarea class = "form-control" name="rContent" id="rContent" cols="30" rows="10" required></textarea>
		            		<div class="Bfail" style="color: orange; font-weight: bold; font-size: 20px;"></div>
		            		<div class="BfailMax" style="color: orange; font-weight: bold; font-size: 20px;"></div>
							<br />
						</div>
					</div>
					
					
					
				</div>
				<div class="modal-footer">
					<button type="submit" id="reportMemberBtn" class="btn alazea-btn mt-15" style="float: right">신고하기</button>
					<button type="button" class="btn alazea-btn mt-15" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
//관리자 admin

$(function(){
	var st = ${product.PStatus};
	if(st == 0){
		$('#adminwarning').modal();
		$('section').addClass('wblur disabledbutton').addClass('no-drag');
	}
});
$(function(){
	console.log('${product.PStatus}')});

function goBuy(){
	$('#myModal3').modal();
}

$(function(){
	$("#warn").click(function(){
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/product/productTypeChange.do',
			data : {pno : "${product.pno}"},
			dataType : "json",
			success: function(data){
				if(data.kill == true){
					alert("제재 성공");
					$('#adminwarning').modal();
					$('section').addClass('wblur disabledbutton').addClass('no-drag');
				} else {
					console.log(data);
					$('#adminwarning').modal();
					$('section').addClass('wblur');
				}
			},
			fail : function(data){
				alert("제재 실패");
				console.log(data);
			}
		});
	});
	
	var dMethod = '${product.DMethod}';
	if(dMethod == 1){
		$("#dMethodModal").text("직거래");
	} else if(dMethod == 2){
		$("#dMethodModal").text("택배");
	} else {
		$("#dMethodModal").text("미결정");
	}
	
});



function goBuyer(){
	console.log("눌렸나요?");
	var buyPno = '${product.pno}';
	
	var check = $("#dMethodCheck").is(":checked");
	
	console.log(check);
	if(check){
		
		$.ajax({
			  url : '${pageContext.request.contextPath }/product/buyingCheckInvalid.do'
			, data : {
				  pno : buyPno
			}
			, dataType : 'json'
			, success : function(data){
				if(data.msg == 0){
					if(confirm("당근이 부족하여 구매 할 수 없습니다. \n당근을 구매하시겠습니까?")){
						window.open('${ pageContext.request.contextPath }/point/pointChargeViewProduct.do?pno='+buyPno, '_blank', 'width=600px, height=800px');
					} else {
						alert("구매가 취소되었습니다.");
					}
				} else if(data.msg == 1){
					$("#goBuyer").attr("action", "${pageContext.request.contextPath }/product/buyingProduct.do").submit();
				}
			}, error : function(jqxhr, textStatus, errorThrown){
	               console.log("ajax 처리 실패");
	               //에러로그
	               console.log(jqxhr);
	               console.log(textStatus);
	               console.log(errorThrown);
	           }
		})
	} else {
		alert("거래수단을 확인해주세요.");
		$("#dMethodCheck").focus();
	}
	
}



</script>

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
		}
	    
	    
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords,
	        image: markerImage
	        
	    });
	    
	    
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
	
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
		
	    
	});
	    
	
	
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
	
	function reportMember(){
		if(confirm("${p.PWriter}님을 신고하시겠습니까?"))
			{
				//location.href = "${pageContext.request.contextPath}/report/reportMember.do";
				$('#handleModal').modal("hide");
				$('#reportMemberModal').modal();
				
			} 
	} 
	
	var sellCount = 0;
	$('#sellerInfo').click(function(){
		/* $('#sellerName').text('${p.PWriter}'); */
		
		$.ajax({
			  data : {nickName : '${product.PWriter}'}
			, url : "${ pageContext.request.contextPath }/member/sellerProfile.do"
			, dataType : "Json"
			,  async:false
			, success : function(data){
			
				var pWriter = data.seller.nickName;
				$.ajax({
					data : {pWriter : pWriter},
					url : "${pageContext.request.contextPath}/product/sellCount.do",
					async:false,
					dataType : "Json",
					success : function(data){
						sellCount = data;
						
						
					}
				});
				
				/* $.each(result , function(idx, val) {
					console.log(idx + " " + val.introduce);
				}); */
				var photo = data.seller.photo;
				$('#sellerName').text("아이디 : " + data.seller.nickName);
				$('#sellerIntroduce').text("자기소개 : " + data.seller.introduce);
				$('#sellerPhoto').attr('src','/bunny/resources/member/profile/'+photo);
				$('#sellerReport').text("신고 당한 횟수 : " + data.seller.count + "회");
				$('#sellCount').text("총거래 : " + sellCount + "회");
				
				
			}, fail : {
				
			}
		});
		
	});
	
	function goDealPlz(){
		location.href="${ pageContext.request.contextPath }/deal/dealDetail.do?dno=${ dno }";
	}
	
	
</script>


<%@ include file="../common/footer.jsp"%>

