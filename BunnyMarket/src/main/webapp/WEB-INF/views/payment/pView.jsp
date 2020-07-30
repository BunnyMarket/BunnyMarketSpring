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
	
	#terms:hover{
		color: orange;
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
	                                		<input type="hidden" id="bPoint" value="0"/>
	
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
									<td colspan="2" align="center">
										<input type="checkbox" required="required"/>&nbsp;&nbsp;
										<label style="font-size: 20px; text-align : left;">
											<a id="terms" style=" font-weight: bold; font-size: 23px;" href="#" title="유료서비스 이용약관보러가기">유료서비스 이용약관</a>에 동의합니다.
										</label>
									</td>
								</tr>
                              
                                <tr>
									<td style="text-align: right;" colspan="2">
	                                	<h5 style="padding-top: 10px; text-align: left;">결제 수단</h5>
	                                	<div align="center">
	                                		<input type="hidden" id="bpstatus" value="1" />
											<button class="btn alazea-btn mt-15" id="kakaoPay" onclick="payByKakao();">카카오페이</button>
											<button class="btn alazea-btn mt-15" id="naverPay" onclick="payByKakao();">네이버페이</button>
											<button class="btn alazea-btn mt-15" id="creditCard" onclick="payByKakao();">신용카드</button>
	                                	</div>
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
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	 
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
				$("#bPoint").val(0);
			}
		});
		
		/* var reg = /\B(?=(\d{3})+(?!\d))/g; */
		
		function updatePrice(price){
			var origin = $("#bPoint").val();
			$("#giveMeMoney").text((parseInt(origin) + parseInt(price)).toLocaleString());
			$("#giveMeCarrot").text(((parseInt(origin) + parseInt(price))/100).toLocaleString());
			$("#bPoint").val(parseInt(origin) + parseInt(price));
		}
		
		var IMP = window.IMP; // 생략가능
		$(function() {
			IMP.init('imp88766985');
		});
		
		function payByKakao(){
			IMP.request_pay({
				pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'BunnyMarket 당근 결제',
				amount : parseInt($('#bPoint').val()),
				status : $("#bpstatus").val()
				/* buyer_email : '구매자 이메일',
				buyer_name : '구매자 이름',
				buyer_tel : '구매자 전화번호',
				buyer_addr : '구매자 주소',
				buyer_postcode : '구매자 지역번호' */
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					$.ajax({
						url : "/point/pointCharge.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
						type : 'POST',
						dataType : 'json',
						data : {
							point : rsp.amount,
							//userId : rsp.imp_uid,
							price : rsp.paid_amount,
							status : rsp.status
							/* title : rsp.name,
							pg_tid : rsp.pg_tid,
							buyer_name : rsp.buyer_name,
							paid_at : rsp.paid_at,
							receipt_url : rsp.receipt_url */
						//기타 필요한 데이터가 있으면 추가 전달
						}
					});
					
					var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
					
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		}
		
		
		<%-- $('#kakaoPay').on('click', function(){
				IMP.request_pay({
					pg : 'kakao',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : 'BunnyMarket 당근 결제',
					amount : parseInt($('#bPoint').val()),
					buyer_email : '구매자 이메일',
					buyer_name : '구매자 이름',
					buyer_tel : '구매자 전화번호',
					buyer_addr : '구매자 주소',
					buyer_postcode : '구매자 지역번호'
				}, function(rsp) {
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "/test/orderconfirm.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'toy',
								code : 'P0001',
								quan : '<%=hmap.get("sum") %>',
								imp_uid : rsp.imp_uid,
								pay_method : rsp.pay_method,
								price : rsp.paid_amount,
								status : rsp.status,
								title : rsp.name,
								pg_tid : rsp.pg_tid,
								buyer_name : rsp.buyer_name,
								paid_at : rsp.paid_at,
								receipt_url : rsp.receipt_url
							//기타 필요한 데이터가 있으면 추가 전달
							}
						});
						
						var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
						
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		}); --%>
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