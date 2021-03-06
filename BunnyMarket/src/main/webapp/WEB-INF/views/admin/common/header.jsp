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
<link rel="icon" type="image/png" href="../../resources/img/core-img/favicon-bunny2.ico"> <!-- 파비콘 -->
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
<title>Admin Bunny</title>
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

.pageAdmin{
	font-weight: 500 ;
}
table{
	text-align : center;
}

.btn {
  background: #fc913a;
  background-image: -webkit-linear-gradient(top, #fc913a, #f06b05);
  background-image: -moz-linear-gradient(top, #fc913a, #f06b05);
  background-image: -ms-linear-gradient(top, #fc913a, #f06b05);
  background-image: -o-linear-gradient(top, #fc913a, #f06b05);
  background-image: linear-gradient(to bottom, #fc913a, #f06b05);
  -webkit-border-radius: 10;
  -moz-border-radius: 10;
  border-radius: 10px;
  font-family: Arial;
  color: #ffffff;
  font-size: 14px;
  padding: 7px 20px 7px 20px;
  border: solid #ff9645 2px;
  text-decoration: none;
}

.btn:hover {
  background: #ff6f00;
  background-image: -webkit-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -moz-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -ms-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -o-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: linear-gradient(to bottom, #ff6f00, #ff6f00);
  text-decoration: none;
}
select{
    text-align:center;
    margin-left:35px;
    border:1px solid #ff6f00;
    padding:5px;
    border-radius:2px;
}
select:hover{
    background:#fff;
    border:1px solid #ff6f00;
}

select:focus {
        -webkit-box-shadow: 0 0 3px 1px #ff6f00;
        -moz-box-shadow: 0 0 3px 1px #ff6f00;
        box-shadow: 0 0 3px 1px #ff6f00;
    }
    select:before{
        content: "▼";
    }
option{
    background:#fff;
    border-color:#ff6f00;
    border-radius:2px;
    line-height: 18px;
    outline:none;
    -webkit-box-shadow: 0 0 3px 1px #ff6f00;
    -moz-box-shadow: 0 0 3px 1px #ff6f00 ;
    box-shadow: 0 0 3px 1px #ff6f00;
}
option:focus{
    -webkit-box-shadow: 0 0 3px 1px #ff6f00;
        -moz-box-shadow: 0 0 3px 1px #ff6f00;
        box-shadow: 0 0 3px 1px #ff6f00;
}
option:hover{
		 background : #fabd8e;
}

.searchArea input {
  border: none;
  border-bottom:1px solid #757575;
  background: #eeeeee;
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
							<p class="li-menu">관리자 홈 </p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href=" ${ pageContext.request.contextPath }/admin/deal/searchDeal.do">
							<i class="material-icons">content_paste</i>
							<p>거래 현황</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href=" ${ pageContext.request.contextPath }/admin/report/searchReport.do">
							<i class="material-icons">notifications</i>
							<p class="li-menu">신고 현황</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="${ pageContext.request.contextPath }/admin/member/searchMember.do">
							<i class="material-icons">person</i>
							<p>회원 리스트 </p>
					</a></li>
					<li class="nav-item  "><a class="nav-link"
						href="${ pageContext.request.contextPath }/admin/notice/searchNotice.do">
							<i class="material-icons">dashboard</i>
							<p class="li-menu">공지사항 </p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						 href="${ pageContext.request.contextPath }/admin/QnA/searchQnA.do">	
						 <i	class="material-icons">library_books</i>
							<p class="li-menu">Q&A </p>
					</a></li>
					<c:if test="${admin.adminId eq 'admin'}">
						<li class="nav-item "><a class="nav-link"
							href="${ pageContext.request.contextPath }/admin/member/adminMemberId.do">
								<i class="material-icons">person</i>
								<p class="li-menu">관리자 멤버관리 </p>
						</a></li>
					</c:if>
					<li class="nav-item "><a class="nav-link"
						onclick="openHome();"> <i class="material-icons">library_books</i>
							<p class="li-menu">홈</p>
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
							
							</div>
						</form>
						<ul class="navbar-nav">
							
						
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
					$(".li-menu").mouseenter(function() {
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