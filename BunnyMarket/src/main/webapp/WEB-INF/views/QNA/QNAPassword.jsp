<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>Q&A 글 상세보기</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Q&A</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Blog Content Area Start ##### -->
<section class="blog-content-area section-padding-0-100">
	<div class="container">
		<div class="row justify-content-center">
			<!-- Blog Posts Area -->
			<div class="col-12 col-md-8">
				<div class="blog-posts-area">
                <h1>비밀번호 입력</h1>
					
					        <!-- Start Content -->
        <div id="content">
            <div class="container">
                <div class="blog-post-page">
                    <div class="blog-box">
							<div style="height:70px;"></div> <br /><br /><br /><br /><br />
                        <!-- Start Respond Form -->
                        <div style="border: solid 1px #D0D4D7; margin: auto; width:500px; height: 200px; padding-top:20px;">
                        <div id="respond" style="margin-left: 90px; margin-bottom: 20px;">
                            <form  id="formArea" action="${pageContext.request.contextPath}/QNA/QNAPassword.do" method="post" style="width:600px; margin-right:300px;">
                            <h2 class="respond-title"><b>비밀번호 입력</b></h2>
                                <div class="row">
                                    <div class="col-md-8">
                                    <input id="qNo" name="qNo" type="hidden" size="30" aria-required="true" value="${QNA.qNo} "/>
                                    <input id="qWriter" name="qWriter" type="hidden" size="30" aria-required="true" value="${QNA.qWriter} "/>
                                        <label for="password">비밀번호 : <span class="required">*</span></label>
                                        <input id="userPwd" name="userPwd" type="password" size="30" aria-required="true"/>
                                    </div>
                                   
                                </div>
                                <div class="row">
                                    <div class="col-md-12" style="padding-left:175px;">
                                        <button type="button" class="btn alazea-btn mt-15" 
						                       	onclick="goView();">입력</button>
                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                        </div>
                        <!-- End Respond Form -->
                       </div>
                    </div>
                </div>
                
                <div style="height: 260px;"></div>
                
            </div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
function goView(){
	$("#formArea").attr("action", "${ pageContext.request.contextPath }/QNA/QNADetail.do").submit();
	
}
</script>


<!--  여기까지 -->
<c:import url="../common/footer.jsp" />
