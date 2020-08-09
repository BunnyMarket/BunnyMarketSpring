<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../../views/common/header.jsp"/>

<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
            <h2>일반 상품</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i>Home</a></li>
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
                        <!-- <!-- Search by Terms
                        <div class="search_by_terms">
                            <form class="form-inline">
                                <select class="custom-select widget-title" id="orderBySelect">
                                  <option value="1">최신글 보기</option>
                                  <option value="2">예전글 보기</option>
                                </select>
                            </form>
                        </div> -->
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
                                    <input type="radio" name="customCheck" class="custom-control-input" onclick="goAuctionProduct('${member.nickName}');" id="customCheck1" checked="checked">
                                    <label class="custom-control-label" for="customCheck1">경매중인 상품 <span class="text-muted"></span></label>
                                    
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck2" onclick="goProductSelling('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck2">판매중인 상품 <span class="text-muted"></span></label>
                                    
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck3" onclick="goLoveProduct('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck3">찜한 목록 <span class="text-muted"></span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck4" onclick="goTradeProduct('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck4">거래중인 상품 목록(일반) <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck5" onclick="goTradeAuction('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck5">거래중인 상품 목록(경매) <span class="text-muted"></span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck6" onclick="goCompleteProduct('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck6">구매완료 상품(일반 상품) <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2" onclick="goCompleteAuction('${member.nickName}');">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck7">
                                    <label class="custom-control-label" for="customCheck7">구매완료 상품(경매 상품) <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck8" onclick="goSellCompleteProduct('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck8">판매완료 상품(일반 상품) <span class="text-muted"></span></label>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck9" onclick="goSellCompleteAuction('${member.nickName}');">
                                    <label class="custom-control-label" for="customCheck9">판매완료 상품(경매 상품) <span class="text-muted"></span></label>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row" id="auctionTrade"></div>
                        <div class="row" id="productAll">
                            <!-- Single Product Area -->
                            <c:forEach items="${list}" var="p" varStatus="st">
	                            <div class="col-12 col-sm-6 col-lg-4">
	                                <div class="single-product-area mb-50">
	                                    <!-- Product Image -->
	                                    <div class="product-img" style="height: 300px; width: 255px;" id="pImg-${st.index}">
	                                        <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=${p.pno}">
	                                        	<img src="${ pageContext.request.contextPath }/resources/upload/product/${ p.PImg}" style="height: 300px; width: 255px;">
	                                        </a>
	                                        <div class="product-meta d-flex">
	                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
	                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
	                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
	                                        </div> 
	                                    </div>
	                                    <!-- Product Info -->
	                                    <div class="product-info mt-15 text-center">
	                                        <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=${p.pno}">
	                                            <p>${p.PTitle}</p>
	                                        </a>
	                                        <input type="hidden" id="originPrice-${st.index }" value="${p.PPrice}"/>
	                                        <h6><span id="pCarrot-${st.index }"></span>당근</h6>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Shop Area End ##### -->
<script>
    function goAuctionProduct(nickName){
    	goPage("/auction/auctionTradeList.do", "/auction/auctionDetail.do?pno=", nickName);
    };
    function goProductSelling(nickName){
    	goPage("/product/productTradeList.do", "/product/productDetail.do?pno=", nickName);
    };
    function goLoveProduct(nickName){
    	goPage("/product/loveProductList.do", "/product/productDetail.do?pno=", nickName);
    };
    function goCompleteProduct(nickName){
    	goPage("/product/completeProductList.do", "/product/productDetail.do?pno=", nickName);
    };
    function goCompleteAuction(nickName){
    	goPage("/auction/completeAuctionList.do", "/auction/auctionDetail.do?pno=", nickName);
    };
    function goSellCompleteProduct(nickName){
    	goPage("/product/sellCompleteProductList.do", "/product/productDetail.do?pno=", nickName);
    };
    function goSellCompleteAuction(nickName){
    	goPage("/auction/sellCompleteAuctionList.do", "/auction/auctionDetail.do?pno=", nickName);
    };
    function goTradeProduct(nickName){
    	goPage("/product/goTradeProduct.do", "/product/productDetail.do?pno=", nickName);
    	/* $.ajax({
			  url : "${pageContext.request.contextPath}/product/goTradeProduct.do"
			, data : {
					 nickName : nickName
					 //, order : order
				}
			, dataType : "json"
			, success : function(data){
				$("#productAll").empty();
				$("#auctionTrade").empty();
		 	    for(var i in data.list){
		 	    	var pprice = data.list[i].pprice;
		 	    	var bprice = data.list[i].bprice;
		 	    	var price = 0;
		 	    	if(pprice > bprice){
		 	    		price = parseInt(pprice).toLocaleString();
		 	    	} else {
		 	    		price = parseInt(bprice).toLocaleString();
		 	    	}
			    	price = parseInt(pprice).toLocaleString();
			    	console.log("dno ? : " + data.list[i].dno);
			    	console.log("pno ? : " + data.list[i].pno);
	    	    	$("#auctionTrade").append('<div class="col-12 col-sm-6 col-lg-4">'
							    	    	   +'	<div class="single-product-area mb-50">'
							    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
				 						   	   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ data.list[i].pno+'">'
											   +'			<a href="${ pageContext.request.contextPath }/deal/dealDetail.do?dno='+ data.list[i].dno+'">'
						   					   +'				<img style="height: 300px; width: 255px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+data.list[i].pimg+'">'
					    	   				   +'			</a>'
											   +'			<div class="product-meta d-flex">'
							    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
							    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
							    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
							    	    	   +'			</div>'
							    	    	   +'		</div>'
							    	    	   +'		<div class="product-info mt-15 text-center">'
							    	    	   +'			<p><a href="${ pageContext.request.contextPath }/deal/dealDetail.do?dno='+ data.list[i].dno+'">'
							    	    	   +				data.list[i].ptitle
							    	    	   +'			</a></p>'
							    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
							    	    	   +'		</div>'
							    	    	   +'	</div>'
							    	    	   +'</div>'
		    	   );
				}
			}
		}); */
    }
	function goTradeAuction(nickName){
		goPage("/auction/goTradeAuction.do", "/auction/auctionDetail.do?pno=", nickName);
		/* $.ajax({
			  url : "${pageContext.request.contextPath}/auction/goTradeAuction.do"
			, data : {
					 nickName : nickName
					 //, order : order
				}
			, dataType : "json"
			, success : function(data){
				$("#productAll").empty();
				$("#auctionTrade").empty();
		 	    for(var i in data.list){
		 	    	var pprice = data.list[i].pprice;
		 	    	var bprice = data.list[i].bprice;
		 	    	var price = 0;
		 	    	if(pprice > bprice){
		 	    		price = parseInt(pprice).toLocaleString();
		 	    	} else {
		 	    		price = parseInt(bprice).toLocaleString();
		 	    	}
			    	price = parseInt(pprice).toLocaleString();
			    	console.log("dno ? : " + data.list[i].dno);
			    	console.log("pno ? : " + data.list[i].pno);
	    	    	$("#auctionTrade").append('<div class="col-12 col-sm-6 col-lg-4">'
							    	    	   +'	<div class="single-product-area mb-50">'
							    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
				 						   	   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ data.list[i].dno+'">'
											   +'			<a href="${ pageContext.request.contextPath }/deal/dealDetail.do?dno='+ data.list[i].dno+'">'
						   					   +'				<img style="height: 300px; width: 255px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+data.list[i].pimg+'">'
					    	   				   +'			</a>'
											   +'			<div class="product-meta d-flex">'
							    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
							    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
							    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
							    	    	   +'			</div>'
							    	    	   +'		</div>'
							    	    	   +'		<div class="product-info mt-15 text-center">'
							    	    	   +'			<p><a href="${ pageContext.request.contextPath }/deal/dealDetail.do?dno='+ data.list[i].dno+'">'
							    	    	   +				data.list[i].ptitle
							    	    	   +'			</a></p>'
							    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
							    	    	   +'		</div>'
							    	    	   +'	</div>'
							    	    	   +'</div>'
		    	   );
				}
			}
		}); */
    }
    function goPage(ajaxUrl, url, nickName){
		// var order = $("#orderBySelect option:selected").val();
		$.ajax({
			  url : "${pageContext.request.contextPath}" + ajaxUrl
			, data : {
					 nickName : nickName
					 //, order : order
				}
			, dataType : "json"
			, success : function(data){
				console.log("여기까지는 오냐?");
				appendHTML(data.list, url);
			}
		});
   	}
    function appendHTML(list, url){
		$("#productAll").empty();
		$("#auctionTrade").empty();
 	    for(var i in list){
 	    	var pprice = list[i].pprice;
 	    	var bprice = list[i].bprice;
 	    	var price = 0;
 	    	if(pprice > bprice){
 	    		price = parseInt(pprice).toLocaleString();
 	    	} else {
 	    		price = parseInt(bprice).toLocaleString();
 	    	}
	    	price = parseInt(pprice).toLocaleString();
    	    if(list[i].pstatus == 2){
	    	    $("#auctionTrade").append('<div class="col-12 col-sm-6 col-lg-4">'
						    	    	   +'	<div class="single-product-area mb-50">'
						    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
	    	    						   +'			<h4 style="position: absolute;top: 43%; left: 30%;">판매 완료</h4>'
	    	    						   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ list[i].pno+'">'
    	    							   +'			<a href="${ pageContext.request.contextPath }'+ url + list[i].pno+'">'
					   					   +'				<img style="height: 300px; width: 255px; opacity: 0.2;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'">'
		    	    	   				   +'			</a>'
										   +'			<div class="product-meta d-flex">'
						    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
						    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
						    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
						    	    	   +'			</div>'
						    	    	   +'		</div>'
						    	    	   +'		<div class="product-info mt-15 text-center">'
						    	    	   +'			<p><a href="${ pageContext.request.contextPath }'+ url + list[i].pno+'">'
						    	    	   +				list[i].ptitle
						    	    	   +'			</a></p>'
						    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
						    	    	   +'		</div>'
						    	    	   +'	</div>'
						    	    	   +'</div>'
					    	   );
    	    } else {
    	    	$("#auctionTrade").append('<div class="col-12 col-sm-6 col-lg-4">'
						    	    	   +'	<div class="single-product-area mb-50">'
						    	    	   +'		<div class="product-img" style="height: 300px; width: 255px;" id="pImg-'+i+'">'
			 						   	   +'			<input type="hidden" name="pno-'+ i + '" id="pno-'+ i + '" value="'+ list[i].pno+'">'
										   +'			<a href="${ pageContext.request.contextPath }'+url + list[i].pno+'">'
					   					   +'				<img style="height: 300px; width: 255px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'">'
				    	   				   +'			</a>'
										   +'			<div class="product-meta d-flex">'
						    	    	   +'				<a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>'
						    	    	   +'				<a href="#" class="add-to-cart-btn">Add to cart</a>'
						    	    	   +'				<a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>'
						    	    	   +'			</div>'
						    	    	   +'		</div>'
						    	    	   +'		<div class="product-info mt-15 text-center">'
						    	    	   +'			<p><a href="${ pageContext.request.contextPath }'+ url + list[i].pno+'">'
						    	    	   +				list[i].ptitle
						    	    	   +'			</a></p>'
						    	    	   +'			<h6><span>'+price+'</span>당근</h6>'
						    	    	   +'		</div>'
						    	    	   +'	</div>'
						    	    	   +'</div>'
	    	   );
    	    }
		}
	}
</script>

<c:import url="../../views/common/footer.jsp"/>
