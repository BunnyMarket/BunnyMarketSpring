<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="views/common/header.jsp"/>
<!-- ##### Hero Area Start ##### -->
<section class="hero-area">
   <div class="hero-post-slides owl-carousel">

      <!-- Single Hero Post -->
      <div class="single-hero-post bg-overlay">
         <!-- Post Image -->
         <div class="slide-img bg-img"
            style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/1.jpg);"></div>
         <div class="container h-100">
            <div class="row h-100 align-items-center">
               <div class="col-12">
                  <!-- Post Content -->
                  <div class="hero-slides-content text-center">
                     <h2>Welcome. Bunny Market</h2>
                     <p>
                        <span><b>바</b></span>로, 당신의 <span><b>니</b></span>즈가 존재하는 마켓<br />
                        좋은 제품 안전하게 구매하세요 
                     </p>
                     <div class="welcome-btn-group">
                        <a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
                           href="#" class="btn alazea-btn active">CONTACT US</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Single Hero Post -->
      <div class="single-hero-post bg-overlay">
         <!-- Post Image -->
         <div class="slide-img bg-img"
            style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/2.jpg);"></div>
         <div class="container h-100">
            <div class="row h-100 align-items-center">
               <div class="col-12">
                  <!-- Post Content -->
                  <div class="hero-slides-content text-center">
                     <h2>Welcome. Bunny Market</h2>
                     <p>
                        <span><b>바</b></span>로, 당신의 <span><b>니</b></span>즈가 존재하는 마켓<br />
                        좋은 제품 안전하게 구매하세요 
                     </p>
                     <div class="welcome-btn-group">
                        <a href="#" class="btn alazea-btn mr-30">GET STARTED</a> <a
                           href="#" class="btn alazea-btn active">CONTACT US</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </div>
</section>
<!-- ##### Hero Area End ##### -->

<!-- ##### Product Area Start ##### -->
<section class="new-arrivals-products-area bg-white section-padding-100">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <!-- Section Heading -->
            <div class="section-heading text-center">
               <h2>일반 상품</h2>
               <p>현재 판매중인 일반 판매 상품입니다.</p>
            </div>
         </div>
      </div>

      <div class="row" id = "productList">

      </div>
   </div>
</section>
<!-- ##### Product Area End ##### -->
<!-- ##### Product Area Start ##### -->
<section class="new-arrivals-products-area bg-gray section-padding-100">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <!-- Section Heading -->
            <div class="section-heading text-center">
               <h2>경매상품</h2>
               <p>현재 진행중인 경매 상품입니다.</p>
            </div>
         </div>
      </div>

      <div class="row" id = "auctionList">
      </div>
   </div>
</section>
<!-- ##### Product Area End ##### -->


<!-- ##### Testimonial Area Start ##### -->
<section class="testimonial-area section-padding-100">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <div class="testimonials-slides owl-carousel">

               <!-- Single Testimonial Slide -->
               <div class="single-testimonial-slide">
                  <div class="row align-items-center">
                     <div class="col-12 col-md-6">
                        <div class="testimonial-thumb">
                           <img src="${ pageContext.request.contextPath }/resources/img/bg-img/13.jpg" alt="">
                        </div>
                     </div>
                     <div class="col-12 col-md-6">
                        <div class="testimonial-content">
                           <!-- Section Heading -->
                           <div class="section-heading">
                              <h2>TESTIMONIAL</h2>
                              <p>Some kind words from clients about Alazea</p>
                           </div>
                           <p>“Alazea is a pleasure to work with. Their ideas are
                              creative, they came up with imaginative solutions to some
                              tricky issues, their landscaping and planting contacts are
                              equally excellent we have a beautiful but also manageable
                              garden as a result. Thank you!”</p>
                           <div class="testimonial-author-info">
                              <h6>Mr. Nick Jonas</h6>
                              <p>CEO of NAVATECH</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Single Testimonial Slide -->
               <div class="single-testimonial-slide">
                  <div class="row align-items-center">
                     <div class="col-12 col-md-6">
                        <div class="testimonial-thumb">
                           <img src="${ pageContext.request.contextPath }/resources/img/bg-img/14.jpg" alt="">
                        </div>
                     </div>
                     <div class="col-12 col-md-6">
                        <div class="testimonial-content">
                           <!-- Section Heading -->
                           <div class="section-heading">
                              <h2>TESTIMONIAL</h2>
                              <p>Some kind words from clients about Alazea</p>
                           </div>
                           <p>“Alazea is a pleasure to work with. Their ideas are
                              creative, they came up with imaginative solutions to some
                              tricky issues, their landscaping and planting contacts are
                              equally excellent we have a beautiful but also manageable
                              garden as a result. Thank you!”</p>
                           <div class="testimonial-author-info">
                              <h6>Mr. Nazrul Islam</h6>
                              <p>CEO of NAVATECH</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- Single Testimonial Slide -->
               <div class="single-testimonial-slide">
                  <div class="row align-items-center">
                     <div class="col-12 col-md-6">
                        <div class="testimonial-thumb">
                           <img src="${ pageContext.request.contextPath }/resources/img/bg-img/15.jpg" alt="">
                        </div>
                     </div>
                     <div class="col-12 col-md-6">
                        <div class="testimonial-content">
                           <!-- Section Heading -->
                           <div class="section-heading">
                              <h2>TESTIMONIAL</h2>
                              <p>Some kind words from clients about Alazea</p>
                           </div>
                           <p>“Alazea is a pleasure to work with. Their ideas are
                              creative, they came up with imaginative solutions to some
                              tricky issues, their landscaping and planting contacts are
                              equally excellent we have a beautiful but also manageable
                              garden as a result. Thank you!”</p>
                           <div class="testimonial-author-info">
                              <h6>Mr. Jonas Nick</h6>
                              <p>CEO of NAVATECH</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>
