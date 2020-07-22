<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="js/star-rating.js" ></script>

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
    <input name="rating" id="rating-system" type="text" class="rating rating-loading" data-size="xs">
  <f:form modelAttribute="review" action="${ reviewsPath }" method="post">
    <c:forEach var="error" items="${ fieldErrors }">
        <div class="alert alert-warning">
            <strong>${ error.getField() }</strong>: ${ error.getDefaultMessage() }
        </div>
    </c:forEach>
    <f:textarea path="text" cssClass="form-control" rows="5" />
    <!-- 평점 선택창 -->
    <f:label path="rating">평점: </f:label>
    <f:select path="rating">
        <f:options items="${ ratingOptions }"/>
    </f:select>
    <f:hidden path="bookId" />
    <f:hidden path="userId" />
    <button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
</f:form>

<table class="table table-stripped" id="reviews">
    <thead>
        <tr>
            <th>Rating</th> <!-- 평점 -->
            <th>User</th>
            <th>Text</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${ reviews }" varStatus="status">
            <!-- 평점 기준 별표시 출력 -->
            <tr>
                <td><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.rating }">★</c:forEach></td>
                <td>익명</td>
                <td>${ review.text }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<input type="text" class="rating rating-loading" value="${ review.rating }" data-size="xs">
    
   <%-- <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table clearfix">
   <img src="/bunny/resources/img/usericon.png" height="70px" alt="userimg" /> <br />
   아이디
   </div>
   <div>
   <a href="#">회원정보 상세보기</a> <br />
   <a href="#">내 당근 내역 조회하기</a>
   </div>
   <hr />
   <div>
   <table>
      <tr>
         <th>판매 중인 상품 목록</th>
      </tr>
      <tr>
         <td>가</td>
         <td>나</td>
         <td>
         <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
         </td>
      </tr>
      <c:if test="${sellList}.size > 0">
      <c:forEach var="sell" items="${sellList}">
      ..
      </c:forEach>
      </c:if>
      <c:if test="${sellList}.size <= 0"> <tr><td>판매 중인 상품이 업습니다.</td></tr> </c:if>
   </table>
   </div>
   <hr />
   <div>
   <table>
      <tr>
         <th>거래 중인 상품 목록</th>
      </tr>
      <tr>
         <td>가</td>
         <td>나</td>
         <td>
         <a href="#"><img src="/bunny/resources/img/plus.jpg" height="20px" alt="plusBtn" />더보기</a>
         </td>
      </tr>
   </table>
   </div>
   <hr />
   <div>
   <table>
      <tr>
         <th>찜한 상품 목록</th>
      </tr>
      <tr>
         <td>가</td>
         <td>나</td>
         <td>
         <a href="#"><img src="/bunny/resources/img/plus.jpg" height="20px" alt="plusBtn" />더보기</a>
         </td>
      </tr>
   </table>
   </div>
   <hr />
   <div>
   <table>
      <tr>
         <th>구매 완료된 상품 목록</th>
      </tr>
      <tr>
         <td>가</td>
         <td>나</td>
         <td>
         <a href="#"><img src="/bunny/resources/img/plus.jpg" height="20px" alt="plusBtn" />더보기</a>
         </td>         
      </tr>
   </table> 
   </div>
   </div>
   </div>
   </div>
   </div> --%>
<c:import url="../common/footer.jsp"/>