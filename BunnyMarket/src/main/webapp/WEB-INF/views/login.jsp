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
                    <input type="text" id="userId" name="userId"class="input-field" placeholder="User name or Email" required>
                    <input type="password"  id="userPwd"name="userPwd"class="input-field" placeholder="Enter Password" required>
                    
                    <!-- <input type="checkbox" class="checkbox"><span>Remember Password</span>-->
                    <br /><br />
                    <button class="submit" >Login</button>
                    <br />
                    <div style="text-align:center;">
                    <button type="button" id="findBtn" onclick="window.open('${pageContext.request.contextPath}/views/member/findId.do', '아이디 찾기','width = 580, height = 600');return false">아이디/비밀번호 찾기</button>
                    </div>
                </form>
                <form id="register" action="memberEnrollEnd.do"method="post" onsubmit="return" class="input-group">
                    <input type="text" class="input-field" placeholder="User ID" name="userId" id="userId" required>
                    <input type="email" class="input-field" style="width:150px" name="email" id="email" placeholder="Your Email" required>
                    <input type="button" value="인증번호 발송"  style="width:120px;height:30px;text-align:center;padding:10px;background: linear-gradient(to right, #ff105f, #ffad06);border: 0;
                cursor: pointer; outline: none;border-radius: 30px;" onclick="send();"/>
                <div id="verifyCode" class="verifyCode">
                    <input type="text" class="input-field" style="width:150px" placeholder="Verification Code" required>
                    <input type="button"  value="인증번호 확인" onclick="join_injeung.do${dice}" name="email_injeung" style="width:120px;height:30px;text-align:center;padding:10px;background: linear-gradient(to right, #ff105f, #ffad06);border: 0;
                cursor: pointer; outline: none;border-radius: 30px;" />
                </div>                
                    <input type="password" class="input-field" id="userPwd" name="userPwd" placeholder="Enter Password" required>
                    
                    <input type="password" class="input-field" id="userPwd2" placeholder="dup Password" required>
                    
                    <input type="text" class="input-field" id="userName" name="userName" placeholder="Your Name" required>
                    <input type="text" class="input-field" id="nickName" name="nickName" placeholder="Your NickName" required>
                    <input type="text" class="input-field" id="birth" name="birth" placeholder="생년월일 6자" required>
                    <input type="text" class="input-field" id="phone" name="phone" placeholder="Your Phone Number" required>
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit" >회원가입</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
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
            function send(){
           
               
                   $('#verifyCode').addClass('verifyCode2').removeClass('verifyCode');

        	 location.href="${pageContext.request.contextPath}/member/auth.do";
            }
        		  
</script>


      </body>
</html>