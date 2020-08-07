<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>나의 포인트</h2>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${ pageContext.request.contextPath }/"><i
								class="fa fa-home"></i>Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">내 포인트</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### myPoint Area Start ##### -->
<div class="shop-page section-padding-0-100">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-12 col-lg-2"></div>
			<div class="col-12 col-lg-8">
				<div class="checkout-content">
					<h3 class="title--">나의 당근</h3>
					<div class="products" align="right">
						<h4>현재 포인트</h4>
						<h4 id="nowPoint" style="color: orange"></h4>
					</div>
					<div align="center">
						<div class="checkout-btn mt-30" style="width: 45%; display: inline-block;">
							<a href="javascript:void(window.open('${ pageContext.request.contextPath }/point/pointChargeView.do', '_blank', 'width=600px, height=800px'))" 
							   class="btn alazea-btn w-100">당근 충전하러 가기☆</a>
						</div>
						<div class="checkout-btn mt-30" style="width: 45%; display: inline-block; background-color: yellow;">
							<a href="javascript:void(window.open('${ pageContext.request.contextPath }/point/pointChargeView.do', '_blank', 'width=600px, height=800px'))" 
							   class="btn alazea-btn w-100">당근 환급하러 가기☆</a>
						</div>
					</div>
					<hr />
					<c:forEach items="${myPoint }" var="point" varStatus="st">
						<c:if test="${point.bpStatus eq 1 }">
							<div class="products">
								<div class="products-data">
									<h5>충전한 당근</h5>
									<div class="single-products d-flex justify-content-between align-items-center">
										<input type="hidden" id="originPoint-${st.index }" value="${point.nowPoint }" />
										<p>${point.bpDate }</p>
										<h5 id="pointComma-${st.index }" style="color: green;"></h5>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${point.bpStatus eq 2 }">
							<div class="products">
								<div class="products-data">
									<h5>환급받은 당근</h5>
									<div class="single-products d-flex justify-content-between align-items-center">
										<input type="hidden" id="originPoint-${st.index }" value="${point.nowPoint }" />
										<p>${point.updt }</p>
										<h5 id="pointComma-${st.index }" style="color: red;"></h5>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${point.upsno eq 1}">
							<div class="products">
								<div class="products-data">
									<h5>사용한 당근</h5>
									<div class="single-products d-flex justify-content-between align-items-center">
										<input type="hidden" id="originPoint-${st.index }" value="${point.nowPoint }" />
										<p>${point.updt }</p>
										<h5 id="pointComma-${st.index }" style="color: orange;"></h5>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${point.upsno eq 2}">
							<div class="products">
								<div class="products-data">
									<h5>결제 완료된 당근</h5>
									<div class="single-products d-flex justify-content-between align-items-center">
										<input type="hidden" id="originPoint-${st.index }" value="${point.nowPoint }" />
										<p>${point.updt }</p>
										<h5 id="pointComma-${st.index }" style="color: orange;"></h5>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${point.upsno eq 3 }">
							<div class="products">
								<div class="products-data">
									<h5>환불 받은 당근</h5>
									<div class="single-products d-flex justify-content-between align-items-center">
										<input type="hidden" id="originPoint-${st.index }" value="${point.nowPoint }" />
										<p>${point.bpDate }</p>
										<h5 id="pointComma-${st.index }" style="color: blue;"></h5>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col-12 col-lg-2"></div>
		</div>
	</div>
</div>
<section class="shop-page section-padding-0-100">
    <div class="container">
        <div class="row">
            <!-- All Products Area -->
            <div class="col-12 col-lg-2"></div>
			<div class="col-12 col-lg-8">
                <div class="shop-products-area">
                    <div>
                     <c:out value="${pageBar}" escapeXml="false"/>
                    </div>
                 </div>
            </div>
            <div class="col-12 col-lg-2"></div>
        </div>
    </div>
</section>
<script>
	
	var size = ${myPoint.size()};
	for(var i = 0; i < size; i++){
		var origin = $("#originPoint-"+i).val();
		$("#pointComma-"+i).text(parseInt(origin).toLocaleString());
	}
	
	var nowPoint = ${nowPoint};
	$("#nowPoint").text(nowPoint.toLocaleString());
	
</script>


<%@ include file="../common/footer.jsp"%>