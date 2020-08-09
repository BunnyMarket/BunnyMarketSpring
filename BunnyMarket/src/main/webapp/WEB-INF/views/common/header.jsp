<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- 제이쿼리 -->
<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.5.1.min.js"></script>

<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 지도 부르기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037f9ae8baf28354df2203507cf3111a&libraries=services, clusterer, drawing"></script>

<!-- Title -->
<title>Bunny Market</title>

<!-- Favicon -->
<link rel="icon"
	href="${ pageContext.request.contextPath }/resources/img/core-img/favicon-bunny4.ico">

<!-- 섬머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- Core Stylesheet -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/style.css">
</head>
<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img
				src="${ pageContext.request.contextPath }/resources/img/core-img/leaf.png"
				alt="">
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
							<div class="top-header-meta">
								<a href="#" data-toggle="tooltip" data-placement="bottom"
									title="bunnyYaho@naver.com"> <i
									class="fa fa-envelope-o" aria-hidden="true"></i> 
									<span style="font-weight: bold;">Email : bunnyYaho@naver.com</span>
								</a> <a href="#" data-toggle="tooltip" data-placement="bottom"
									title="+82 010 8282 8282"> <i class="fa fa-phone"
									aria-hidden="true"></i> <span>Call +82 010 8282 8282</span></a>
							</div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<c:choose>
									<c:when test="${empty member and empty admin}">
										<!-- Login -->
										<div class="login">
											<a href="${pageContext.request.contextPath}/login.do"><i class="fa fa-user" aria-hidden="true"></i>
												<span>Login/Register</span>
											</a>
										</div>
									</c:when>
									<c:when test="${!empty admin}">
										<!-- Login -->
										<div class="login">
											<a href="#"><i class="fa fa-user" aria-hidden="true"></i>
												<span>관리자님이 접속하셨습니다.(${admin.adminId})</span>
											</a>
		
										</div>
									</c:when>
								</c:choose>
									<c:if test="${!empty member}">
	
											<form  name="myForm" action="${ pageContext.request.contextPath }/member/memberMyPage.do" method="POST">
											<input type="hidden" name="userId" value="${member.userId}">
											</form>
										<span>
											<a href="#"
												title="내정보보기" onclick="javascript:document.myForm.submit();">${member.nickName}님,&nbsp;안녕하세요 </a>
										</span>
								        &nbsp; 
								        <div class="login">
									        <%-- <button class="login" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button> --%>
									        <a href="${pageContext.request.contextPath}/member/memberLogout.do"><i class="fa fa-user" aria-hidden="true"></i><span>Logout</span></a>
								        &nbsp;
								         <a href="${pageContext.request.contextPath}/point/myPointView.do"><i class="fa fa-user" aria-hidden="true"></i><span>당근내역 조회</span></a>
								         &nbsp;
										<a href="javascript:void(window.open('${ pageContext.request.contextPath }/point/pointChargeView.do', '_blank', 'width=600px, height=800px'))"> 
											<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
											<span>당근 충전</span>
										</a>
										
								        </div>
							        </c:if>

								<!-- Cart -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ***** Navbar Area ***** -->
		<div class="alazea-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="alazeaNav">

						<!-- Nav Brand -->
						<a href="${ pageContext.request.contextPath }/" class="nav-brand"> 
							<img src="${ pageContext.request.contextPath }/resources/img/core-img/bunnyLogo2.png" alt="">
						</a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Navbar Start -->
							<div class="classynav">
								<ul>
									<%-- 
											<li><a href="${ pageContext.request.contextPath }/admin/adminLoginCheck.do">관리자-메세지</a></li>
										--%>
									<li><a href="${ pageContext.request.contextPath }/product/productList.do">일반 상품</a></li>
									<li><a href="${ pageContext.request.contextPath }/auction/auctionList.do">경매 상품</a></li>
									<li><a href="${ pageContext.request.contextPath }/product/productListMap.do">지도로 보기</a></li>
									<li><a href="#">고객센터</a>
										<ul class="dropdown">
											<li><a href="${ pageContext.request.contextPath }/notice/mNotice.do">공지사항</a></li>
											<li><a href="${ pageContext.request.contextPath }/QNA/FAQ.do">F.A.Q</a></li>
											<li><a href="${ pageContext.request.contextPath }/QNA/QNAList.do">Q & A</a></li>
											<li><a href="${ pageContext.request.contextPath }/report/reportList.do">신고하기</a></li>
										</ul>
									</li>
								</ul>

								<!-- Search Icon -->
								<div id="searchIcon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>

							</div>
							<!-- Navbar End -->
						</div>
					</nav>

					<!-- Search Form -->
					<div class="search-form">
						<form action="${pageContext.request.contextPath}/product/searchProduct.do" method="get">
							<input type="hidden" name="condition" value = "all" />
							<input type="text" name="keyword" id="search" placeholder="상품 관련 내용을 검색해보세요.">
							<button type="submit" class="d-none"></button><!-- 엔터 이벤트를 넣어주는 d-none클래스..신기해.. -->
						</form>
						<!-- Close Icon -->
						<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>

					
				</div>
			</div>
		</div>
		
		
	</header>
	<!-- ##### Header Area End ##### -->

