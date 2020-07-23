<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정하기</title>
<script src="/bunny/resources/js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
		<h2 align="center">회원 정보 수정</h2>
		
		<form id="updateForm" action="memberUpdate.do" method="post">
			
			<table align="center">
				<tr>
					<td rowspan="8" width="200px">
						<img src="/bunny/resources/img/usericon.png" id="userImg" width="100px" alt="userImg" /><br />
						<button type="button" id="imgBtn">사진 첨부</button>
						<input type="file" name="userImg" id="profileImgBtn" style="display: none;"
						onchange="loadImg(this);" />
					</td>
					<td width="150px">아이디 : </td>
					<td><input type="text" name="userId" value="아이디" readonly></td>
					<td width="200px"></td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" id="userPwd" name="userPwd" required/></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인 : </td>
					<td><input type="password" id="userPwd2" name="userPwd2" required></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>닉네임 : </td>
					<td>
					<input type="text" id="nickName" name="nickName" required>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일 : </td>
					<td>
						<input type="text" name="birthday" value="1990-01-01" readonly>
					</td> 
					<td></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="email" value="abc@example.com"
					      style="width:140px;" readonly>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호 : </td>
					<td>
					 <select name="phone1" id="phone1">
               			 <option value="010" selected>010</option>
               			 <option value="011">011</option>
              			 <option value="016">016</option>
               			 <option value="019">019</option>
           			 </select>-
						<input type="text" maxlength="4" id="phone2" name="phone2" size="2" numberonly required>-
						<input type="text" maxlength="4" id="phone3" name="phone3" size="2" numberonly required>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>소개글 : </td>
					<td><textarea name="introduce" id="introduce" cols="30" rows="10"></textarea></td>
					<td></td>
				</tr>
			</table>
			<br>
			<div class="btns" align="center">
				<button id="cancel" onclick="history.go(-1)">취소하기</button> &nbsp;
				<button id="updateBtn" onclick="update();">수정하기</button> 
			</div>
			</form>

		
		<script>
		$("input:text[numberOnly]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	
		function update() {
			 var confirm = window.confirm("수정하시겠습니까?");
			if($('#userPwd, #userPwd2, #nickName, #phone1, #phone2, #phone3').val() = ""){
				$('#nickName').addClass('fail').removeClass('success');
			}
			if($('.fail').length == 0 && confirm){
				$("#updateForm").submit();
	        } else {
	            alert('입력 양식이 올바르지 않습니다.');
	            event.preventDefault();
	      
	        }

		};
		
		$('#userPwd2').change(
				function() {
					
					if ($('#userPwd').val() == $('#userPwd2').val()) {
						$('#pwdResult').html("비밀번호 값이 일치합니다.").addClass('success').removeClass('fail').css('color', 'blue');
					} else {
						$('#pwdResult').html("비밀번호 값이 다릅니다.").addClass('fail').removeClass('success').css('color', 'red');
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
</body>
</html>