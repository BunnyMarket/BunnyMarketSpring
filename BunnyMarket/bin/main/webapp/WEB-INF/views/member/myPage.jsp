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
                  <img src="/bunny/resources/img/usericon.png" height="70px" alt="userimg" /> <br />
                  <h3>아이디</h3>
               </div>
               <div>
                  <p><a href="#" style="font-size: 20px;">회원정보 상세보기</a></p>
                  <p><a href="#" style="font-size: 20px;">내 당근 내역 조회하기</a></p>
                  <br /><br />
               </div>
            </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">판매 중인 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                           <td style="padding:90px 90px 103px 90px;  display: inline-block;">
                              <div class="product-info mt-15 text-center">
                                 <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                       </div>
                           </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">거래 중인 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                           <td style="padding:90px 90px 103px 90px;  display: inline-block;">
                              <div class="product-info mt-15 text-center">
                                 <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                       </div>
                           </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">찜한 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                           <td style="padding:90px 90px 103px 90px;  display: inline-block;">
                              <div class="product-info mt-15 text-center">
                                 <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                       </div>
                           </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">구매 완료된 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                           <td style="padding:90px 90px 103px 90px;  display: inline-block;">
                              <div class="product-info mt-15 text-center">
                                 <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                       </div>
                           </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">리뷰</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                           <a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                           <p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                           <h6>10,000원</h6>
                                       </div>
                                    </td>
                           <td style="padding:90px 90px 103px 90px;  display: inline-block;">
                              <div class="product-info mt-15 text-center">
                                 <a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                       </div>
                           </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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
	<div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
            	<div class="col-12" align="center">
                    <div class="cart-table clearfix">
						<img src="/bunny/resources/img/usericon.png" height="70px" alt="userimg" /> <br />
						<h3>아이디</h3>
					</div>
					<div>
						<p><a href="#" style="font-size: 20px;">회원정보 상세보기</a></p>
						<p><a href="#" style="font-size: 20px;">내 당근 내역 조회하기</a></p>
						<br /><br />
					</div>
				</div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">판매 중인 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
									<td style="padding:90px 90px 103px 90px;  display: inline-block;">
										<div class="product-info mt-15 text-center">
											<a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                    	</div>
									</td>
                                </tr>
                            </tbody>
                        </table>
                        <br /><br />
                    </div>
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">거래 중인 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
									<td style="padding:90px 90px 103px 90px;  display: inline-block;">
										<div class="product-info mt-15 text-center">
											<a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                    	</div>
									</td>
                                </tr>
                            </tbody>
                        </table>
                        <br /><br />
                    </div> 
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">찜한 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
									<td style="padding:90px 90px 103px 90px;  display: inline-block;">
										<div class="product-info mt-15 text-center">
											<a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                    	</div>
									</td>
                                </tr>
                            </tbody>
                        </table>
                        <br /><br />
                    </div>
                </div>
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th colspan="4">구매 완료된 상품 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
                                    <td class="cart_product_img" style="display: inline-block;">
                                        <div class="product-info mt-15 text-center">
                                        	<a href="#"><img src="/bunny/resources/img/bg-img/34.jpg" alt="Product" align="middle"></a><br />
                                        	<p>GTQ 포토샵 1급 책 팝니다(시나공)</p>
                                        	<h6>10,000원</h6>
                                    	</div>
                                    </td>
									<td style="padding:90px 90px 103px 90px;  display: inline-block;">
										<div class="product-info mt-15 text-center">
											<a href="#"><span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>더보기</a>
                                    	</div>
									</td>
                                </tr>
                            </tbody>
                        </table>
                        <br /><br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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