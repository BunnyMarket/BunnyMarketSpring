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
                                    <th colspan="4" style="padding-top: 30px">쪽지함</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="i" begin="1" end="10">
                                <tr>
                                    <td class="price" style="text-align: left; width: 2%">
	                                   	<div class="whoareyou">
	                                       	<img class="imageRadius" src="<%=request.getContextPath() %>/resources/img/bg-img/38.jpg" alt="Product">
                                       	</div>
                                    </td>
                                    <td class="price" colspan="2" style="text-align: left; width: 58%">
	                                	<a href="${pageContext.request.contextPath}/views/mail/mailView.jsp">
            	                        	<h5 style="padding-top: 10px">작성자</h5>
        	                                <p>안녕하십니까 거래를 하러왔다.</p>
    	                            	</a>
                                    </td>
                                    <td class="price" style="text-align: right; width: 40%">
                                        <p style="padding-top: 20px">2020-07-07</p>
                                    </td>
                                </tr>
	                           	</c:forEach>
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

