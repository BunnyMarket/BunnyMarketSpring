<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
.btn {
	box-shadow: inset 0px 0px 0px 0px #97c4fe;
	background: linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	background-color: #3d94f6;
	border-radius: 9px;
	border: 1px solid #337fed;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #1570cd;
}

.btn:hover {
	background: linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	background-color: #1e62d0;
}

.btn:active {
	position: relative;
	top: 1px;
}

#btn {
	box-shadow: 3px 4px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color: #ededed;
	border-radius: 5px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #777777;
	font-family: Arial;
	font-size: 17px;
	font-weight: bold;
	padding: 12px 44px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

#btn:hover {
	background: linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color: #dfdfdf;
}

.pagingArea {
	width: 100%;
	text-align: center;
}

.paging {
	box-shadow: 3px 4px 0px 0px #dcecfb;
	background: linear-gradient(to bottom, #bddbfa 5%, #80b5ea 100%);
	background-color: #bddbfa;
	border-radius: 5px;
	border: 1px solid #84bbf3;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 17px;
	font-weight: bold;
	padding: 12px 11px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #528ecc;
}

.searchArea {
	width: 100%;
	text-align: center;
	border-radius: 5px;
}
</style>
<body>
	
<c:import url="../admin/common/header.jsp" />
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary"
						style="background: orange">
						<h4 class="card-title ">공지 사항</h4>
						<p class="card-category"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table" id="tableArea">
								<thead class=" text-primary">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="n">
									<tr id="${n.nno}">
										<td>${n.nno}</td>
										<td>${n.NTitle}</td>
										<td>${n.NDate}</td>
										<td>${n.NTotal}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<section class="shop-page section-padding-0-100">
    <div class="container">
        <div class="row">
            <!-- All Products Area -->
            <div class="col-12 col-md-8 col-lg-9">
                <div class="shop-products-area" style="margin-left: 250px;">
                    <div>
                     <c:out value="${pageBar}" escapeXml="false"/>
                    </div>
                 </div>
            </div>
        </div>
    </div>
</section>
<div class="searchArea">
	<select id="searchCondition" name="searchCondition">
		<option value="title">제목</option>
		<option value="content">내용</option>
	</select>&nbsp;&nbsp; <input type="search" id="keyword"> &nbsp;
	<button class=" btn paging" onclick="search();">검색</button>
	<button class="btn paging" onclick="noticeInsert();">글쓰기</button>
	<br>
	<br>
</div>


<script>
	// 입력
	function noticeInsert() {
		location.href = "${pageContext.request.contextPath}/admin/notice/noticeInsertForm.do";
	}
	// 메뉴 바 색
	$(function() {
		$("#tableArea td")
				.mouseenter(function() {
					$(this).parent().css({
						"background" : "#FAD7A0",
						"cursor" : "pointer"
					});
				})
				.mouseout(function() {
					$(this).parent().css({
						"background" : "white"
					});
				})
				.click(
						function() {
							var noticeNo = $(this).parent().attr("id");
							console.log("noticeNo=" + noticeNo);
							location.href = "${pageContext.request.contextPath}/admin/notice/noticeDetail.do?no="
									+ noticeNo;
						});
	});

	function search() {
		location.href = "${ pageContext.request.contextPath}/admin/notice/searchNotice.do?condition="
				+ $('#searchCondition').val()
				+ "&keyword="
				+ $('#keyword').val();
	}
</script>
</body>
<c:import url="../admin/common/footer.jsp" />