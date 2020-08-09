<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="../../views/common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
		<h2>신고글 목록</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/index.jsp"><i
								class="fa fa-home"></i>Home</a></li>
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
									<th style="width: 5%">번호</th>
								<th colspan="2" style="width: 40%; text-align: center;">제목</th>
								<th style="padding-right: 80px; width: 15%; text-align: center;">작성자</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;">등록일자</th>
								<th style="padding-left: 8px; width: 10%; text-align: center;">첨부파일</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;">유형</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="r" >
						
						<input type="hidden" value="${r.RNo}" />
					        <tr id="${r.RNo}">
					        
							<td>${r.RNo }</td>
							<td colspan="2" style="padding-left: 150px;"> ${r.RTitle}</td>
							<td>${r.RWriter }</td>
							<td style="padding-left: 45px;">${r.RDate }</td>
							
							<c:if test="${fn:contains(r.RContent, '<img') == 'true' }">
							 <td style="color:green;" align="center">첨부</td>
							</c:if>
							<c:if test="${fn:contains(r.RContent, '<img') == 'false' }">
							<td style="color: red;" align="center">없음</td>
							</c:if>
							
							<c:if test="${r.PType eq 1 }">
							<td style="color:black;" align= "center">상품</td>
							</c:if>
							 <c:if test="${r.PType eq 2  }"> 
							 <td style="color:blue;" align= "center">경매</td>
							 </c:if>
							 <c:if test="${r.pno eq 0}">
							 <td style="color:gray;" align= "center">일반</td>
							 </c:if>
							 <td></td>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /> <br /> 
						<a class="btn alazea-btn mr-30"
						  	href="${pageContext.request.contextPath}/report/reportDirectInsertView.do">등록하기</a>
						<a class="btn alazea-btn mr-30"
						  	href="${pageContext.request.contextPath}">메인으로</a> 
						<br /><br />
					</div>
					<!-- Pagination -->
					<nav aria-label="Page navigation">
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area" style="margin-left: 300px;">
                        <div>
	                        <c:out value="${pageBar}" escapeXml="false"/>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
<script>
$(function(){
	$("#tableArea td").click(function(){
		var rNo = $(this).parent().attr("id");
		var admin = '${admin.adminId}';
		if(admin.match(/bunny.*/)){
			location.href = "${pageContext.request.contextPath}/report/reportSelectOneAdmin.do?rno=" + rNo;
		}else{
			location.href = "${pageContext.request.contextPath}/report/reportPassword.do?rno=" + rNo;
		}

	});
});
	
</script>

	<c:import url="../../views/common/footer.jsp" />