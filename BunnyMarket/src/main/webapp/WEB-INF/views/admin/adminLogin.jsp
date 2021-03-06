<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>관리자 로그인</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand"  align="middle">
						<img  style="padding-top : 200px;" src="${pageContext.request.contextPath }/resources/img/adminlogo.png" alt="">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">관리자 로그인</h4>
							<form method="POST" class="my-login-validation" action="${pageContext.request.contextPath}/admin/adminLoginForm.do">
								<div class="form-group">
									<label for="id">ID</label>
									<input id="id"  class="form-control" name="adminId" value="" required autofocus>
									<div class="invalid-feedback">
										
									</div>
								</div>

								<div class="form-group">
									<label for="password">Password
									</label>
									<input id="password" type="password" class="form-control" name="adminPw" required data-eye>
								    <div class="invalid-feedback">
								    	
							    	</div>
								</div>

								<div class="form-group">
									<div class=" custom-control">
										<label ></label>
									</div>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								<br/>
								</div>
								
								<div class="form-group m-0">
									<button  class="btn btn-primary btn-block" onclick="goHome();">
										gohome
									</button>
								</div>
								
								<div class="mt-4 text-center">
									 <a href="#"></a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
		function goHome(){
			location.href="${pageContext.request.contextPath}/";
		}
	</script>
</body>
</html>
