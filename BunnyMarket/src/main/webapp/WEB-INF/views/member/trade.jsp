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
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/index.jsp"><i class="fa fa-home"></i>홈화면</a></li>
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
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">판매중인 상품 <span class="text-muted">(72)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck2">
                                    <label class="custom-control-label" for="customCheck2">찜한 목록 <span class="text-muted">(20)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck3">
                                    <label class="custom-control-label" for="customCheck3">거래중인 상품 목록 <span class="text-muted">(15)</span></label>
                                </div>
                                <!-- Single Checkbox -->
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="radio" name="customCheck" class="custom-control-input" id="customCheck4">
                                    <label class="custom-control-label" for="customCheck4">구매완료 상품 <span class="text-muted">(20)</span></label>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row">

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/40.png" alt=""></a>
                                        <!-- Product Tag -->
                                        <div class="product-tag">
                                            <a href="#">Hot</a>
                                        </div>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/41.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/42.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/43.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/44.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/45.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/46.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/47.png" alt=""></a>
                                        <!-- Product Tag -->
                                        <div class="product-tag sale-tag">
                                            <a href="#">Sale</a>
                                        </div>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp"><img src="${ pageContext.request.contextPath }/resources/img/bg-img/48.png" alt=""></a>
                                        <div class="product-meta d-flex">
                                            <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                            <a href="#" class="add-to-cart-btn">Add to cart</a>
                                            <a href="#" class="compare-btn"><i class="arrow_left-right_alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- Product Info -->
                                    <div class="product-info mt-15 text-center">
                                        <a href="${ pageContext.request.contextPath }/views/product/productDetail.jsp">
                                            <p>모나미 볼펜 100개</p>
                                        </a>
                                        <h6>10,000원</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
						<nav aria-label="Page navigation">
                            <button type="submit" class="btn alazea-btn mt-15" 
									onclick="location.href='${ pageContext.request.contextPath }/views/product/productInsert.jsp'">등록하기</button>
                        </nav>
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
    </section>
    <!-- ##### Shop Area End ##### -->

<c:import url="../../views/common/footer.jsp"/>
