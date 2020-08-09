<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(${ pageContext.request.contextPath }/resources/img/bg-img/test3.jpg);">
		<h2>신고글 수정</h2>
	</div>
<c:set value="${report }" var="r"/>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
						<a href="${ pageContext.request.contextPath }/"><i class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Report</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">
			<form id="formArea" method="post" action="${ pageContext.request.contextPath }/report/reportUpdate.do">
				<div class="row justify-content-between">
					<div class="col-12 col-md-2" style="text-align: center; padding-top: 7px;">
						<div class="single_product_desc">
							<!-- <h4 class="title">상품 제목</h4> -->
							<label for="p">신고글 제목 *</label>
							<br />
						</div>
					</div>
					<div class="col-12 col-md-10" style="text-align: center;">
						<div class="single_product_desc">
							 <input type="hidden" name="rNo" value="${r.RNo }"/>
							<input type="text" class="form-control" name="rTitle" value="${r.RTitle }"placeholder="신고글 제목을 입력" required />
							<br />
						</div>
					</div>
					<div class="col-12 col-md-2" style="text-align: center; padding-top: 7px;">
						<div class="single_product_desc">
							<label for="rcNo" >신고 카테고리 *</label>
							<br />
						</div>
					</div>
					<div class="col-12 col-md-10" style="text-align: center;">
					<input type="hidden" id="selectForm" value="${r.rcNo }">
						<div class="single_product_desc">
							<select class="custom-select widget-title" name="rcNo" id="rcNo" style="width: 100%" >
                                  <option value="hidden">신고 사유를 선택해주세요.</option>
                                  <option value="1">욕설 혹은 비방</option>
                                  <option value="2">홍보성 글 작성</option>
                                  <option value="3">사기 - 물품이 없는경우(허위매물)</option>
                                  <option value="4">기타</option>
                                </select>
							<br />
							<br />
						</div>
					</div>
					
					<div class="col-12 col-md-2" style="text-align: center; padding-top: 7px;">
						<div class="single_product_desc">
						
							<label for="p" style="padding-left: 15px;">신고할 아이디 *</label>
							<br />
						</div>
					</div>
					<div class="col-12 col-md-10">
						<div class="single_product_desc">
							<input type="text" class="form-control" name="reported" value="${r.reported }" placeholder="아이디 입력" readonly/>
							<br />
						</div>
					</div>
					<c:if test="${r.pno ne 0 }">
					<div class="col-12 col-md-2" style="text-align: center; padding-top: 7px;">
						<div class="single_product_desc">
							<label for="p" style="padding-left: 15px;">신고할 상품의 번호 *</label>
							<br />
						</div>
					</div>
					<div class="col-12 col-md-10">
						<div class="single_product_desc">
							<input type="text" class="form-control" name="pno" value="${ r.pno }" placeholder="신고글 번호 입력"  readonly />
							<br />
						</div>
					</div>
					</c:if>
					<!-- 썸머노트 -->
					<div class = "col-12 col-md-12">
						<br />
						<textarea class="summernote" name="rContent" placeholder = "내용 입력">${r.RContent }</textarea>
					</div>
				</div>
				<div align="center">
					<input type="button" class="btn alazea-btn mt-15"  value="취소하기"
							onclick="location.href='${ pageContext.request.contextPath }/report/reportDetail.do?rno=${r.RNo }'"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn alazea-btn mt-15">수정완료</button>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
	//여기 아래 부분
	//여기 아래 부분
	var check = $('.summernote').summernote({
		  height : 600 // 에디터 높이
		, minHeight : null // 최소 높이
		, maxHeight : null // 최대 높이
		, focus : true  // 에디터 로딩후 포커스를 맞출지 여부
		, lang : "ko-KR" // 한글 설정
		, placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		, toolbar: [
            // [groupName, [list of button]]
            ['style', ['style']],
            ['font', ['strikethrough', 'bold', 'underline', 'clear']],
            ['Font Style', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['height', ['height']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
            ], callbacks : {
   	         onImageUpload : function(files, editor,
   	               welEditorble) {
   	            data = new FormData();
   	            data.append("file", files[0]);
   	            
   	            $.ajax({
   	               data : data,
   	               type : "post",
   	               url : '${pageContext.request.contextPath}/QNA/QNAImgInsert.do', // servlet url
   	               cache : false,
   	               contentType : false,
   	               processData : false,
   	               success : function(fileUrl) {
   	                  check.summernote('insertImage', fileUrl);
   	                  alert("이미지 등록 성공!");
   	               },
   	               error : function(request, status, error) {
   	                  alert("code:" + request.status + "\n"
   	                        + "message:"
   	                        + request.responseText + "\n"
   	                        + "error:" + error);
   	               }
   	            });
   	         }
   	      }
   	   });

	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$(".summernote")[0]);
        }
       e.preventDefault();
	});
	
	

   	$(function(){
   		var rcno = $("#selectForm").val();
   		$("#rcNo option:eq("+rcno+")").attr("selected", "selected");

   	});
	
</script>
<c:import url="../common/footer.jsp" />
</body>
</html>
