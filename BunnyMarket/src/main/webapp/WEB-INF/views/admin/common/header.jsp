<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../../resources/img/apple-icon.png">
<link rel="icon" type="image/png" href="../../resources/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="../../resources/css/material-dashboard.css?v=2.1.2"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="../../resources/demo/demo.css" rel="stylesheet" />
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.5.1.min.js"></script>
<!-- 섬머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
.navbarTest {
	background-color: #FAD7A0;
	cursor: pointer;
}

.dropdown-menu .dropdown-item:hover, .dropdown-menu .dropdown-item:focus,
	.dropdown-menu a:hover, .dropdown-menu a:focus, .dropdown-menu a:active{
	background-color: ligthgreen;
}
</style>
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="white" data-background-color="white"
			data-image="../../resources/img/sidebar-1.jpg">
			<div class="logo">관리자</div>
			<div class="sidebar-wrapper" id="menu">
				<ul class="nav">
					<li class="nav-item "><a class="nav-link"
						href=" ${ pageContext.request.contextPath }/admin/main/home.do">
							<i class="material-icons">notifications</i>
							<p>관리자 홈</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href=" ${ pageContext.request.contextPath }/views/admin/reportList.jsp">
							<i class="material-icons">content_paste</i>
							<p>거래 현황</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href=" ${ pageContext.request.contextPath }/views/admin/reportList.jsp">
							<i class="material-icons">notifications</i>
							<p>신고 현황</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="${ pageContext.request.contextPath }/admin/member/memberList.do">
							<i class="material-icons">person</i>
							<p>회원 리스트</p>
					</a></li>
					<li class="nav-item  "><a class="nav-link"
						href="${ pageContext.request.contextPath }/admin/notice/noticeList.do">
							<i class="material-icons">dashboard</i>
							<p>공지사항</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						<%-- href="${ pageContext.request.contextPath }/ "--%>
						onclick="openQA();"> <i	class="material-icons">library_books</i>
							<p>Q&A</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="${ pageContext.request.contextPath }/views/admin/message.jsp">
							<i class="material-icons">library_books</i>
							<p>메세지</p>
					</a></li>
					<c:if test="${admin.adminId eq 'admin'}">
						<li class="nav-item "><a class="nav-link"
							href="${ pageContext.request.contextPath }/admin/adminMember/adminList.do">
								<i class="material-icons">person</i>
								<p>관리자 멤버관리</p>
						</a></li>
					</c:if>
					<li class="nav-item "><a class="nav-link"
						onclick="openHome();"> <i class="material-icons">library_books</i>
							<p>홈</p>
					</a></li>
					<!-- <li class="nav-item ">
            <a class="nav-link" href="./icons.html">
              <i class="material-icons">bubble_chart</i>
              <p>Icons</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./map.html">
              <i class="material-icons">location_ons</i>
              <p>Maps</p>
            </a>
          </li>
         <li class="nav-item ">
            <a class="nav-link" href="./rtl.html">
              <i class="material-icons">language</i>
              <p>RTL Support</p>
            </a>
          </li>
          <li class="nav-item active-pro ">
            <a class="nav-link" href="./upgrade.html">
              <i class="material-icons">unarchive</i>
              <p>Upgrade to PRO</p>
            </a>
          </li> -->
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:;">관리자</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<form class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-white btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="javascript:;">
									<i class="material-icons">dashboard</i>
									<p class="d-lg-none d-md-block">Stats</p>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="http://example.com" id="navbarDropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="d-lg-none d-md-block">Some Actions</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Mike John responded to
										your email</a> <a class="dropdown-item" href="#">You have 5
										new tasks</a> <a class="dropdown-item" href="#">You're now
										friend with Andrew</a> <a class="dropdown-item" href="#">Another
										Notification</a> <a class="dropdown-item" href="#">Another One</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="javascript:;" id="navbarDropdownProfile"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">person</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">

									<!-- <div class="dropdown-divider"></div> -->
									<form id="logOutForm" action="${pageContext.request.contextPath}/admin/adminLogout.do" method="post">
										<a class="dropdown-item" id="logoutcss" onclick="logout();">Log
											out</a>
									</form>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<script>
				$(function() {
					$("p").mouseenter(function() {
						$(this).parent().parent().addClass('navbarTest');
					}).mouseout(function() {
						$(this).parent().parent().removeClass('navbarTest');
					});
				});

				function goHome() {
					location.href = "${pageContext.request.contextPath}/admin/adminHome.do";
				}
				function logout() {
					var check = confirm("로그아웃 하쉴? 정말?");
					if(check){
						$("#logOutForm").submit();
					} else {
						return;
					}
					
				}
				function openQA(){
					window.open("${pageContext.request.contextPath}/QNA/QNAList.do");
				}
				function openHome(){
					window.open("${pageContext.request.contextPath}/");
				}
			</script>