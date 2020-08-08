<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i>Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">상품</li>
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
                            <p>총 ${totalContents}개의 제품이 판매중입니다.</p>
                        </div>
                        <!-- Search by Terms -->
                        <div class="search_by_terms">
                            <form class="form-inline">
                                <select class="custom-select widget-title" id="orderBySelect">
                                  <option value="1">최신글 보기</option>
                                  <option value="2">예전글 보기</option>
                                </select>
                                <select class="custom-select widget-title" id="countSelect">
                                  <option value="9">9개씩 보기</option>
                                  <option value="18">18개씩 보기</option>
                                  <option value="36">36개씩 보기</option>
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
                                    <input type="radio" class="custom-control-input" id="typeCheck1" name="ptype" checked="checked" value="0">
                                    <label class="custom-control-label" for="typeCheck1">모든 상품 <span class="text-muted">( ${totalContents} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck2" name="ptype" value="1">
                                    <label class="custom-control-label" for="typeCheck2">전자기기(노트북/PC 외)<span class="text-muted">( ${typeCount[0]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck3" name="ptype" value="2">
                                    <label class="custom-control-label" for="typeCheck3">가구 <span class="text-muted">( ${typeCount[1]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck4" name="ptype" value="3">
                                    <label class="custom-control-label" for="typeCheck4">악세서리 <span class="text-muted">( ${typeCount[2]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck5" name="ptype" value="4">
                                    <label class="custom-control-label" for="typeCheck5">의류 <span class="text-muted">( ${typeCount[3]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck6" name="ptype" value="5">
                                    <label class="custom-control-label" for="typeCheck6">장난감 <span class="text-muted">( ${typeCount[4]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" class="custom-control-input" id="typeCheck7" name="ptype" value="6">
                                    <label class="custom-control-label" for="typeCheck7">책<span class="text-muted">( ${typeCount[5]} )</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center m-2" style="padding-left: 16px;">
                                    <input type="radio" class="custom-control-input" id="typeCheck8" name="ptype" value="7">
                                    <label class="custom-control-label" for="typeCheck8">기타 <span class="text-muted">( ${typeCount[6]} )</span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row" id="productForType"></div>
                        <div class="row" id="productAll">
                            <!-- Single Product Area -->
                            <c:forEach items="${list}" var="p" varStatus="st">
	                            <div class="col-12 col-sm-6 col-lg-4">
	                                <div class="single-product-area mb-50">
	                                    <!-- Product Image -->
	                                    <div style="height: 300px; width: 255px;" id="pImg-${st.index}">
	                                        <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=${p.pno}">
	                                        	<img src="${ pageContext.request.contextPath }/resources/upload/product/${ p.PImg}" style="height: 300px; width: 255px;">
	                                        </a>
	                                    </div>
	                                    <!-- Product Info -->
	                                    <div class="product-info mt-15 text-center">
	                                        <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=${p.pno}">
	                                            <p>${p.PTitle}</p>
	                                        </a>
	                                        <input type="hidden" id="originPrice-${st.index }" value="${p.PPrice}"/>
	                                        <h6><span id="pCarrot-${st.index }"></span>당근</h6>
	                                        <p>조회수 : ${p.PTotal }</p>
	                                    </div>
	                                </div>
	                            </div>
	                            <script>
							    	$(function(){
							    		var origin = $("#originPrice-${st.index }").val();
							    		$("#pCarrot-${st.index }").text(parseInt(origin).toLocaleString());
							    		
							    		var Pstatus = '${p.PStatus}';
							    		if(Pstatus == 2){
							    			$('<h4 style="position: absolute;top: 43%; left: 30%;">판매 완료</h4>').appendTo('#pImg-${st.index}');
							    			$('#pImg-${st.index} img').css('opacity', '0.2');
							    		}
							    	});
							    </script>
                            </c:forEach>

                        </div>
						<nav aria-label="Page navigation">
                            <button type="submit" class="btn alazea-btn mt-15" 
									onclick="location.href='${ pageContext.request.contextPath }/product/productInsert.do'">등록하기</button>
                        </nav>
                        <!-- Pagination -->
                        <div id="pageOriginDiv">
	                        <c:out value="${pageBar}" escapeXml="false"/>
                        </div>
                        <div id="pageDiv"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Shop Area End ##### -->
    
    <script>
	    $("input[name=ptype]").on("click", function(){
			goPage();
		});
	   	
	   	$("#orderBySelect").change(function(){
	   		goPage();
		});
	   	
	   	$("#countSelect").change(function(){
			goPage();
		});
	   	
	   	function goPage(){
	   		var type = $("input[name=ptype]:checked").val();
			var order = $("#orderBySelect option:selected").val();
			var count = $("#countSelect option:selected").val();
			console.log("type : " + type);
			console.log("order : " + order);
			console.log("count : " + count);
			$.ajax({
				  url : "${pageContext.request.contextPath}/product/productListType.do"
				, data : {
						  pcno : type
						, order : order
						, count : count
					}
				, dataType : "json"
				, success : function(data){
					appendHTML(data.list, data.pageBar);
				}
			});
	   	}
	
		
		function appendHTML(list, pageBar){
			
			$("#productAll").empty();
			$("#productForType").empty();
			$("#pageOriginDiv").empty();
			$("#pageDiv").empty();
			
	 	    for(var i in list){
	 	    	var pprice = list[i].pprice;
 	    		price = parseInt(pprice).toLocaleString();
	    	    if(list[i].pstatus == 2){
		    	    $("#productForType").append('<div class="col-12 col-sm-6 col-lg-4">'
							    	    	   +'	<div class="single-product-area mb-50">'
							    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
		    	    						   +'			<h4 style="position: absolute;top: 43%; left: 30%;">판매 완료</h4>'
		    	    						   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ list[i].pno+'">'
	    	    							   +'			<a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno='+list[i].pno+'">'
						   					   +'				<img style="height: 300px; width: 255px; opacity: 0.2;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'">'
			    	    	   				   +'			</a>'
											   +'			<div class="product-meta d-flex">'
							    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
							    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
							    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
							    	    	   +'			</div>'
							    	    	   +'		</div>'
							    	    	   +'		<div class="product-info mt-15 text-center">'
							    	    	   +'			<p><a href="${ pageContext.request.contextPath }/product/productDetail.do?pno='+ list[i].pno+'">'
							    	    	   +				list[i].ptitle
							    	    	   +'			</a></p>'
							    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
							    	    	   +'		</div>'
							    	    	   +'	</div>'
							    	    	   +'</div>'
						    	   );
				
	    	    } else {
	    	    	$("#productForType").append('<div class="col-12 col-sm-6 col-lg-4">'
							    	    	   +'	<div class="single-product-area mb-50">'
							    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
				 						   	   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ list[i].pno+'">'
											   +'			<a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno='+list[i].pno+'">'
						   					   +'				<img style="height: 300px; width: 255px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'">'
					    	   				   +'			</a>'
											   +'			<div class="product-meta d-flex">'
							    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
							    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
							    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
							    	    	   +'			</div>'
							    	    	   +'		</div>'
							    	    	   +'		<div class="product-info mt-15 text-center">'
							    	    	   +'			<p><a href="${ pageContext.request.contextPath }/product/productDetail.do?pno='+ list[i].pno+'">'
							    	    	   +				list[i].ptitle
							    	    	   +'			</a></p>'
							    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
							    	    	   +'		</div>'
							    	    	   +'	</div>'
							    	    	   +'</div>'
		    	   );
	    	    }
	 	    
			}
	 	   $("#pageDiv").append('<c:out value="'+pageBar+'" escapeXml="false"/>');
			
		}
		
		$(function(){
			
			var count = '${condition.count}' == 9 ? 0 : 18 ? 1 : 2;
			var order = '${condition.order}' == 1 ? 0 : 1;
			
			if('${condition.page gt 1}'){
				$("input[name=ptype]").eq('${condition.pcno}').attr('checked', 'checked');
				
				$("#countSelect option").eq(count).attr('selected', 'selected');	
				
				$("#orderBySelect option").eq(order).attr('selected', 'selected');
			}
		});
    </script>


<c:import url="../../views/common/footer.jsp"/>
