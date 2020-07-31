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
		<h2>Q&A</h2>
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
					<table class="table table-responsive">
						<thead class="col-12">
							<tr>
								<th style="width: 10%">번호</th>
								<th colspan="2" style="width: 50%; text-align: center;">제목</th>
								<th style="padding-left: 8px; width: 20%; text-align: center;">작성자</th>
								<th style="padding-left: 8px; width: 20%; text-align: center;">등록일자</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 1; i < 11; i++) {
							%>
							<tr onclick="goQnAdetail();">
								<td>
									<h5><%=i%></h5>
								</td>
								<td colspan="2" style="width: 50%; text-align: center;">
									<a href="<%=request.getContextPath()%>/views/QNA/QNA_Detail.jsp"><h5>제목</h5></a>
								</td>
								<td style=" text-align: center;"><h5>바니</h5></td>
								<td style=" text-align: center;"><h5>2020-07-12</h5></td>
								<td style=" text-align: center;"></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /><br />
						<a class="btn alazea-btn mr-30"
							href="<%=request.getContextPath()%>/views/QNA/QNA_Insert.jsp">등록하기</a>
						<a class="btn alazea-btn mr-30"
							href="<%=request.getContextPath()%>/index.jsp">메인으로</a> <br />
						<br />
					</div>
					<!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </nav>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/views/common/footer.jsp" />