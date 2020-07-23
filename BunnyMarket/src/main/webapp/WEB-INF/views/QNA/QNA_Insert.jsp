<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../common/header.jsp" />
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>Q&A 등록</h2>
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
<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area mb-50">
	<div class="produts-details--content mb-50">
		<div class="container">
			<form id="formArea"   method="post">
				<div class="row justify-content-between">
					<div class="col-12 col-md-2">
						<div class="single_product_desc" style="text-align: center; padding-top: 7px;">
							<!-- <h4 class="title">상품 제목</h4> -->
							<label for="p">제목 *</label>
							<br />
						</div>
					</div>
					<div class="col-12 col-md-10">
						<div class="single_product_desc">
							<!-- <h4 class="title">상품 제목</h4> -->
							<input type="hidden" name="qWriter" value="TEST1">
							<input type="text" class="form-control" id="qTitle"  name="qTitle" placeholder="게시글 제목을 입력" required />
							<br />
						</div>
					</div>
					
					<!-- 썸머노트 -->
					<div class = "col-12 col-md-12">
						<br />
						<textarea class="summernote" name="qContent" placeholder = "내용 입력"></textarea>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn alazea-btn mt-15" 
							onclick="goInsert();">등록완료</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn alazea-btn mt-15" 
							onclick="goList();">취소하기</button>
				</div>
			</form>
		</div>
	</div>
</section>

<script>
	//여기 아래 부분
	//여기 아래 부분
	$('.summernote').summernote({
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
         ]
		
	});
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$(".summernote")[0]);
        }
       e.preventDefault();
	});
	
	function goInsert(){
		$("#formArea").attr("action", "${ pageContext.request.contextPath }/QNA/QNAInsert.do").submit();
		/* location.href="${ pageContext.request.contextPath }/QNA/QNAInsert.do"; */
	}
	
	function goList(){
		$("#formArea").attr("action", "${ pageContext.request.contextPath}/QNA/QNAList.do").submit();
		
	}
</script>
<c:import url="../common/footer.jsp" />
