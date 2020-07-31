<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/views/common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>신고글 목록</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Report</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!--  여깁니다 -->
<div class="cart-area section-padding-0-100 clearfix">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="cart-table clearfix">
					<table class="table table-responsive">
						<thead class="col-12">
							<tr>
								<th style="text-align: center; width: 5%;">번호</th>
								<th style="text-align: center; width: 50%;">제목</th>
								<th style="text-align: center; width: 15%;">작성자</th>
								<th style="text-align: center; width: 15%;">등록일시</th>
								<th style="text-align: center; width: 10%;">조회수</th>
								<th style="text-align: center; width: 5%;">첨부</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 1; i < 11; i++) {
							%>
							<tr onclick="goQnAdetail();">
								<td style="text-align: center;">
									<h5><%=i%></h5>
								</td>
								<td style="text-align: center;">
									<a href="<%=request.getContextPath()%>/views/report/reportDetail.jsp"><h5>제목</h5></a>
								</td>
								<td style="text-align: center;"><h5>바니</h5></td>
								<td style="text-align: center;"><h5>2020-07-12</h5></td>
								<td style="text-align: center;"><h5>0</h5></td>
								<td style="text-align: center;"><h5>X</h5></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /> <br /> 
						<a class="btn alazea-btn mr-30"
						   href="<%=request.getContextPath()%>/views/report/reportInsert.jsp">등록하기</a>
						<a class="btn alazea-btn mr-30"
						   href="<%=request.getContextPath()%>/index.jsp">메인으로</a> 
						<br /><br />
					</div>
					<!-- Pagination -->
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#"><i
									class="fa fa-angle-right"></i></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

	<c:import url="/views/common/footer.jsp" />