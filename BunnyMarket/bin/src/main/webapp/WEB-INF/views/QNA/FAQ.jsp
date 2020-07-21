<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 (FAQ)</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
 <style>
	.accordionMenu{
		font-family: 'Noto Sans KR', sans-serif;
		color:#424242;
		background:#fff;
		padding:10px;
		width:700px;
		margin:auto; 
	}
	.accordionMenu h1 {
		margin:0;
		font-size:30px;
		text-shadow:2px 2px 2px #aeaeae;
	}
	.accordionMenu h2{
		margin:5px 0;
		padding:0;
	}

	.accordionMenu h2 a{
		font-size:20px;
		display:block;
		font-weight:normal;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:#8f8f8f;
	}

	.accordionMenu h2 a{
		font-size:20px;
		display:block;
		font-weight:bold;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:-moz-linear-gradient(top,#cecece,#8f8f8f);
		background:-webkit-gradient(linear,left top, left bottom, from(#cecece), to(#8f8f8f));
		-webkit-border-radius:5px;
		-moz-border-radius:5px;
		border-radius:5px;
	}

	.accordionMenu :target h2 a,
	.accordionMenu h2 a:focus,
	.accordionMenu h2 a:hover,
	.accordionMenu h2 :active {
		background:#b0fa02;
		background:-moz-linear-gradient(top,#a6fc56,#22dd28);
		background:-webkit-gradient(linear,left top, left bottom, from(#15c712), to(#08b005));
		color:#fafad4;
	}

	.accordionMenu p {
		padding:0 10px;
		margin:0;
		height:0;
		overflow:hidden;
		-moz-transition:height 0.5s ease-in;
		-webkit-transition:height 0.5s ease-in;
		-o-transition:hegith 0.5s ease-in;
		transition:height 0.5s ease-in;
	}

	.accordionMenu :target p{
		overflow: auto;
		height:100px;
	}
  </style>
</head>
<body>
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(img/bg-img/24.jpg);">
			<h2>자주 묻는 질문(FAQ)</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
							<a href="#"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Q&A</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!--  여기부터 -->
<div class="accordionMenu">
		<div id="html5" class="menuSection">
			<h2><a href="#html5">바니마켓의 뜻이 뭔가요? (왜 바니마켓인가요?)</a></h2>
			<p>
			바니마켓은 '바로 당신의 니즈'의 줄임말이에요.
			바니마켓을 이용하는 모든 분들의 니즈를 충족시키고 싶다는 의지가 느껴지지않나요?
			</p>
		</div>
		<div id="css3" class="menuSection">
			<h2><a href="#css3">수료일은 언제인가요?</a></h2>
			<p>
			8월 10일입니다. 한달도 안남았네요!
			</p>
		</div>
		<div id="api" class="menuSection">
			<h2><a href="#api">바니</a></h2>
			<p>
			바니바니바니바니 당근당근
			</p>
		</div>
	</div>
<!--  여기까지 -->
	<br />
	<br />
<c:import url="../common/footer.jsp" />
</body>
</html>
