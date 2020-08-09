<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../../views/common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
		<h2>공지사항 상세보기</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">
							<a href="${pageContext.request.contextPath}/notice/mNotice.do">공지사항</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">
							공지사항 상세보기
						</li>
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
							<h4 class="post-title">${notice.NTitle}</h4>
							<br />
							<div class="post-meta mb-30">
								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${notice.NDate}</a> 
								<a href="#"><i class="fa fa-user" aria-hidden="true"></i>${notice.NTotal}</a>
							</div>
							<div class="post-meta mb-30">
								<%-- <button type="button" class="btn mt-15"
										onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeUpdate.do?noticeNo=${notice.nno}'">수정하기</button> --%>
							</div>
							<div><p></p></div>
							<%-- <div class="post-thumbnail mb-30">
								<img src="${pageContext.request.contextPath}/resources/img/bg-img/35.jpg" alt="">
							</div> --%>
							<br/>
							<div style="font-size : 30px;">${notice.NContent}</div>
							<br /> <br /> <br />
							<blockquote>
								<div class="blockquote-text">
									<h5>“바로 당신의 니즈, 저희 바니마켓이 충족시켜드리겠습니다.”</h5>
									<h5>YOUNG BUNNY</h5>
								</div>
							
							</blockquote>
								<button type="button" class="btn mt-15"
										onclick="location.href='${pageContext.request.contextPath}/notice/mNotice.do'">돌아가기</button> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<c:import url="../../views/common/footer.jsp" />
