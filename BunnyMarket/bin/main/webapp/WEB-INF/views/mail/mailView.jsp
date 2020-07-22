<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Alazea - Gardening &amp; Landscaping HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="${ pageContext.request.contextPath }/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/style.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<style>
	* {
		margin: 0;
	}
	body {
		font-family: 'Hanna', sans-serif;
		height: 100%;
	}
	
 	.whoareyou {
		width: 50px;
		height: 50px;
		border-radius: 70%;
		overflow: hidden;
		margin-right: 0px;
		padding-right: 0px;
	}
	.imageRadius{
		width: 100%;
		height: 100%;
	}
	
	.sendMessage:focus{
		/* position: fixed;
		width: 100%;
		bottom: 50px;
		align-content: center; */
		height: 20px;
	}
	
	#messageWindow{
		min-height: calc(100vh - 20px);
	}
	
</style>
</head>
<body>

	<!-- ##### Mail Area Start ##### -->
    <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table clearfix">
                    	<div id="header">
	                    	<h5 style="padding-top: 30px">쪽지함 (ming)</h5>
	                        <hr />
                    	</div>
                        <fieldset>
                        	<div>
								<div id="messageWindow">
                        		<c:forEach var="i" begin="1" end="5">
									<div class="whoareyou" style="display: inline-block;">
										<img class="imageRadius" src="${pageContext.request.contextPath}/resources/img/bg-img/38.jpg" alt="People">
									</div>
									<div style="display: inline-block;">
										<p style="margin: 0;">안녕하세요. 혹시 물건 팔렸나요?</p>
										<p style="margin: 0;">2020-07-11 10:10</p>													
									</div>
									<div>
										<p align="right" style="margin: 0;">아니욥</p>
										<p align="right" style="margin: 0;">2020-07-11 10:10</p>	
									</div>
								</c:forEach>
									<div class="whoareyou" style="display: inline-block;">
										<img class="imageRadius" src="${pageContext.request.contextPath}/resources/img/bg-img/38.jpg" alt="People">
									</div>
									<div style="display: inline-block;">
										<p style="margin: 0;">
											이거 어떰
										</p>
										<div class="carousel-item" style="display: inline-block;">
	                                        <a class="product-img" href="${pageContext.request.contextPath}/resources/img/bg-img/49.jpg" title="Product Image">
	                                       		<img id="mailImg" class="d-block w-50" style="width: 150px" src="${pageContext.request.contextPath}/resources/img/bg-img/49.jpg" alt="1">
	                                    	</a>
                                    	</div>
										<p style="margin: 0;">2020-07-11 10:10</p>													
									</div>
									<div>
										<p align="right" style="margin: 0;">별로임 이게 더 나은듯</p>
										<div class="carousel-item" style="display: inline-block;" align="right">
	                                        <a class="product-img" href="${pageContext.request.contextPath}/resources/img/bg-img/49.jpg" title="Product Image">
	                                       		<img id="mailImg" class="d-block w-50" style="width: 150px" src="${pageContext.request.contextPath}/resources/img/bg-img/49.jpg" alt="1">
	                                    	</a>
                                    	</div>
										<p align="right" style="margin: 0;">2020-07-11 10:10</p>	
									</div>
								</div>
                        	</div>
							<div class="sendMessage" >
	                        	<hr />
								<div class="form-group" style="display: inline-block;">
                                    <input type="email" class="form-control" id="name" placeholder="입력쓰.." size="40">
                                </div>
                                <div style="display: inline-block;">
									<input type="submit" id="sendMsg" value="보내기"  class="btn mt-15" onclick="send()" style="vertical-align: middle; margin-bottom: 15px"/>
								</div>
								<input type="file" name="mailFile" id="mailFile" />
								<br /><br />
								<div class="col-12" align="center">
									<button type="button" name="addtocart" value="5" class="btn alazea-btn ml-15">신고하기</button>
									<button type="button" id="endBtn" class="btn alazea-btn ml-15" 
											onclick="location.href='${pageContext.request.contextPath}/views/mail/mailList.jsp'">나가기</button>
								</div>
							</div>
						</fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Mail Area End ##### -->
	
	<!-- 
	<script>
	    var textarea = document.getElementById("messageWindow");
	    var webSocket = new WebSocket('ws://localhost:8088/bunny/broadcasting');
	    var inputMessage = document.getElementById('inputMessage');
	    webSocket.onerror = function(event) {
	        onError(event)
	    };
	    webSocket.onopen = function(event) {
	        onOpen(event)
	    };
	    webSocket.onmessage = function(event) {
	        onMessage(event)
	    };
	    function onMessage(event) {
	        var message = event.data.split("|");
	        var sender = message[0];
	        var content = message[1];
	        if (content == "") {
	            
	        } else {
	            if (content.match("/")) {
	                if (content.match(("/" + $("#chat_id").val()))) {
	                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
	                    if (temp[1].trim() == "") {
	                    } else {
	                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
	                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
	                    }
	                } else {
	                }
	            } else {
	                if (content.match("!")) {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
	                } else {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
	                }
	            }
	        }
	    }
	    function onOpen(event) {
	        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	    }
	    function onError(event) {
	        alert(event.data);
	    }
	    function send() {
	        if (inputMessage.value == "") {
	        } else {
	            $("#messageWindow").html($("#messageWindow").html()
	                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
	        }
	        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
	        inputMessage.value = "";
	    }
	    //     엔터키를 통해 send함
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    window.setInterval(function() {
	        var elem = document.getElementById('messageWindow');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
	</script> -->

	<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="${ pageContext.request.contextPath }/resources/js/active.js"></script>
</body>

</html>

