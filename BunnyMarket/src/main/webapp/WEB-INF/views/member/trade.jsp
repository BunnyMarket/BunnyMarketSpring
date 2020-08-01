<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../../views/common/header.jsp"/>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>일반 상품</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i>홈화면</a></li>
                            <li class="breadcrumb-item active" aria-current="page">판매 중인 상품 목록 관리</li>
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
                            <p>판매중인 목록</p>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
                            <form action="#" method="post" class="form-inline">
                            
                                <!-- <select class="custom-select widget-title">
                                  <option selected>최신글 보기</option>
                                  <option value="1">예전글 보기</option>
                                </select>
                                <select class="custom-select widget-title">
                                  <option selected></option>
                                  <option value="1">20개씩 보기</option>
                                  <option value="2">50개씩 보기</option>
                                </select> -->
                                
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
                                    <input type="radio" name="customCheck" class="custom-control-input" onclick="goAuctionProduct('${member.nickName}');" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">경매중인 상품$ <span class="text-muted"></span></label>
                                    
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck2">
                                    <label class="custom-control-label" for="customCheck2">판매중인 상품$ <span class="text-muted">(72)</span></label>
                                    
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck3">
                                    <label class="custom-control-label" for="customCheck3">찜한 목록 <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck4">
                                    <label class="custom-control-label" for="customCheck4">거래중인 상품 목록 <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck5">
                                    <label class="custom-control-label" for="customCheck5">구매완료 상품 <span class="text-muted">(20)</span></label>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row" id="auctionTrade">
                        </div>
                        </div>
                        </div>
               <%--  <c:forEach begin="1" end="10" var="i"></c:forEach>
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
	                                        <p id="bidderCount-${st.index}"></p>
											
											<c:if test="${p.PPrice gt p.BPrice }">
		                                        <h6>${p.PPrice} 당근</h6>
											</c:if>
											<c:if test="${p.PPrice lt p.BPrice }">
		                                        <h6>${p.BPrice} 당근</h6>
											</c:if>
                                            
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
						</div>
						
                        <div>
	                        <c:out value="${pageBar}" escapeXml="false"/>
                        </div> 
                     </div>
                </div> --%>
            </div>
        </div>
    </section>
    <!-- ##### Shop Area End ##### -->
      <script>
     
  
      
      
      
  
    function goAuctionProduct(nickName){
    	$.ajax({
    		url : "${pageContext.request.contextPath}/auction/auctionTradeList.do",
    		data :{
    			nickName : nickName
    		}, dataType : "json",
    		success : function(result){
    			 console.log(result.list);
    			 console.log(result.totalContents);
    			 console.log(result.numPerPage);
    			 console.log(result.pageBar);
    			var tlist = list;
    			var list = list;
    	
    	    	   for(var i in result.list){
    	    	   $("#auctionTrade").append('<div class="col-12 col-sm-6 col-lg-4">'
						    	    	   +'	<div class="single-product-area mb-50">'
						    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" >'
						    	    	   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+result.list[i].pno+'">'
						    	    	   +'			<a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno='+result.list[i].pno+'"><img style="height: 300px; width: 255px;"  src="${ pageContext.request.contextPath }/resources/upload/auction/'+result.list[i].pimg+'" alt=""></a>'			
						    	    	   +'			<div class="product-meta d-flex">'
						    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
						    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
						    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
						    	    	   +'			</div>'
						    	    	   +'		</div>'
						    	    	   +'	</div>'
						    	    	   +'	<div class="product-info mt-15 text-center">'
						    	    	   +'	<p><a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno='+result.list[i].pno+'">'
						    	    	   +		result.list[i].ptitle
						    	    	   +'	</a></p>'
						    	    	   +'	<p id="bidderCount-'+i + '"></p>'
						//    	    	   +'<c:if test="${p.PPrice gt p.BPrice }">'
						    	    	   +'	<h6>${p.PPrice} 당근</h6>'
						//    	    	   +'</c:if>'
						//    	    	   +'<c:if test="${p.PPrice lt p.BPrice }">'
						 //   	    	   +'<h6>${p.BPrice} 당근</h6>'
						 //   	    	   +'</c:if>'
						    	    	   +'	</div>'
						    	    	   +'</div>'
						    	   );
    	    	   
    	    	   
    					
    	    	   }
    	    	   $("#auctionTrade").append('<c:out value="'+result.pageBar+'" escapeXml="false"/>');
    		}
    		
    	});
    };
  </script>

<c:import url="../../views/common/footer.jsp"/>
