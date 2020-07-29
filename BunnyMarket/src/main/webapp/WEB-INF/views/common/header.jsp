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
<style type="text/css">
	/*.modal{
		text-align : center;
		position :relative;
		width : 300px;
		heigth:150px;
		z-index:1;
	}
	.moal-content{
		width : 300px;
		text-align : center;
		background: white;
		margin :100px auto;

	}
    .modal-layout{
	    posiotion:fixed;
	    top:0;
	    left:0;
	    width:100%;
	    height:100%;
	    background:rgba(0, 0, 0,0.5);
	    z-index:-1;
    }
 #ex1 {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#ex1 h2 {
  margin:0;   
}

#ex1 button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#ex1 .modal-content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#ex1 .modal-layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}    */
</style>
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
									title="infodeercreative@gmail.com"> <i
									class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email:
										infodeercreative@gmail.com</span>
								</a> <a href="#" data-toggle="tooltip" data-placement="bottom"
									title="+1 234 122 122"> <i class="fa fa-phone"
									aria-hidden="true"></i> <span>Call Us: +1 234 122 122</span></a>
							</div>

							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<!-- Language Dropdown -->
								<div class="language-dropdown">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle mr-30"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Language</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">USA</a> <a
												class="dropdown-item" href="#">UK</a> <a
												class="dropdown-item" href="#">Bangla</a> <a
												class="dropdown-item" href="#">Hindi</a> <a
												class="dropdown-item" href="#">Spanish</a> <a
												class="dropdown-item" href="#">Latin</a>
										</div>
									</div>
								</div>
								<c:if test="${empty member}">
								<!-- Login -->
								<div class="login">
									<a href="${pageContext.request.contextPath}/login.do"><i class="fa fa-user" aria-hidden="true"></i> <span>Login</span></a>
								</div>
								</c:if>
								<c:if test="${!empty member}">

									<span><a
										href="${pageContext.request.contextPath}/member/memberMyPage.do?userId=${member.userId}"
										title="내정보보기">${member.userName}님,&nbsp;안녕하세요</a></span>
							        &nbsp; 
							        <div class="login">
							        <%-- <button class="login" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button> --%>
							        <a href="${pageContext.request.contextPath}/member/memberLogout.do"><i class="fa fa-user" aria-hidden="true"></i><span>Logout</span></a>
							        <a href="${pageContext.request.contextPath}/member/memberDelete.do"><i class="fa fa-user" aria-hidden="true"></i><span>회원탈퇴</span></a>
							        
							        &nbsp;
							        
							        </div>
							        </c:if>

								 

								<!-- Cart -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="cart">
									<a href="#"> <i class="fa fa-shopping-cart"
										aria-hidden="true"></i> <span>Cart <span
											class="cart-quantity">(1)</span></span>
									</a>
								</div>
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
						<a href="${ pageContext.request.contextPath }/index.jsp" class="nav-brand"> <img
							src="${ pageContext.request.contextPath }/resources/img/core-img/bunnyLogo2.png"
							alt=""></a>

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
									<li><a href="#">관리자</a>
										<ul class="dropdown">
											<li><a href="${ pageContext.request.contextPath }/views/admin/customerList.jsp">관리자-고객리스트</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/admin/message.jsp">관리자-메세지</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/admin/reportList.jsp">관리자-신고리스트</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/admin/transactions.jsp">관리자-트랜잭션</a></li>
										</ul></li>
									<li><a href="javascript:void(window.open('${ pageContext.request.contextPath }/views/mail/mailList.jsp', '_blank', 'width=600px, height=800px'))">쪽지함</a></li>
									<li><a href="#">고객센터</a>
										<ul class="dropdown">
											<li><a href="${ pageContext.request.contextPath }/views/QNA/FAQ.jsp">F.A.Q</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/QNA/QNA_List.jsp">Q&A</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/report/reportList.jsp">신고하기</a></li>
										</ul>
									</li>
									<li><a href="#">상품</a>
										<ul class="dropdown">
											<li><a href="${ pageContext.request.contextPath }/product/productList.do">일반 중고 상품</a></li>
											<li><a href="${ pageContext.request.contextPath }/auction/auctionList.do">경매 상품</a></li>
											<li><a href="${ pageContext.request.contextPath }/product/productListMap.do">상품 지도로 보기</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/member/review.jsp">후기 작성하기</a></li>
										</ul>
									</li>
									<li><a href="#">결제하기</a>
										<ul class="dropdown">
											<li><a href="${ pageContext.request.contextPath }/views/payment/pBuyer.jsp">구매자</a></li>
											<li><a href="${ pageContext.request.contextPath }/views/payment/pSeller.jsp">판매자</a></li>
											<li><a href="javascript:void(window.open('${ pageContext.request.contextPath }/views/payment/pView.jsp', '_blank', 'width=600px, height=800px'))">당근 충전하기</a></li>
										</ul>
									</li>
									<li><a href="${pageContext.request.contextPath}/views/member/myPage.jsp">MyPage</a></li>
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
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type keywords &amp; press enter...">
							<button type="submit" class="d-none"></button>
						</form>
						<!-- Close Icon -->
						<div class="closeIcon">
							<i class="fa fa-times" aria-hidden="true"></i>
						</div>
					</div>

					<!-- 섬머노트 -->
					<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
						integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
						crossorigin="anonymous"></script>
					<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
					<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
				</div>
			</div>
		</div>
		
		
	</header>
	<!-- ##### Header Area End ##### -->