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
           
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">profile</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->
<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#handleModal">profile</button>


<c:import url="../common/footer.jsp"/>
<!-- the modal -->
<div style="text-align:center;" class="modal fade" id="handleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header ">
        <h4 class="col-12 modal-title text-center" id="exampleModalLabel">Profile</h4>
      </div>
      <div class="modal-body">
        <form action="#">
        <div style="height:150px;">
        <img src="${ pageContext.request.contextPath }/resources/img/usericon.png" style="width:15%;"class="userimg" alt="userimg" /> <br /> 
        <h6 style="font-weight:bold;">아이디</h6> 
        <p style="color:#a3a3a3; font-size:15px">여기는 자기소개 하는 곳 입니다.</p>

        </div>
		<div>
		<span>총 거래 (10회)</span>&nbsp;&nbsp;&nbsp;
		<span style="color:red;">신고(2회)</span>
		
		</div>
		<div line-height="1.5em">
		<span>판매중인 상품 : </span>&nbsp;<span><a href="#">목록보기</a></span> <br />
		<span>최근 리뷰  :</span>&nbsp;&nbsp;<span><a href="#">목록보기</a></span>
		</div>

		
        </div>
        <br />

              <div class="modal-footer" style="align:center;">
        <button type="button" class="btn btn-success">쪽지</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
        

</form>
</div>
</div>
</div>
