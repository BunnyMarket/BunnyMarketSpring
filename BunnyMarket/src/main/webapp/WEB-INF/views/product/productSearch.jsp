<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="../../views/common/header.jsp"/>

<style>
#tableArea{

}

th{
	height : 20px;

}

</style>


<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
            <h2>'${keyword}'의 검색 결과</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i>Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">검색</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- Shop Sorting Data -->
                <div class="col-12">
                
                    <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                        <!-- Shop Page Count -->
                        <div class="shop-page-count">
                            <p><font color = "orange" size = "6"><b>"${keyword}"</b></font>를 검색하여 총 <font color = "orange" size = "5">${ totalContents }</font>개의 제품이 검색되었습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
	
			<div class="contact-area-info section-padding-0-100">
		        <div class="container">
		        
		        	<c:forEach items="${list}" var="p">
		        		<c:if test = "${p.PType == 1}">
				            <div class="row align-items-center justify-content-between" 
				                 style = "padding-bottom : 30px; padding-top : 30px; border-bottom:0.5px solid #dde3ed;"
				                 onclick = "window.open('${ pageContext.request.contextPath }/product/productDetail.do?pno=${p.pno}')">
		        		
		        		</c:if>
		        		<c:if test = "${p.PType == 2}">
		        			<div class="row align-items-center justify-content-between" 
				                 style = "padding-bottom : 30px; padding-top : 30px; border-bottom:0.5px solid #dde3ed;"
				                 onclick = "window.open('${ pageContext.request.contextPath }/auction/auctionDetail.do?pno=${p.pno}')">
		        		
		        		</c:if>
			                <!-- Contact Thumbnail -->
			                <div class="col-12 col-md-2">
			                        <img src="${ pageContext.request.contextPath }/resources/upload/product/${ p.PImg }" class="d-block w-100" alt="" width="200px" height="200px">
			                </div>
			
			                <div class="col-12 col-md-10">
			                    <!-- Section Heading -->
			                    <div class="section-heading">
			                        <h5>
			                        	<c:if test = "${p.PType == 1}">[일반</c:if>
			                        	<c:if test = "${p.PType == 2}">[경매</c:if>
			                        	상품] ${ p.PTitle }
			                        
			                        </h5>
			                        <p>
			                        	<c:if test="${ p.PContent.length() > 110 }">
			                        		${ p.PContent.substring(0, 110).concat(".......") }
			                        	</c:if> 
			                        	<c:if test = "${ p.PContent.length() < 109 }">
				                        	${ p.PContent }
			                        	</c:if> 
			                        	
			                        </p>
			                    </div>
			                    <!-- Contact Information -->
			                    <div class="post-meta">
                                	<i class="fa fa-clock-o" aria-hidden="true"></i> ${ p.PDate } &nbsp;&nbsp;&nbsp;
                                	<i class="fa fa-user" aria-hidden="true"></i> ${ p.PWriter }
                            	</div>
			                </div>
			            </div>
		            </c:forEach>
		        </div>
			</div>
			
			<div>
            	<c:out value = "${ pageBar }" escapeXml = "false" />
            	<br /><br /><br />
            </div>
            
			<div class="searchArea" align = "center">
                <select name="condition" id="searchCondition" class="btn btn-secondary dropdown-toggle mr-30">
	                <option value="all">전체</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
                </select>
                <input type="search" id="keyword" name = "keyword"
                	   class = "alazea-btn mr-30" 
                	   style = "background : white; color : green;"
                	   placeholder="키워드를 입력하세요!"
                	   onkeypress="if(event.keyCode==13) {search();}"> 
				<button type="button" class="btn btn-secondary mr-30" onclick="search();">검색하기</button>
            </div>
            
            
        </div>
        
	


</section>
    <!— ##### Shop Area End ##### —>

<script>
	function search(){
		location.href="${ pageContext.request.contextPath }/product/searchProduct.do?condition="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
	}


</script>
    

<c:import url="../../views/common/footer.jsp"/>