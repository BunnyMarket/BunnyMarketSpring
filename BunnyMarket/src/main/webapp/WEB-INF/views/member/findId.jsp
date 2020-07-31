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
		<fieldset>
		<legend>아이디찾기</legend>
         <form action="" class="findid" method="post">
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
                        <input type="email" id="userEmail" name="userEmail"
                           required>
                     </div>
                  </td>
                  <td>
                     <div>
                        <button class="searchbtn" type="submit"
                           onclick="return check();">찾기</button>
                     </div>
                  </td>
               </tr>
            </table></div>
         </form>
         </fieldset>

<br />
<br />
<br />
		<fieldset>
		<legend>비밀번호찾기</legend>
         <form action="" class="findPwd" method="post">
         <div id ="tb">
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
                        <input type="text" id="userName" name="userName"
                           placeholder="성명" required />
                     </div></td>
               </tr>
               <tr>
                  <td>이메일</td>
                  <td>
                     <div>
                        <input type="email" id="userEmail" name="userEmail"
                           required>
                     </div>
                  </td>
                  <td>
                     <div>
                        <button class="searchbtn" type="#"
                           onclick="#">인증번호 발송</button>
                     </div>
                  </td> 
               </tr>
               <tr>
                  <td>인증번호</td>
                  <td><div>
                        <input type="text" id="chkNumber" name="chkNumber" required />
                     </div></td>
                  <td>
                     <div>
                        <button class="searchbtn" type="submit"
                           onclick="return check();">찾기</button>
                     </div>
                  </td>                    
               </tr>
            </table></div>
         </form>
         </fieldset>         
</body>
</html>