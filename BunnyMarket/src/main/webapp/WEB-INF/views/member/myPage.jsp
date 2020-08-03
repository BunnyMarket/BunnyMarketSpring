<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../common/header.jsp"/>
<!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>Cart</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Cart</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

   <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
               <div class="col-12" align="center">
                    <div class="cart-table clearfix">
                  <c:if test="${member.photo == null }">
				<img src="/bunny/resources/img/usericon.png" id="userImg" class="circleImg" width="344.8px" height="357.56px"
				alt="userImg" />
			</c:if>
			<c:if test="${member.photo != null }">
				<img src="/bunny/resources/member/profile/${member.photo}" id="userImg" class="circleImg" width="344.8px" height="357.56px"
				alt="userImg"/>
			</c:if> <br />
                  <h3>${member.nickName}님의 상점</h3>
               </div>
               <div>
               <form id="myForm2" action="${ pageContext.request.contextPath }/member/memberView.do" method="post">
               		<input type="hidden" name="userId" value="${member.userId}">
                  </form>
                  <p><a href="#" id="goMypage" onclick="goMypage();" style="font-size: 20px;">회원정보 상세보기</a></p>
                  <p><a href="${pageContext.request.contextPath}/point/myPointView.do" style="font-size: 20px;">내 당근 내역 조회하기</a></p>
                  <p><a href="tradeView.do?userId=${member.userId}">판매중인 상품 보기</a> </p>
                  <br /><br />
               </div>
            </div>
            
            <script type="text/javascript">
            	function goMypage(){
            		$("#myForm2").submit();
            	}
             
            </script>
               
             
    
	<!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        

        <div class="container"> 
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link active" data-toggle="tab" role="tab" style="font-size: 24px;">${member.userId}님의 Reviews <span class="text-muted"></span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                         <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                           
                                           <c:forEach items="${memberReviewList }" var="mr" >
                                            <div class="single_user_review mb-30">
                                                <div class="review-rating">
                                                	
                                                   <c:forEach begin="1" end="${mr.rating}">
                                                   		<i class="fa fa-star" aria-hidden="true"></i>
                                                   </c:forEach>
                                                 
                                                   
                                                    <br>
                                                    <span style="font-size:17px;">${mr.recontent}</span>
                                                </div>
                                                <div class="review-details">
                                                    <p style="font-size:15px;">by <a href="#">${mr.rewriter}</a><span></span></p>
                                                </div>
                                            </div>
                                            
                                            </c:forEach>
                                            <c:if test="${memberReviewList.size() == 0}">
                                            	<p>등록된 리뷰가 없습니다.</p>
                                            </c:if>
                                            
                                        </li>
                                    </ul>
                                </div>

                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>  
                  
                  
                           
                    
            </div>
        </div>
    </div>
    
   
	
    
	
<c:import url="../common/footer.jsp"/>