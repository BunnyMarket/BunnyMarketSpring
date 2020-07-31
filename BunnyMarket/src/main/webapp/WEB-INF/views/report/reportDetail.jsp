<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />
<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		 style="background-image: url(img/bg-img/24.jpg);">
		<h2>신고글 상세보기</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Report</li>
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
							<h4 class="post-title">공기팟 사기꾼 신고합니다!</h4>
							<div class="post-meta mb-30">
								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>등록일</a> 
								<a href="#"><i class="fa fa-user" aria-hidden="true"></i>작성자</a>
							</div>
							<div class="post-thumbnail mb-30">
								<img src="img/bg-img/35.jpg" alt="">
							</div>
							<p>공기팟 사기꾼 잡아주세요. ˃̣̣̣̣̣̣︿˂̣̣̣̣̣̣  &nbsp; 제 돈 갖고 튄 바니 잡아서 꼭 혼쭐내주세요.  •̀.̫•́✧  </p>
							<br /> <br /> <br />
							<blockquote>
								<div class="blockquote-text">
									<h5>“신고된 게시물/댓글은 담당자 확인 후 기준에 맞게 조치하고 있습니다.
									           &nbsp;바니마켓은 건강하고 안전한 인터넷 환경 마련을
										위해 최선의 노력을 하고 있습니다. ”</h5>
									<h5>YOUNG BUNNY</h5>
								</div>
							</blockquote>

						</div>
					</div>

				</div>
			</div>
			<div class="checkout_btn_inner float-right">
				<a class="btn alazea-btn mr-30" href="${pageContext.request.contextPath}/views/report/reportDetail.jsp">취소하기</a>
				<a class="btn alazea-btn mr-30" href="${pageContext.request.contextPath}/views/report/reportUpdate.jsp">수정하기</a> 
				<a class="btn alazea-btn mr-30" href="${pageContext.request.contextPath}/views/report/reportList.jsp">삭제하기</a>
			</div>
		</div>
	</div>
</section>
<c:import url="../common/footer.jsp" />
