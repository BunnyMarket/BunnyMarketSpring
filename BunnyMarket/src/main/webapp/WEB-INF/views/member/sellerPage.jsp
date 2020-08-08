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
            <h2>판매자 페이지</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">상점</li>
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
                  <c:if test="${seller.photo == null }">
				<img src="${pageContext.request.contextPath }/resources/img/usericon.png" id="userImg" class="circleImg" width="344.8px" height="357.56px"
				alt="userImg" />
			</c:if>
			<c:if test="${seller.photo != null }">
				<img src="${pageContext.request.contextPath }/resources/member/profile/${seller.photo}" id="userImg" class="circleImg" width="344.8px" height="357.56px"
				alt="userImg"/>
			</c:if> <br />
                  <h3>${seller.nickName}님의 상점</h3>
               </div>
               <div>
                  <p><a href="${pageContext.request.contextPath }/member/tradeView.do?userId=${seller.nickName}">판매중인 상품 보기</a> </p>
                  <br /><br />
               </div>
            </div>
                
               
             
    
	<!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        

        <div class="container"> 
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link active" data-toggle="tab" role="tab" style="font-size: 24px;">${seller.userId}님의 Reviews 
                                <span class="text-muted"></span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                           
                                           <c:forEach items="${ReviewList }" var="s" >
                                            <div class="single_user_review mb-30">
                                                <div class="review-rating">
                                                	
                                                   <c:forEach begin="1" end="${s.rating}">
                                                   		<i class="fa fa-star" aria-hidden="true"></i>
                                                   </c:forEach>
                                                 
                                                   
                                                    <br>
                                                    <span style="font-size:17px;">${s.recontent}</span>
                                                </div>
                                                <div class="review-details">
                                                    <p style="font-size:15px;">by <a href="#">${s.rewriter}</a><span></span></p>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            
                                        </li>
                                    </ul>
                                </div>
								<c:if test="${reCount == 0}">
                                <div class="submit_a_review_area mt-50">
                                    <h3>후기 작성하기</h3>
                                    <form action="${pageContext.request.contextPath}/review/reviewInsert.do?userId=${seller.userId}" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group d-flex align-items-center">
                                                    <span class="mr-15" style="font-size:20px;">평가하기 : </span>
                                                    <div class="stars">
                                                        <input type="radio" value="1" name="rating" class="star-1" id="star-1">
                                                        <label class="star-1" for="star-1">1</label>
                                                        <input type="radio" value="2" name="rating" class="star-2" id="star-2">
                                                        <label class="star-2" for="star-2">2</label>
                                                        <input type="radio" value="3" name="rating" class="star-3" id="star-3">
                                                        <label class="star-3" for="star-3">3</label>
                                                        <input type="radio" value="4" name="rating" class="star-4" id="star-4">
                                                        <label class="star-4" for="star-4">4</label>
                                                        <input type="radio" value="5" name="rating" class="star-5" id="star-5">
                                                        <label class="star-5" for="star-5">5</label>
                                                        <span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="form-group">
                                                    <label for="name" style="font-size:18px;">닉네임</label>
                                                    <input type="text" class="form-control" id="rewriter" value="${member.userId}" disabled="disabled" style="font-size:18px;">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="comments" style="font-size:18px;">후기 : </label>
                                                    <textarea class="form-control" id="recontent" name="recontent" rows="5" data-max-length="150" style="font-size:18px;" placeholder="1000자 이내로 작성해주시기 바랍니다."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" onclick="return validate();"   class="btn alazea-btn">후기 작성 완료</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                </c:if>
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
    <script>
    	function validate(){
    		if($('input[name=star]:checked').val() == 0 || $('input[name=star]:checked').val() == ""){
    			alert("별점을 선택하세요 !");
    			return false;
    		}
    		if($("#recontent").val() == "" || $("#recontent").val() == 0){
    			alert("후기를 작성해주세요 !");
    			
    			return false;
    		}
    		
    		/* $('#rewriter').attr("value",{member.userId}); */
    		return true;
    	}
    </script>
    
   <!-- <script>
   		function goInsertReview(){
   			var check = confirm("정말 등록하시겠습니까? <br> 한번 등록한 글은 수정할 수 없습니다.");
   			if(check){
	   			$.ajax({
	   				data : {
	   					rating : $('input[name=star]:checked').val(),
	   					reWriter : ${member.userId} ,
	   					reContent : $("#comments").val() ,
	   					sellerId : ${seller.userId}
	   				}
	   			,	url : "${pageContext.request.contextPath }/review/reviewInsert.do"
	   			,	dataType : "Json"
	   			, success : function(data){
	   				console.log(data);
	   			}
	   			});
   				
   			}
   		}
   </script> -->
	
    
	
<c:import url="../common/footer.jsp"/>