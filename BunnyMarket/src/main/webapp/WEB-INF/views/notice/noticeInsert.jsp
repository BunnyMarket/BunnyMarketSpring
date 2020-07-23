<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
	<c:import url="../admin/common/header.jsp"/>

 <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange">
                  <h4 class="card-title ">공지 사항 입력</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                   	<form name ="noticeInsert" action="${ pageContext.request.contextPath }/admin/notice/noticeInsert.do" method="post">
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
							<input type="text" class="form-control" name="nTitle" placeholder="제목을 입력" required />
							<br />
						</div>
					</div>
					
					<!-- 썸머노트 -->
					<div class = "col-12 col-md-12">
						<br />
						<textarea class="summernote" name="nContent" placeholder ="내용 입력"></textarea>
					</div>
				</div>
				<div align="center">
					<button type="submit" class="btn alazea-btn mt-15">등록완료</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn alazea-btn mt-15"
						onclick="goback();">취소하기</button>
				</div>	
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
         </div>
      </div>
<script>
	//여기 아래 부분
	//여기 아래 부분
	$('.summernote').summernote({
		  height : 350 // 에디터 높이
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
	function goback(){
		location.href="${pageContext.request.contextPath}/admin/notice/noticeList.do";
	}
</script>
<c:import url="../admin/common/footer.jsp"/>
