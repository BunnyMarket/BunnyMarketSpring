<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>Q&A 글 상세보기</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Blog Content Area Start ##### -->
<section class="blog-content-area section-padding-0-100">
	<div class="container">
		<div class="row justify-content-center">
			<!-- Blog Posts Area -->
			<div class="col-12 col-md-8">
				<div class="blog-posts-area">

					<!-- Post Details Area -->
					<div class="single-post-details-area">
						<div class="post-content">
							<input type="hidden"   value="${qna.qno }"/>
								<h4 class="post-title">${qna.QTitle}</h4>
								<br />
								<div class="post-meta mb-30">
									<a href="${pageContext.request.contextPath}/QNA/QNADetail.do"><i class="fa fa-clock-o" aria-hidden="true"></i>${qna.QDate}</a> 
									<a href="${pageContext.request.contextPath}/QNA/QNADetail.do"><i class="fa fa-user" aria-hidden="true"></i>${qna.QWriter}</a>
								</div>
								
								
								<p>${qna.QContent}</p>
								<br /> <br /> <br /><br /><br />
								<br /><br /><br />
								<div class="post-meta mb-30" align="right">
									<button type="button" class="btn alazea-btn mt-15"
											onclick="location.href='${ pageContext.request.contextPath }/QNA/QNAUpdateView.do?qno=${qna.qno}'">수정하기</button>
								</div>
								<br/><br/>
								<blockquote>
									<div class="blockquote-text">
										<h5>“바로 당신의 니즈, 저희 바니마켓이 충족시켜드리겠습니다.”</h5>
										<h5>YOUNG BUNNY</h5>
									</div>
								</blockquote>
						</div>
						
					</div>
					<!--  댓글처리 시작 -->
					<div class = "post-content">
								<!-- Comment Area Start -->
								<div class="comment_area clearfix">
									<h4 class="headline">${ qcommentSize } Comments</h4>
									<c:if test = "${ qcommentSize eq 0 }">
										<h5>아직 댓글이 없습니다.  (｡•́︿•̀｡)  </h5>
									</c:if>

									<ol>
										<!-- Single Comment Area -->
										<c:forEach items="${ qcomments }" var="qcomment" varStatus="st">
											<li class="single_comment_area">
												<c:if test = "${ qcomment.qcLevel eq 0}">
													<div class="comment-wrapper d-flex">
														<!-- Comment Meta -->
														<div class="comment-author">
															<img src="${ pageContext.request.contextPath }/resources/img/bg-img/37.jpg" alt=""><!-- member의 대표이미지 경로 적어주기 -->
														</div>
														<!-- Comment Content -->
														<div class="comment-content">
															<input type="hidden" id="qcContent-${st.index}" value="${ qcomment.qcContent }"/>
															<div
																class="d-flex align-items-center justify-content-between">
																<h5>${ qcomment.QWriter }</h5>
																<span class="comment-date">${ qcomment.qcDate }</span>
															</div>
															<p id="rqcContent-${st.index }">${ qcomment.qcContent }</p>
															<p id="rqcContent2-${st.index }"></p>
															
															<!--  본인일 경우 수정 삭제버튼 출력 -->
															<form id="replyForm-${qcomment.qcno}" method="post">
																<input type="hidden" name="qno" value="${qcomment.qno}"/>
																<input type="hidden" name="qcno" value="${qcomment.qcno}"/>
																<a class="active" onclick="replyComment(${st.index});">Reply</a>
																<c:if test="${qcomment.QWriter eq member.nickName }">
																		&nbsp;&nbsp;
																		<a class="active" onclick="updateViewComment(${qcomment.qcno}, ${st.index });">Update</a>
																		&nbsp;&nbsp;
																		<a class="active" onclick="deleteComment(${qcomment.qcno});">Delete</a>
																</c:if>
															</form>
															<!-- 대댓 입력부 -->
															<div class="contact-form-area" id="reReplyDiv-${st.index }" style="display: none;">
																<!-- Comment Form -->
																<form action="${pageContext.request.contextPath }/QNA/qcommentInsert.do" method="post">
																	<input type="hidden" id="commentqno" name="qno" value="${qna.qno }"/>
																	<input type="hidden" id="ref_qcno" name="ref_qcno" value="${qcomment.qcno }">
																	<input type="hidden" id="qcLevel" name="qcLevel" value="1">
																	<div class="col-12">
																		<div class="form-group">
																			<textarea class="form-control" name="qcContent"
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
															<!-- 댓글 수정부분 -->
															<div class="contact-form-area" id="upReplyDiv-${st.index }" style="display: none;">
																<!-- Comment Form -->
																<input type="hidden" id="ref_qcno" name="ref_qcno" value="${qcomment.qcno }">
																<div class="col-12">
																	<div class="form-group">
																		<textarea class="form-control" name="qcContent"
																				   id="updateComment-${st.index }" cols="30" rows="10" placeholder="Comment"></textarea>
																	</div>
																</div>
																<div class="col-12">
																	<button type="submit" class="btn alazea-btn" onclick="updateComment(${qcomment.qcno}, ${st.index })">
																		Post Comment
																	</button>
																</div>
															</div>
														</div>
													</div>
													<c:forEach items="${ qcomments }" var="reComment"> <!-- 리댓들 달아주기 -->
														<c:if test = "${ reComment.qcLevel eq 1 and reComment.ref_qcno eq qcomment.qcno}">
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
																				<h5>${ reComment.QWriter }</h5>
																				<span class="comment-date">${ reComment.qcDate }</span>
																			</div>
																			<p id="repcContent-${st.index }">${ reComment.qcContent }</p>
																			<p id="repcContent2-${st.index }"></p>
																			<c:if test="${qcomment.QWriter eq member.userId }">
																				<form id="replyForm-${reComment.qcno}" method="post">
																					<input type="hidden" name="qcno" value="${reComment.qcno}">
																					<input type="hidden" name="qno" value="${qna.qno }"/>
																					<a class="active" href="#" onclick = "updateReViewComment(${reComment.qcno}, ${st.index });">Update</a>&nbsp;&nbsp;
																					<a class="active" href="#" onclick = "deleteComment(${reComment.qcno});">Delete</a>
																				</form>
																			</c:if>
																			<div class="contact-form-area" id="upReReplyDiv-${st.index }" style="display: none;">
																				<!-- Comment Form -->
																				<input type="hidden" id="reContent-${st.index }" value="${ reComment.qcContent }"/>
																				<div class="col-12">
																					<div class="form-group">
																						<textarea class="form-control" name="qcContent"
																								  id="updateReComment-${st.index }" cols="30" rows="10"></textarea>
																					</div>
																				</div>
																				<div class="col-12">
																					<button type="submit" class="btn alazea-btn"  onclick="updateReComment(${reComment.qcno}, ${st.index })">
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
											<form action="${pageContext.request.contextPath }/QNA/qcommentInsert.do" method="post">
												<input type="hidden" name="qno" value="${qna.qno }"/>
												<input type="hidden" name="ref_qcno" value="0">
												<input type="hidden" name="qcLevel" value="0">
												<div class="col-12"><div class="form-group" id="forMessage"></div></div>
												<div class="col-12">
													<div class="form-group">
														<textarea class="form-control" name="qcContent"
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
					
					</div>
				</div>
			</div>
			</section>
			<script>
			function replyComment(st){
				$("#reReplyDiv-"+st).toggle();
				$("#updateComment-"+st).focus();
			}
			
			function updateViewComment(qcno, st){
				
				var pcContent = $("#qcContent-"+st).val();
				$("#upReplyDiv-"+st).toggle();
				$("#updateComment-"+st).text(qcContent);
			}
			
			function updateComment(qcno, st){
				var upqcContent = $("#updateComment-"+st).val();
				var updateConfirm = confirm("수정하시겠습니까?");
				
				if(updateConfirm){
					$.ajax({
						  data : {
							  	  qcContent : upqcContent
							  	, qcno : qcno
							  }
						, type : 'post'
						, dataType : 'json'
						, url : '${pageContext.request.contextPath}/QNA/qcommentUpdate.do'
						, success : function(data){
							if(data.updateCheck == true){
								$("#upReplyDiv-"+st).css("display", "none");
								$("#rqcContent-"+st).remove();
								$("#rqcContent2-"+st).text(upqcContent);
							}
							
						}, fail : function(data){
							alert("실패하였습니다.");
						}
					});
				} else {
					alert("수정이 취소되었습니다.");
					$("#upReplyDiv-"+st).css("display", "none");
					$("#qcContent-"+st).clear();
				}
			}
			
			function updateReViewComment(qcno, st){
				var qcContent = $("#reContent-"+st).val();
				$("#upReReplyDiv-"+st).toggle();
				$("#updateReComment-"+st).text(qcContent);
			}
			
			function updateReComment(qcno, st){
				var upqcContent = $("#updateReComment-"+st).val();
				var updateConfirm = confirm("수정하시겠습니까?");
				
				
				if(updateConfirm){
					$.ajax({
						  data : {
							  	  qcContent : upqcContent
							  	, qcno : qcno
							  }
						, type : 'post'
						, dataType : 'json'
						, url : '${pageContext.request.contextPath}/QNA/qcommentUpdate.do'
						, success : function(data){
							if(data.updateCheck == true){
								$("#upReReplyDiv-"+st).css("display", "none");
								$("#reqcContent-"+st).remove();
								$("#reqcContent2-"+st).text(upqcContent);
							}
							
						}, fail : function(data){
							alert("실패하였습니다.");
						}
					});
				} else {
					alert("수정이 취소되었습니다.");
					$("#upReReplyDiv-"+st).css("display", "none");
					$("#reqcContent-"+st).clear();
				}
			}
			
			
			function deleteComment(qcno){
				if(confirm("정말 삭제하시겠습니까?") == true){
					$("#replyForm-"+qcno).attr("action", "${pageContext.request.contextPath}/QNA/qcommentDelete.do").submit();
				} else {
					return;
				}
			}
			</script>




<!--  여기까지 -->
<c:import url="../common/footer.jsp" />
