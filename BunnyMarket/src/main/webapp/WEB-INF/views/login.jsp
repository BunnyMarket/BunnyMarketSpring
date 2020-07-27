<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <script src="/bunny/resources/js/jquery/jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" href="resources/css/loginStyle.css">
    </head>
    <body>
        <div class="wrap">
            <div id="formWrap" class="form-wrap2">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="resources/img/fb.png" alt="facebook">
                    <img src="resources/img/tw.png" alt="twitter">
                    <img src="resources/img/gl.png" alt="google">
                </div>
                <form id="login"  class="input-group" action="memberLogin.do" method="post">
                    <input type="text" id="userId" name="userId"class="input-field" placeholder="User name or Email"  >
                    <input type="password"  id="userPwd"name="userPwd"class="input-field" placeholder="Enter Password"  >
                    
                    <!-- <input type="checkbox" class="checkbox"><span>Remember Password</span>-->
                    <br /><br />
                    <button class="submit" >Login</button>
                    <br />
                    <div style="text-align:center;">
                    <button type="button" id="findBtn" onclick="window.open('findIdView.do', '아이디 찾기','width = 580, height = 600');return false">아이디/비밀번호 찾기</button>
                    </div>
                </form>
                <form id="register" action="memberEnrollEnd.do"method="post" onsubmit="return validate();" class="input-group">
                    <input type="text" class="input-field" placeholder="User ID" name="userId" id="userId"  >
                    <input type="email" class="input-field" style="width:150px" name="email" id="email" placeholder="Your Email"  >
                    <input type="button" value="인증번호 발송"  style="width:120px;height:30px;text-align:center;padding:10px;background: linear-gradient(to right, #ff105f, #ffad06);border: 0;
                cursor: pointer; outline: none;border-radius: 30px;" onclick="send();"/>
                <div id="verifyCode" class="verifyCode">
                    <input type="text" id="userAuthNum" class="input-field" style="width:150px" placeholder="Verification Code" >
                    <input type="button"  value="인증번호 확인" id="emailVerifyBtn"class="btn btn-sm btn btn-outline-info" style="width:120px;height:30px;text-align:center;padding:10px;background: linear-gradient(to right, #ff105f, #ffad06);border: 0;
                cursor: pointer; outline: none;border-radius: 30px;" />
                </div>                
                    <input type="password" class="input-field" id="userPwd" name="userPwd" placeholder="Enter Password"  >
                    
                    <input type="password" class="input-field" id="userPwd2" placeholder="dup Password"  >
                    
                    <input type="text" class="input-field" id="userName" name="userName" placeholder="Your Name"  >
                    <input type="text" class="input-field" id="nickName" name="nickName" placeholder="Your NickName"  >
                    <input type="text" class="input-field" id="birth" name="birth" placeholder="생년월일 6자"  >
                    <input type="text" class="input-field" id="phone" name="phone" placeholder="Your Phone Number"  >
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit" >회원가입</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            var emailValidNum = 0;   // 이메일 유효성 체크 통과 했는지?
    		var pwdValidNum = 0;	// 비밀번호 유효성 체크 통과 했는지?
    		var nickValidNum = 0;	// 닉네임 유효성 체크 통과 했는지?
            var authNum = "";
            var authCheckNum = 0;   // 이메일인증 유효성 체크 통과 했는지?
            var userIdValidNum = 0; // 아이디 중복 체크 통과 했는지 ?
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
                $('#formWrap').addClass('form-wrap2').removeClass('form-wrap');
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
                $('#formWrap').removeClass('form-wrap2').addClass('form-wrap');
            }
            
        		var key ;
        		
        		// 인증번호 전송 함수
            function sendEmail(){
           
               
                  
            }
            
            
		    
		 
			
		     // 인증번호 확인 함수
		       $("#emailVerifyBtn").on("click",function(){
		    		var inputAuthNum = $('#userAuthNum').val();
		    		
		    		if(inputAuthNum == authNum){
		    			window.authCheckNum = 1;
		    			alert("인증이 완료되었습니다.");
		    		}else{
		    			window.authCheckNum = 0;
		    			alert("인증번호가 일치하지 않습니다.");
		    		}
		       });
		     
		     // 인증번호 재전송 함수
		      $("#resendBtn").on("click",function(){
		    	 	sendAuthNum();
		    	 	
		      });
		     
		     // 유효성 체크 함수
		     function validate(){
		    	 if(window.emailValidNum == 0){
			    		alert("이메일이 이미 사용중이거나 유효하지 않은 형식입니다.");
			    		return false;
			    	}else if(window.userIdValidNum == 0){
			    		alert("이미 사용중인 아이디이거나 유효하지 않은 형식입니다.");	
			    		return false;
			    	}else if(window.pwdValidNum == 0){
			    		alert("유효하지 않은 비밀번호입니다.");
			    		return false;
			    	}else if(window.nickValidNum == 0){
			    		alert("이미 사용중인 닉네임이거나 유효하지 않은 형식입니다.");
			    		return false;
			    	}else if(window.authCheckNum == 0){
			    		alert("메일 인증이 완료되지 않았습니다.");
			    		return false;
				    }else{
		    		 alert("회원가입이 완료되었습니다");
		    		 return true;
		    	 }
		     }
		     
		  // 이메일 유효성 체크 이벤트
				function send(){
					var email = $("email").val();
					var regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

					
					// 유효한 이메일 형식인지 판별
					
					if(regEx.test(email) == false){
						alert("이메일 형식이 유효하지 않습니다.");
						console.log(email); 
						window.emailValidNum = 0;
						
					}else if(true){ // 중복 이메일인지 판별
						
							 $.ajax({
								url : "${pageContext.request.contextPath}/member/emailDupCheck.do",
								data : {email : email},
								dataType : "json",
								success : function(data){
									if(data.isUsable == true){
										
										window.emailValidNum = 1;
										 $('#verifyCode').addClass('verifyCode2').removeClass('verifyCode');

						                   var data = {"email": $("#email").val()}; 
									         $.ajax({
									                url : "${pageContext.request.contextPath}/member/mailAuth.do",
									                data : data,
									                success : function (data) {
									                    window.authNum = data;
									               
									                    alert("인증번호 전송완료.");
									                    
									                }  
									            });
										
									}else{
										
										window.emailValidNum = 0;
										
									}
								},
								error : function(req,status,error){
									console.log("아이디 중복 체크 실패!");
									// 화면 에러 로그
									console.log(req);
									console.log(status);
									console.log(error);
								}
								 
							 }); // ajax끝
					
					 }	

				}
				// 닉네임 유효성 체크
				$("#nickName").on("keyup",function(){
					var nickName = $(this).val();
					
							 $.ajax({
								url : "${pageContext.request.contextPath}/member/nickDupCheck.do",
								data : {nickName : nickName},
								dataType : "json",
								success : function(data){
									if(data.isUsable == true){
										$('#nickValidLabel').show();
										$('#nickDupCheckLabel').hide();
										window.nickValidNum = 1;
									}else{
										$('#nickValidLabel').hide();
										$('#nickDupCheckLabel').show();
										window.nickValidNum = 0;
									}
								},
								error : function(req,status,error){
									console.log("아이디 중복 체크 실패!");
									// 화면 에러 로그
									console.log(req);
									console.log(status);
									console.log(error);
								}
								 
							 }); // ajax끝
				 
					 });

</script>


      </body>
</html>