<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="../../views/common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>공지사항</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!--  여깁니다 -->

<!-- ##### Cart Area Start ##### -->
<div class="cart-area section-padding-0-100 clearfix">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="cart-table clearfix">
					<table class="table table-responsive" id="tableArea">
						<thead class="col-12">
							<tr>
								<th style="width: 10%">번호</th>
								<th colspan="2" style="width: 50%; text-align: center;">제목</th>
								<!-- <th style="padding-left: 8px; width: 20%; text-align: center;">작성자</th> -->
								<th style="padding-left: 8px; width: 20%; text-align: center;">등록일자</th>
								<th style="padding-left: 8px; width: 20%; text-align: center;">조회수</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="n">
							<tr id="${n.nno}">
								<td>
									<h5>${n.nno}</h5>
								</td>
								<td colspan="2" style="width: 50%; text-align: center;">
									<h5>${n.NTitle}</h5>
								</td>
								<%-- <td style=" text-align: center;"><h5>${n.NWriter}</h5></td> --%>
								<td style=" text-align: center;"><h5>${n.NDate}</h5></td>
								<td style=" text-align: center;">${n.NTotal}</td>
								<td></td>
							</tr>
     						</c:forEach>
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /><br />
						<a class="btn alazea-btn mr-30"
							href="${pageContext.request.contextPath}">메인으로 </a><br />
						<br />
					</div>
					<!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                        	<c:out value="${pageBar}"  escapeXml="false"/>
                        </ul>
                    </nav>
				</div>
			</div>
		</div>
	</div>
</div>
 <script>
  	 	$(function(){
  		$("#tableArea td").mouseenter(function(){
  			$(this).parent().css({"background":"#FAD7A0","cursor":"pointer"});
  		}).mouseout(function(){
  			$(this).parent().css({"background" : "white"});
  		}).click(function(){
  			var noticeNo = $(this).parent().attr("id");
  			console.log("noticeNo="+noticeNo);
  			location.href="${pageContext.request.contextPath}/notice/mNoticeDetail.do?no="+noticeNo;
  		});
  	}); 
  </script>
<c:import url="../../views/common/footer.jsp" />