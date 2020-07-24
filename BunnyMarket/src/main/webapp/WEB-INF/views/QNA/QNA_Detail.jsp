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
								<a href="${pageContext.request.contextPath}/QNA/QNADetail.do""><i class="fa fa-user" aria-hidden="true"></i>${qna.QWriter}</a>
							</div>
							<div class="post-meta mb-30">
								<button type="button" class="btn alazea-btn mt-15"
										onclick="location.href='${ pageContext.request.contextPath }/QNA/QNAUpdateView.do?qno=${qna.qno}'">수정하기</button>
							</div>
							<div class="post-thumbnail mb-30">
								<img src="${pageContext.request.contextPath}/resources/img/bg-img/35.jpg" alt="">
							</div>
							<p>${qna.QContent}</p>
							<br /> <br /> <br />
							<blockquote>
								<div class="blockquote-text">
									<h5>“바로 당신의 니즈, 저희 바니마켓이 충족시켜드리겠습니다.”</h5>
									<h5>YOUNG BUNNY</h5>
								</div>
							</blockquote>

						</div>
					</div>

					<!-- Comment Area Start -->
					<div class="comment_area clearfix">
						<h4 class="headline">댓글</h4>

						<ol>
							<!-- Single Comment Area -->
							<li class="single_comment_area">
								<div class="comment-wrapper d-flex">
									<!-- Comment Meta -->
									<div class="comment-author">
										<img
											src="${pageContext.request.contextPath}/resources/img/bg-img/37.jpg"
											alt="#">
									</div>
									<!-- Comment Content -->
									<div class="comment-content">
										<div class="d-flex align-items-center justify-content-between">
											<h5>당근이</h5>
											<span class="comment-date">09:00 AM, 20 Jun 2018</span>
										</div>
										<p>저도 궁금해요!</p>
										<a class="active" href="#">Reply</a>
									</div>
								</div>
								<ol class="children">
									<li class="single_comment_area">
										<div class="comment-wrapper d-flex">
											<!-- Comment Meta -->
											<div class="comment-author">
												<img
													src="${pageContext.request.contextPath}/resources/img/bg-img/38.jpg"
													alt="">
											</div>
											<!-- Comment Content -->
											<div class="comment-content">
												<div
													class="d-flex align-items-center justify-content-between">
													<h5>관리자</h5>
													<span class="comment-date">09:30 AM, 20 Jun 2018</span>
												</div>
												<p>빠른 시일 내에 답변드리겠습니다.</p>
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
											src="${pageContext.request.contextPath}/resources/img/bg-img/29.jpg"
											alt="">
									</div>
									<!-- Comment Content -->
									<div class="comment-content">
										<div class="d-flex align-items-center justify-content-between">
											<h5>바니</h5>
											<span class="comment-date">02:20 PM, 20 Jun 2018</span>
										</div>
										<p>와우</p>
										<a class="active" href="#">Reply</a>
									</div>
								</div>
							</li>
						</ol>
					</div>

					<!-- Leave A Comment -->
					<div class="leave-comment-area clearfix">
						<div class="comment-form">
							<h4 class="headline">댓글 작성하기</h4>

							<div class="contact-form-area">
								<!-- Comment Form -->
								<form id="cmtForm" method="post">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<textarea class="form-control" name="message" id="message"
													cols="30" rows="10" placeholder="댓글을 남겨주세요."></textarea>
											</div>
										</div>
										<div class="col-12">
											<button type="button" class="btn alazea-btn mt-15" 
							                       onclick="comment();">댓글 작성하기</button>
										</div>
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
</section>
<script>
 function  comment(){
		$("#cmtForm").attr("action", "${ pageContext.request.contextPath }/QNA/QNADetail.do").submit();
 }
</script>
<!--  여기까지 -->
<c:import url="../common/footer.jsp" />
