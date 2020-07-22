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
	body {
		font-family: 'Hanna', sans-serif;
	}
 	.whoareyou {
		width: 80px;
		height: 80px;
		border-radius: 70%;
		overflow: hidden;
		margin-right: 0px;
		padding-right: 0px;
	}
	.imageRadius{
		width: 100%;
		height: 100%;
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
                        <table class="table table-responsive" id="table">
                            <thead>
                                <tr>
                                    <th colspan="4" style="padding-top: 30px">당근 충전</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: left;">
                                    	<h5 style="padding-top: 10px">당근 충전하기</h5>
                                    </td>
                                    <td style="text-align: right;">
                                        <!-- 경매창에서 구입하기눌렀을때 당근 충전이 필요하면 더 충전해야하는 당근을 보여주기 -->
                                        <div class = "price" style="padding-top: 20px">100 당근이 필요해요!</div>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                	<h5 style="padding-top: 10px">충전 금액</h5>
                                	<div class="price" style="padding-top: 20px">0원 (0당근)</div>
                                	</td>
                                    <td style = "text-align : right;">
	                                    	<button class = "btn alazea-btn mt-15">+1,000</button>
	                                    	<button class = "btn alazea-btn mt-15">+5,000</button>
	                                    	<button class = "btn alazea-btn mt-15">+10,000</button>
	                                    	<button class = "btn alazea-btn mt-15">+50,000</button>
	                                    	<button class = "btn alazea-btn mt-15">+100,000</button>
	                                    	<button class = "btn alazea-btn mt-15">+500,000</button>
                                    </td>
                                </tr>
                                <tr>
                                	<td>
	                                	<h5 style="padding-top: 10px">결제 수단</h5>
                                	</td>
									<td style="text-align: right;">
										<button class="btn alazea-btn mt-15">카카오페이</button>
										<button class="btn alazea-btn mt-15">네이버페이</button>
										<button class="btn alazea-btn mt-15">신용카드</button>
										<button class="btn alazea-btn mt-15">휴대폰 결제</button>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"/>
									</td>
									<td>
										<p style = "text-align : left;"><a href="#">유료서비스 이용약관</a>에 동의합니다.</p>
									</td>
								</tr>
								<tr>
									
									<td>
										<button class = "btn alazea-btn mt-15">결제하기</button>
									</td>
									<td>
									</td>
								</tr>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Mail Area End ##### -->

	
	<script>
		$(function(){
			$("#table td").mouseenter(function(){
				$(this).parent().css({"background":"#70c745", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"none"});
			}).click(function(){
				<%-- var mno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/views/mail/mailDetail.jsp"; --%>
			});
		});
	</script>

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