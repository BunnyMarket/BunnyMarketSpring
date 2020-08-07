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
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/index.jsp"><i class="fa fa-home"></i>Home</a></li>
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/views/member/myPage.jsp">마이페이지</a></li>
                            <li class="breadcrumb-item active" aria-current="page">후기작성하기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->
    
	<!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="cart-area section-padding-0-100 clearfix">
	        <div class="container">
	            <div class="row">
	            	<div class="col-12" align="center">
	                    <div class="cart-table clearfix">
							<img src="${pageContext.request.contextPath}/resources/img/usericon.png" height="70px" alt="userimg" /> <br />
							<h3>아이디</h3>
						</div>
					</div>
				</div>
			</div>
		</div>

        <div class="container"> 
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link active" data-toggle="tab" role="tab" style="font-size: 24px;">Reviews <span class="text-muted">(1)</span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-30">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="false"></i>
                                                    <i class="fa fa-star" aria-hidden="false"></i>
                                                    <i class="fa fa-star" aria-hidden="false"></i>
                                                    <i class="fa fa-star" aria-hidden="false"></i>
                                                    <span style="font-size:17px;">이사람 그지같습니다. 두번다시 거래하지 않을거예욧</span>
                                                </div>
                                                <div class="review-details">
                                                    <p style="font-size:15px;">by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review mb-30">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true" ></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span style="font-size:17px;">정말 좋았습니다. 물건 하나부터 열까지 만족스러워요</span>
                                                </div>
                                                <div class="review-details">
                                                    <p style="font-size:15px;">by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review mb-30">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span style="font-size:17px;">최고의 서비스! 중고물품 거래하는건데도 엄청 섬세하게 신경써주셨어요.. 다시 거래하고싶습니다.</span>
                                                </div>
                                                <div class="review-details">
                                                    <p style="font-size:15px;">by <a href="#">Colorlib</a> on <span>12 Sep 2018</span></p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="submit_a_review_area mt-50">
                                    <h3>후기 작성하기</h3>
                                    <form method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group d-flex align-items-center">
                                                    <span class="mr-15" style="font-size:20px;">평가하기 : </span>
                                                    <div class="stars">
                                                        <input type="radio" name="star" class="star-1" value="1" id="star-1">
                                                        <label class="star-1" for="star-1">1</label>
                                                        <input type="radio" name="star" class="star-2" value="2" id="star-2">
                                                        <label class="star-2" for="star-2">2</label>
                                                        <input type="radio" name="star" class="star-3" value="3" id="star-3">
                                                        <label class="star-3" for="star-3">3</label>
                                                        <input type="radio" name="star" class="star-4" value="4" id="star-4">
                                                        <label class="star-4" for="star-4">4</label>
                                                        <input type="radio" name="star" class="star-5" value="5" id="star-5">
                                                        <label class="star-5" for="star-5">5</label>
                                                        <span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="name" style="font-size:18px;">닉네임</label>
                                                    <input type="email" class="form-control" id="name" placeholder="Ming" disabled="disabled" style="font-size:18px;">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="comments" style="font-size:18px;">후기 : </label>
                                                    <textarea class="form-control" id="comments" rows="5" data-max-length="150" style="font-size:18px;" placeholder="1000자 이내로 작성해주시기 바랍니다."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button id="reviewInsertBtn" onclick="/review/reviewInsert.do?" class="btn alazea-btn">후기 작성 완료</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->
    


<c:import url="../../views/common/footer.jsp"/>


