</section>
<!-- ##### Testimonial Area End ##### -->

<script>
	$(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/product/productTopList.do"
			/* , data : { } */
			, dataType : "json"
			, success : function(data){
				appendHTML1(data.list);
			}
			, error : function(data){
				console.log("일반상품 못가져와못가져와..");
			}
		});
		
		function appendHTML1(list){
			for (var i in list){
				$('#productList').append('<div class="col-12 col-sm-6 col-lg-3">'
					                    +'    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">'
					                    +'       <!-- Product Image -->'
					                    +'       <div class="">'
					                    +'           <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=' + list[i].pno + '">'
					                    +'              <center><img style="height: 250px; width: 205px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'"></center>'
					                    +'           </a>'
					                    +'       </div>'
					                    +'       <!-- Product Info -->'
					                    +'       <div class="product-info mt-15 text-center">'
					                    +'           <a href="${ pageContext.request.contextPath }/product/productDetail.do?pno=' + list[i].pno + '">'
					                    +'               <p>' + list[i].ptitle + '</p>'
					                    +'           </a>'
					                    +'           <h6>'+ parseInt(list[i].pprice).toLocaleString() +'<font color = "orange" size = "4">당근</font></h6>'
					                    +'       </div>'
					                    +'   </div>'
					                    +'</div>'
				);
			}
			$('#productList').append('<div class="col-12 text-center">'
					                +'<a href="${ pageContext.request.contextPath }/product/productList.do" class="btn alazea-btn">더보기</a>'
					                +'</div>'
			)
		}
		
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/product/auctionTopList.do"
			, dataType : "json"
			, success : function(data){
				appendHTML2(data.list);
				console.log("경매 잘 가져오니?");
				console.log(data.list);
			}
			, error : function(data){
				console.log("경매 상품 못가져와못가져와..");
			}
		});
		 
		function appendHTML2(list){
 	    	
			for (var i in list){
				var pprice = list[i].pprice;
	 	    	var bprice = list[i].bprice;
	 	    	var price = 0;
	 	    	if(pprice > bprice){
	 	    		price = parseInt(pprice).toLocaleString();
	 	    	} else {
	 	    		price = parseInt(bprice).toLocaleString();
	 	    	} 
				$('#auctionList').append('<div class="col-12 col-sm-6 col-lg-3">'
					                    +'    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">'
					                    +'       <!-- Product Image -->'
					                    +'       <div class="">'
					                    +'           <a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno=' + list[i].pno + '">'
					                    +'              <center><img style="height: 250px; width: 205px;" src="${ pageContext.request.contextPath }/resources/upload/product/'+list[i].pimg+'"></center>'
					                    +'           </a>'
					                    +'       </div>'
					                    +'       <!-- Product Info -->'
					                    +'       <div class="product-info mt-15 text-center">'
					                    +'           <a href="${ pageContext.request.contextPath }/auction/auctionDetail.do?pno=' + list[i].pno + '">'
					                    +'               <p>' + list[i].ptitle + '</p>'
					                    +'           </a>'
					                    +'           <h6>'+  price  +'<font color = "orange" size = "4">당근</font></h6>'
					                    +'       </div>'
					                    +'   </div>'
					                    +'</div>'
				);
			}
			$('#auctionList').append('<div class="col-12 text-center">'
					                +'<a href="${ pageContext.request.contextPath }/auction/auctionList.do" class="btn alazea-btn">더보기</a>'
					                +'</div>'
			)
		}
	});




</script>

<c:import url="views/common/footer.jsp"/>