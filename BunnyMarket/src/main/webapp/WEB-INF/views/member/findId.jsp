<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<script src="/bunny/resources/js/jquery/jquery-2.2.4.min.js"></script>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/style.css">
</head>
<body>

	<section class="single_product_details_area mb-50">
		<div class="produts-details--content mb-50">
			<div class="container">

				<form id="findForm" class="findid" method="post">
					<div class="row justify-content-between">


						<div class="col-12 col-md-6">
							<h2 align="center">아이디 찾기</h2>
						</div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<!-- <h4 class="title">상품 제목</h4> -->
								<label for="userName">이름</label> <input type="text"
									id="userName" class="form-control" style="width: 100%;"
									name="userName">
							</div>
						</div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<label for="email">이메일</label> <input type="email" id="email"
									name="email" style="width: 100%;" class="form-control" />
							</div>
						</div>
						<div class="col-4 col-md-6">
							<div class="single_product_desc">
								<button type="button" class="btn alazea-btn mt-30"
									style="height: 45px;" onclick="findId();">조회하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="produts-details--content mb-50">
			<div class="container">

				<form id="findForm" class="findid" method="post">
					<div class="row justify-content-between">


						<div class="col-12 col-md-6">
							<div id="idFind" class="single_product_desc"></div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</section>
	
	
		<div class="produts-details--content mb-50" id="pwdFind2" name="pwdFind2">
			<div class="container">

				<form id="findPwd" class="findPwd" method="post">
					<div class="row justify-content-between">


						<div class="col-12 col-md-6">
							<h2 align="center">비밀번호 찾기</h2>
						</div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<!-- <h4 class="title">상품 제목</h4> -->
								<label for="userId">아이디</label> <input type="text" id="userId"
									class="form-control" style="width: 100%;" name="userId">
								<label for="userName2">이름</label> <input type="text"
									id="userName2" class="form-control" style="width: 100%;"
									name="userName2">
							</div>
						</div>
						<div class="col-4 col-md-6"></div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<label for="email1">이메일</label> <input type="email" id="email1"
									name="email1" style="width: 100%;" class="form-control" /> 
							</div>
						</div>
						<div class="col-4 col-md-6">
							<div class="single_product_desc">
								<button type="button" class="btn alazea-btn mt-30"
									style="height: 45px;" onclick="send();">인증번호 요청</button>
								<br>
							</div>
						</div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<label for="userAuthNum">인증번호</label> <input type="text"
									id="userAuthNum" class="form-control" style="width: 100%;"
									name="userAuthNum">
							</div>
						</div>
						<div class="col-4 col-md-6">
							<div class="single_product_desc">
								<button type="button" class="btn alazea-btn mt-30"
									style="height: 45px;" onclick="findPwd();">조회하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="produts-details--content mb-50" id="pwdFind" style="display:none;">
			<div class="container">

				<form id="findPwd" class="findPwd" method="post">
					<div class="row justify-content-between">


						
						
					
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<label for="newPwd">새 비밀번호</label> <input type="password" id="newPwd"
									name="newPwd" style="width: 100%;" class="form-control" /> <br>
							</div>
						</div>
						<div class="col-4 col-md-6">
							<div class="single_product_desc">
								
								<br>
							</div>
						</div>
						<div class="col-8 col-md-6">
							<div class="single_product_desc">
								<label for="newPwd2">새 비밀번호 확인</label> <input type="password"
									id="newPwd2" class="form-control" style="width: 100%;"
									name="newPwd2">
							</div>
						</div>
						<div class="col-4 col-md-6">
							<div class="single_product_desc">
								<button type="button" class="btn alazea-btn mt-30"
									style="height: 45px;" onclick="return pwdUpdate();">변경하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>


	


       }
         
   
     	
    	// 인증번호 전송 함수
        function send(){
     		email1 = $('#email1').val();
        	if(regEx.test(email1) == false){
                alert("이메일 형식이 유효하지 않습니다.");
                window.emailValidNum = 0;
                
             }else if(true){
     		
		         $.ajax({
		                url : "${pageContext.request.contextPath}/member/mailAuth.do",
		                data : {email : $('#email1').val()},
		                success : function (data) {
		                    window.authNum = data;
		                    console.log(data);		               
		                    alert("인증번호 전송완료.");
		                    
		                    
		                }  
		            });
        }
    }
     	
        // 인증번호 확인 함수
	     function findPwd(){
	    		var inputAuthNum = $('#userAuthNum').val();
	    		
	    		if(inputAuthNum == authNum){
	    			
	    			window.authCheckNum = 1;
	    			alert("인증이 완료되었습니다.");
	    			$("#passwordArea").css({"display":"none"});
	    			$("#newPassword").css({"display":"block"});
	    			
	    				 
	    			
	    			
	    		}else{
	    			window.authCheckNum = 0;
	    			alert("인증번호가 일치하지 않습니다.");
	    		}
	       }
	    			
	  // 비밀번호 찾기 후 변경
	     function pwdUpdate(){
		  
		  
	        	if(!isSamePwd($('#newPwd').val(),$('#newPwd2').val())){
	        		alert("두 비밀번호가 같지 않습니다.");
	        	}else{
	        			$.ajax({
	        				url : "${pageContext.request.contextPath}/member/pwdUpdate.do",
	        				data : {userId: $('#userId').val(), userPwd : $('#newPwd').val()},
	        				dataType : "json",
	        				success : function(data){
	        					alert("비밀번호 변경이 완료 되었습니다.");
	        					window.close();
	        				},
	        				error : function(){
	        					alert("에러!");
	        				}
	        			});
	        		}
	        	}
       
        
	    
	 
	     // 두 비밀번호가 같은지 체크하는 함수
	    	function isSamePwd(pwd1,pwd2){
	    		if(pwd1 == pwd2){
	    			return true;
	    		}else return false;
	    		
	    	}
	     
	     
	   
     
         </script>        
</body>
</html>