<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../../views/common/header.jsp"/>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>경매 상품</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i>홈화면</a></li>
                            <li class="breadcrumb-item active" aria-current="page">경매</li>
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
                            <p>${totalContents}개의 제품이 판매중입니다.</p>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
                            <form action="#" method="post" class="form-inline">
                                <select class="custom-select widget-title">
                                  <option selected>최신글 보기</option>
                                  <option value="1">예전글 보기</option>
                                </select>
                                <select class="custom-select widget-title">
                                  <option selected>10개씩 보기</option>
                                  <option value="1">20개씩 보기</option>
                                  <option value="2">50개씩 보기</option>
                                </select>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->
                        <div class="shop-widget catagory mb-50">
                            <h4 class="widget-title">Categories</h4>
                            <div class="widget-desc">
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">모든 상품 <span class="text-muted">(72)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                    <label class="custom-control-label" for="customCheck2">게임 <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                    <label class="custom-control-label" for="customCheck3">전자기기(노트북/PC 외) <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck4">
                                    <label class="custom-control-label" for="customCheck4">도서 <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck5">
                                    <label class="custom-control-label" for="customCheck5">가전제품 <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" id="customCheck6">
                                    <label class="custom-control-label" for="customCheck6">기타 <span class="text-muted">(2)</span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row">
							<c:forEach items="${list}" var="p" varStatus="st">
                            <!-- Single Product Area -->
	                            <div class="col-12 col-sm-6 col-lg-4">
	                                <div class="single-product-area mb-50">
	                                    <!-- Product Image -->
	                                    <div class="product-img" style="height: 300px; width: 255px;" >
	                                        <input type="hidden" name="pno-${st.index}" id="pno-${st.index}" value="${p.pno}">
	                                        <a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno=${p.pno}"><img style="height: 300px; width: 255px;"  src="${ pageContext.request.contextPath }/resources/upload/auction/${p.PImg}" alt=""></a>
	                                        <div class="product-meta d-flex">
	                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
	                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
	                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
	                                        </div>
	                                    </div>
	                                    <!-- Product Info -->
	                                    <div class="product-info mt-15 text-center">
	                                        <p><a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno=${p.pno}">
	                                            ${p.PTitle}
	                                        </a></p>
	                                        <p id="bidderCount-${st.index}">경매 참가자 : ${p.BCount}명</p>
	                                    	<input type="hidden" id="originPPrice-${st.index }" value="${p.PPrice}"/>
	                                    	<input type="hidden" id="originBPrice-${st.index }" value="${p.BPrice}"/>
											<h6><span id="pCarrot-${st.index }"></span>당근</h6>
                                            
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
						</div>
						<nav aria-label="Page navigation">
                            <button type="button" class="btn alazea-btn mt-15" 
									onclick="location.href='${ pageContext.request.contextPath }/auction/auctionInsertForm.do'">등록하기</button>
                        </nav>
                        <div>
	                        <c:out value="${pageBar}" escapeXml="false"/>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Shop Area End ##### -->

<script type="text/javascript">
																						
	var list = ${list.size()};
	
   	$(function(){
		for(var i = 0; i < list; i++){
		   	var pno = $("#pno-"+i).val();
			
			var originP = $("#originPPrice-"+i).val();
			var originB = $("#originBPrice-"+i).val();
			
			console.log("pno : " + pno + " / p.pPrice" + originP+ " / p.bPrice" +originB);
	   		
			if(originP > originB){
	    		$("#pCarrot-"+i).text(parseInt(originP).toLocaleString());
			} else {
				$("#pCarrot-"+i).text(parseInt(originB).toLocaleString());
			}
	   		
		}
   		
   	});
   		
</script>
<c:import url="../../views/common/footer.jsp"/>
