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
		<h2>신고글 목록</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/index.jsp"><i
								class="fa fa-home"></i>홈화면</a></li>
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
					<br />
					<p>총 ${totalContents}건의 게시물이 있습니다.</p>
					<br />
					<table class="table table-responsive" id="tableArea">
						<thead class="col-12">
							<tr>
									<th style="width: 10%">번호</th>
								<th colspan="2" style="width: 40%; text-align: center;">제목</th>
								<th style="padding-right: 80px; width: 15%; text-align: center;">작성자</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;">등록일자</th>
								<th style="padding-left: 8px; width: 20%; text-align: center;">첨부파일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="r">
							<tr id="${r.rno }">
							
							<input type="hidden" value="${r.rno }" />
							<td>${r.rno }</td>
							<td colspan="2"> ${r.rTitle}</td>
							<td>${r.rWriter }</td>
							<td>${r.rDate }</td>
							<td>O</td>
							<td></td>
							<!--  img 태그 없을 경우에 첨부파일 x , 있으면 o 표시 -->
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /> <br /> 
						<a class="btn alazea-btn mr-30"
						  	href="${pageContext.request.contextPath}/report/reportInsertView.do">등록하기</a>
						<a class="btn alazea-btn mr-30"
						  	href="${pageContext.request.contextPath}">메인으로</a> 
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

	<c:import url="../../views/common/footer.jsp" />