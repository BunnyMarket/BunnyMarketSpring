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
	<form  id="formArea" method="post" action="${pageContext.request.contextPath }/report/reportUpdate.do">
		<div class="row justify-content-center">
			<!-- Blog Posts Area -->
			<div class="col-12 col-md-8">
				<div class="blog-posts-area">

					<!-- Post Details Area -->
					<div class="single-post-details-area">
						<div class="post-content">
						<input type="hidden"   value="${report.RNo }"/>
							<h4 class="post-title">${report.RTitle }</h4>
							<div class="post-meta mb-30">
								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${report.RDate}</a> 
								<a href="#"><i class="fa fa-user" aria-hidden="true"></i>${report.RWriter}</a> <br><br>
								<a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i>${report.rcContent}</a><br><br>
								<a href="#"><i class="fa fa-user" aria-hidden="true">신고 접수 아이디: </i>${report.reported}</a> 
								<a href="#"><i class="fa fa-shopping-cart" aria-hidden="true">신고글 제목:</i>${pTitle}</a>
							</div>
							
							<p>${report.RContent}</p>
							<br /><br /><br /><br /><br />
							<br /><br /><br />
							
							<div align="right">
							
		                         <button type="button" class="btn alazea-btn mt-15"
										onclick="location.href='${ pageContext.request.contextPath }/report/reportUpdateView.do?rno=${report.RNo}'">수정하기</button>
	                      	      <input type="button" class="btn alazea-btn mt-15" value="삭제하기" onclick="location.href='${ pageContext.request.contextPath }/report/reportDelete.do?rno=${report.RNo}'"/>
				            </div>
						<br /><br /><br />
						
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
		
		</div>
		</form>
	</div>
</section>

<c:import url="../common/footer.jsp" />
