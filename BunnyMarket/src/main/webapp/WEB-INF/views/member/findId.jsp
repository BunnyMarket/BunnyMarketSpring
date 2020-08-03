<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<script src="/bunny/resources/js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
	<div id="idSearchArea">
		<fieldset>
		<legend>아이디찾기</legend>
		<!-- action="findId();" -->
         <form  id="findForm" class="findid" method="post">
         <div id ="tb">
            <table>
               <tr>
                  <td>이름</td>
                  <td><div>
                        <input type="text" id="userName" name="userName"
                           placeholder="성명" required autofocus>
                     </div></td>
               </tr>
               <tr>
                  <td>이메일</td>
                  <td>
                     <div>
                        <input type="email" id="email" name="email"
                           required>
                     </div>
                  </td>
                  <td>
                     <div>
                        <button class="searchbtn" onclick="findId();" type="button">찾기</button>
                     </div>
                  </td>
               </tr>
            </table></div>
         </form>
         
         <div id="idFind"></div>
        </fieldset>
	
	
	
   
	  
		<fieldset>
		<legend>비밀번호찾기</legend>
         <form  class="findPwd" method="post">
         <div id="passwordArea">
         <div id ="sb">
            <table>
               <tr>
                  <td>아이디</td>
                  <td><div>
                        <input type="text" id="userId" name="userId"
                           placeholder="아이디" required autofocus />
                     </div></td>
               </tr>            
               <tr>
                  <td>이름</td>
                  <td><div>
                        <input type="text" id="userName2" name="userName2"
                           placeholder="성명" required />
                     </div></td>
               </tr>
               <tr>
                  <td>이메일</td>
                  <td>
                     <div>
                        <input type="email" id="email1" name="email1"
                           required>
                     </div>
                  </td>
                  <td>
                     <div>
               		  <button class="searchbtn" type="button" onclick="send();">인증번호 발송</button>
                     </div>
                  </td> 
               </tr>
               <tr>
                  <td>인증번호</td>
                  <td><div>
                        <input type="text" id="userAuthNum" name="userAuthNum" required />
                     </div></td>
                  <td>
                     <div>
                        <button class="findPwd2" id="findPwd2" type="button" onclick="findPwd();">찾기</button>
                           
                     </div>
                  </td>                    
               </tr>
            </table></div>
            
            </div>
            
         </form>
         
         <div id="newPassword" style="display:none;">
         <div id="sb">
            <table>
               <tr>
                  <td>새 비밀번호</td>
                  <td><div>
                        <input type="password" id="newPwd" name="newPwd"
                           placeholder="새 비밀번호" required autofocus />
                     </div></td>
               </tr>            
               <tr>
                  <td>새 비밀번호 확인</td>
                  <td><div>
                        <input type="password" id="newPwd2" name="newPwd2"
                           placeholder="새 비밀번호 확인" required />
                     </div></td>
                     <td>
                     <div>
               		  <button class="pwdUpdate" name="pwdUpdate" type="button" onclick="return pwdUpdate();" >비밀번호 바꾸기</button>
                     </div>
                  </td> 
               </tr>
               </table>
               </div>
            </div>
         
         </fieldset> 
         
         
         <script>
         var authNum = "0000";
         var authCheckNum = 0;   // 이메일인증 유효성 체크 통과 했는지?
         var dataUserId = "";	// 유저아이디 담기위한 변수
         var email1 = $("email1").val();
         var regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         
         
         function findId(){
     		
     		
     			
     			console.log("들어옴");
     			console.log($('#userName').val());
     			
     			$.ajax({
     				url : "${pageContext.request.contextPath}/member/findId.do",
     				data : {userName: $('#userName').val(), email : $('#email').val()},
     				dataType : "json",
     				success : function(data){
     					console.log(data);
						$("#idSearchArea").css({"display":"none"});
						$("#idFind").html("<p style='color:red; font:20px;'>회원님의 아이디는 "+data.userId+" 입니다.</p>");
     						
     						
     						 
     				}	
     					
     					
     				, error : function(req,status,error){
     					alert("아이디 찾기에서 에러");
     				
     					console.log(status);
     					console.log(error);
     				}
     		
     		
     			});


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