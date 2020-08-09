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
		<h2>Q&A</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/index.jsp"><i
								class="fa fa-home"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A</li>
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
								 <th></th>
								<th style="padding-right: 80px; width: 15%; text-align: center;">작성자</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;">등록일자</th>
								 <th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="q">
								<input type="hidden" value="${q.qno}" />
								<tr id="${q.qno}">

									<td>${q.qno}</td>
									<td colspan="2" align="center">${q.QTitle}</td>
									<td></td>
									<td align="left">${q.QWriter}</td>
									
									<td align="center">${q.QDate}</td>	
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="checkout_btn_inner" align="right">
						<br /> <br /> 
						<a class="btn alazea-btn mr-30"
							href="${pageContext.request.contextPath}/QNA/QNAInsertView.do">등록하기</a>
						<a class="btn alazea-btn mr-30"
							href="${pageContext.request.contextPath}">메인으로</a> <br /> <br />
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
                <div class="shop-products-area" style="margin-left: 250px;">
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
		var admin = '${admin.adminId}';
		var qnaNo = $(this).parent().attr("id");
		if(admin.match(/bunny.*/)){
			location.href = '${pageContext.request.contextPath}/QNA/QNASelectOneAdmin.do?qno=' + qnaNo;
		} else {
			location.href = '${pageContext.request.contextPath}/QNA/QNAPassword.do?qno=' + qnaNo;
		}
			});
	}); 
	


</script>

<c:import url="../../views/common/footer.jsp" />