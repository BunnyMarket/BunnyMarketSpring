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
<title>Bunny Market</title>

<!-- Favicon -->
<link rel="icon" href="${ pageContext.request.contextPath }/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/style.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.5.1.min.js"></script>
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
                                        <!-- <div class = "price" style="padding-top: 20px">100 당근이 필요해요!</div> -->
                                    </td>
                                </tr>
                                <tr>
                                	<td>
                                	<h5 style="padding-top: 10px">충전 금액</h5>
                                	<div class="price" style="padding-top: 20px">
                                		<input type="hidden" id="help" value="0"/>
                                		<p style="font-size: 23px;">
                                			<span id="giveMeCarrot" style="color:orange">0</span>당근 <br />
                                			(<span id="giveMeMoney" style="color:orange">0</span>원)
                                		</p>
                                	</div>
                                	</td>
                                    <td style = "text-align : right;" id="carrotAdd">
                                    	<button class="btn alazea-btn mt-15" id="one" value="1000">+1,000</button>
                                    	<button class="btn alazea-btn mt-15" id="two" value="5000">+5,000</button>
                                    	<button class="btn alazea-btn mt-15" id="three" value="10000">+10,000</button>
                                    	<button class="btn alazea-btn mt-15" id="four" value="50000">+50,000</button>
                                    	<button class="btn alazea-btn mt-15" id="five" value="100000">+100,000</button>
                                    	<button class="btn alazea-btn mt-15" id="six" value="500000">+500,000</button>
                                    	<button class="btn alazea-btn mt-15" id="resetPlz">Reset</button>
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
										<p style="text-align : left;"><a href="#">유료서비스 이용약관</a>에 동의합니다.</p>
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
	 
		$("#one").on("click", function(){
			alert($("#one").val());
			var price = $("#one").val();
			updatePrice(price);
		});
		$("#two").on("click", function(){
			alert($("#two").val());
			var price = $("#two").val();
			updatePrice(price);
		});
		$("#three").on("click", function(){
			alert($("#three").val());
			var price = $("#three").val();
			updatePrice(price);
		});
		$("#four").on("click", function(){
			alert($("#four").val());
			var price = $("#four").val();
			updatePrice(price);
		});
		$("#five").on("click", function(){
			alert($("#five").val());
			var price = $("#five").val();
			updatePrice(price);
		});
		$("#six").on("click", function(){
			alert($("#six").val());
			var price = $("#six").val();
			updatePrice(price);
		});
		$("#resetPlz").on("click", function(){
			var check = confirm("정말 취소하시겠습니까?");
			if(check){
				$("#giveMeMoney").text(0);
				$("#giveMeCarrot").text(0);
				$("#help").val(0);
			}
		});
		
		/* var reg = /\B(?=(\d{3})+(?!\d))/g; */
		
		function updatePrice(price){
			var origin = $("#help").val();
			$("#giveMeMoney").text((parseInt(origin) + parseInt(price)).toLocaleString());
			$("#giveMeCarrot").text(((parseInt(origin) + parseInt(price))/100).toLocaleString());
			$("#help").val(parseInt(origin) + parseInt(price));
		}
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