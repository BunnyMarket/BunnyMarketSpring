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
  background: #fc913a;
  background-image: -webkit-linear-gradient(top, #fc913a, #f06b05);
  background-image: -moz-linear-gradient(top, #fc913a, #f06b05);
  background-image: -ms-linear-gradient(top, #fc913a, #f06b05);
  background-image: -o-linear-gradient(top, #fc913a, #f06b05);
  background-image: linear-gradient(to bottom, #fc913a, #f06b05);
  -webkit-border-radius: 10;
  -moz-border-radius: 10;
  border-radius: 10px;
  font-family: Arial;
  color: #ffffff;
  font-size: 14px;
  padding: 7px 20px 7px 20px;
  border: solid #ff9645 2px;
  text-decoration: none;
}

.btn:hover {
  background: #ff6f00;
  background-image: -webkit-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -moz-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -ms-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: -o-linear-gradient(top, #ff6f00, #ff6f00);
  background-image: linear-gradient(to bottom, #ff6f00, #ff6f00);
  text-decoration: none;
}
	.btn:active {
	position:relative;
	top:1px;}
	
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
 
	<c:import url="../admin/common/header.jsp"/>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange">
                  <h4 class="card-title ">QnA</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                    <table class="table" id="tableArea" >
                      <thead class=" text-primary">
                        <th>번호 </th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>답변여부</th>
                      </thead>
                     <c:forEach items="${list}" var ="q">
                     	<tr id="${q.qno}" >
	                     	<td>${q.qno}</td>
							<td>${q.QTitle}</td>
							<td>${q.QWriter}</td>
							<td>${q.QDate}</td>
							<c:if test="${q.ck eq 'Y'}">
								<td style="color: black;" align="center">확인완료</td>
							</c:if>
							<c:if test="${q.ck eq 'N'}">
								<td style="color: red;" align="center">확인필요</td>
							</c:if>
							
						</tr>
                     </c:forEach>
                    </table>
                  </div>
<div class="pageAdmin">
	<div>
		 <c:out value="${pageBar}" escapeXml="false"/>
	</div>
</div>
                </div>
              </div>
            </div>
          </div>
         </div>
      </div>
	<br/>
<br/>
<br/>
<div class="searchArea">
	<select id="searchCondition" name="searchCondition" >
		<option value="title">제목</option>
		<option value="writer">작성자</option>
		<option value="content">내용</option>
		<option value="check">확인 여부</option>
	</select>&nbsp;&nbsp;
	<input type="search" id="keyword"
	 onkeypress="if(event.keyCode==13) {search();}"> &nbsp;
	<button class=" btn paging" onclick="search();">검색</button>
</div>
	
<br>
<br>
 <script>

  	// 메뉴 바 색
  	 	$(function(){
  		$("#tableArea td").mouseenter(function(){
  			$(this).parent().css({"background":"#FAD7A0","cursor":"pointer"});
  		}).mouseout(function(){
  			$(this).parent().css({"background" : "white"});
  		}).click(function(){
  			var QnANo = $(this).parent().attr("id");
  			console.log("QnANo="+QnANo);
  			location.href="${pageContext.request.contextPath}/QNA/QNASelectOneAdmin.do?qno=" + QnANo;
  		});
  	}); 
  	
  	function search(){
  		location.href="${ pageContext.request.contextPath}/admin/QnA/searchQnA.do?condition="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
  	}
  	
  </script>
<c:import url="../admin/common/footer.jsp"/>



