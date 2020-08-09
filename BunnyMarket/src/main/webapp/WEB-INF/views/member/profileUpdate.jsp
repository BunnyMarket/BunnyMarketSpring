<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="../common/header.jsp" />

<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);"></div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">profile</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">

			<form id="updateForm" name="memberUpdateFrm"
	action="${pageContext.request.contextPath}/member/memberUpdate.do"
	method="post" enctype="multipart/form-data">
				<div class="row justify-content-between">
					<div class="col-12 col-md-6 col-lg-5">
					
						<div class="single_product_thumb">
							<div>
								<div id="pImgArea">
								<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
								<c:if test="${member.photo == null }">
									<img src="/bunny/resources/img/usericon.png" id="userImg" class="circleImg" name="userPhoto"class = "d-block w-100" width="344.8px" height="357.56px"
									alt="userImg" />
								</c:if>
								<c:if test="${member.photo != null }">
									<img src="/bunny/resources/member/profile/${member.photo}" name="userPhoto" class="circleImg" id="userImg" class = "d-block w-100" width="344.8px" height="357.56px"
									alt="userImg"/>
								</c:if>
								</div>
								
								<div id="pImgFileArea">
									<input type="file" id="userPhoto" name="userPhoto"
										onchange="loadImg(this, 1);" />
										
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<h2 align="center">회원 정보 수정</h2>
						<div class="single_product_desc">
							<!-- <h4 class="title">상품 제목</h4> -->
							<label for="userId">아이디</label>
							<input type="text"  class = "form-control" name="userId" value="${member.userId}" readonly>
							
							<label for="userPwd">비밀번호</label>
							<input type="password" id="userPwd" name="userPwd" class = "form-control" required  />
							


							<label for="dupPwd">비밀번호 확인</label>
							<input type="password" id="userPwd2" name="userPwd2" class = "form-control" required  />
							
							<label for="nickName">닉네임</label>
							<input type="text" id="nickName" value="${member.nickName}" class = "form-control" name="nickName" readonly>
							
							<label for="birth">생년월일</label>
							<input type="text" name="birth" value="${member.birth}" class = "form-control" readonly>
							
							<label for="email">이메일</label>
							<input type="text" name="email" value="${member.email}" class = "form-control" readonly>
							
							<label for="phone">휴대폰 번호</label>
							<input type="text" id="phone" name="phone" value="${member.phone}" class = "form-control">
							
							<label for="introduce">자기소개</label>
							<textarea name="introduce" id="introduce" cols="30" rows="10" class = "form-control">${member.introduce} </textarea>
							
						</div>
					</div>
					
					
					
				</div>
				<div align="right">
					<button type="button" class="btn alazea-btn mt-15" onclick="showConfirm();"> 회원 탈퇴</button>
					<button type="submit" class="btn alazea-btn mt-15">수정완료</button>
					<button id="cancel" class="btn alazea-btn mt-15"onclick="history.go(-1)">취소하기</button>
				</div>
			</form>
		</div>
	</div>

	
</section>





<script>
	
	function showConfirm(){
		if(confirm("정말 회원 탈퇴 하시겠습니까?"))
			{
				location.href = "${pageContext.request.contextPath}/member/memberDelete.do";
			}else{
				alert("취소 하셨습니다.");
			}
	}
	 
	 $(function(){
			$('#pImgFileArea').hide();
			
			$('#pImgArea').click(() => {
				$('#userPhoto').click();
			});
			
		}); 
	
		function loadImg(value, num){
			
			if(value.files && value.files[0])  {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					switch(num) {
					case 1 : $('#titleImg').attr('src', e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

	$('#userPwd2').change(
			function() {

				if ($('#userPwd').val() == $('#userPwd2').val()) {
					$('#pwdResult').html("비밀번호 값이 일치합니다.").addClass('success')
							.removeClass('fail').css('color', 'blue');
				} else {
					$('#pwdResult').html("비밀번호 값이 다릅니다.").addClass('fail')
							.removeClass('success').css('color', 'red');
					$('#userPwd2').val('');
				}
			});

	$('#imgBtn').on('click', function() {
		$('#profileImgBtn').click();
	});

	function loadImg(value) {

		if (value.files && value.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				$('#userImg').attr('src', e.target.result);
			}

			reader.readAsDataURL(value.files[0]);
		}
	};
</script>
<c:import url="../common/footer.jsp" />