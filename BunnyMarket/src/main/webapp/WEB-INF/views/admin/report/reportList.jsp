<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../../resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../resources/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../../resources/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../../resources/demo/demo.css" rel="stylesheet" />
  <style>
  .btn {
	box-shadow:inset 0px 0px 0px 0px #97c4fe;
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	background-color:#3d94f6;
	border-radius:9px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;}
	
	.btn:hover {
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	background-color:#1e62d0;}
	
	.btn:active {
	position:relative;
	top:1px;}
	
	#btn {
	box-shadow: 3px 4px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color:#ededed;
	border-radius:5px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:12px 44px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;}
	
   #btn:hover {
	background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color:#dfdfdf;}

	.pagingArea{
	width: 100%;
 	text-align: center;}
	
	.paging {
	box-shadow: 3px 4px 0px 0px #dcecfb;
	background:linear-gradient(to bottom, #bddbfa 5%, #80b5ea 100%);
	background-color:#bddbfa;
	border-radius:5px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:bold;
	padding:12px 11px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
	}
	.searchArea{
	 width: 100%;
	 text-align: center;
	 border-radius:5px;
	 }
	  table{
	 text-align : center; 
	 }
  	
  th{
		color : black;
		font-weight :700;
	}
  </style>
</head>
	<%@ include  file="../common/header.jsp"  %>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange">
                  <h4 class="card-title ">신고 현황</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                    <table class="table" id="tableArea">
                      <thead class=" text-primary">
                        <tr>

								<th style="width: 5%; color : black;">번호</th>
								<th colspan="2" style="width: 40%; text-align: center; color : black;">제목</th>
								<th style="padding-right: 80px; width: 15%; text-align: center; color : black;">작성자</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;color : black;">등록일자</th>
								<th style="padding-left: 8px; width: 10%; text-align: center;color : black;">첨부파일</th>
								<th style="padding-left: 8px; width: 15%; text-align: center;color : black;">유형</th>
								<!-- https://stackoverflow.com/questions/12128425/contain-form-within-a-bootstrap-popover -->
								
								<th></th>
							</tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${list }" var="r" >
						
						<input type="hidden" value="${r.RNo}" />
					        <tr id="${r.RNo}">
					        
							<td>${r.RNo }</td>
							<td colspan="2" style="padding-left: 150px;"> ${r.RTitle}</td>
							<td>${r.RWriter }</td>
							<td style="padding-left: 45px;">${r.RDate }</td>
							
							<c:if test="${fn:contains(r.RContent, '<img') == 'true' }">
							 <td style="color:green;" align="center">첨부</td>
							</c:if>
							<c:if test="${fn:contains(r.RContent, '<img') == 'false' }">
							<td style="color: red;" align="center">없음</td>
							</c:if>
							
							<c:if test="${r.PType eq 1 }">
							<td style="color:black;" align= "center">상품</td>
							</c:if>
							 <c:if test="${r.PType eq 2  }"> 
							 <td style="color:blue;" align= "center">경매</td>
							 </c:if>
							 <c:if test="${r.pno eq 0}">
							 <td style="color:gray;" align= "center">일반</td>
							 </c:if>
							 <td></td>
							</tr>
							</c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
	<br/>
<div class="pagingArea" >
	<div class="pa">
     <div>
      	<c:out value="${pageBar}" escapeXml="false"/>
     </div>
	</div>
</div>
<br/>
<br/>
<br/>
<div class="searchArea">
	<select id="searchCondition" name="searchCondition" >
		<option value="sellerName">판매자명</option>
		<option value="buyerName">구매자명</option>
		<option value="title">제목</option>
	</select>&nbsp;&nbsp;
	<input type="search" id="keyword"> &nbsp;
	<button class="paging" >검색</button>

</div>
<br>
<br>
<script>
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
						var rNo = $(this).parent().attr("id");
						console.log("rNo=" + rNo);
						location.href = "${pageContext.request.contextPath}/admin/report/reportSelectOneAdmin.do?rno=" + rNo;
					});
});

	
</script>
    <%@ include file="../common/footer.jsp" %>


