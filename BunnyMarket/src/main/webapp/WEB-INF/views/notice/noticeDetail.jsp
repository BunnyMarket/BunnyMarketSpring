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
  
  </style>
<c:import url="../admin/common/header.jsp"/>
	 <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange">
                  <h4 class="card-title ">공지 사항</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                   <%-- <table>
                   	<tr>
                   		<th>글번호</th>
                   		<td name="nno">${notice.nno}</td>
                   		<th>작성일</th>
                   		<td name="NDate">${notice.NDate}</td>
                   		<th>조회수</th>
                   		<td name="NCount">${notice.NTotal}</td>
                   	</tr>
                   	<tr>
                   	<tr><div></div></tr>
                   	<th>내용</th>
                   	<td name="NContent">${notice.NContent}</td>
                   	</tr>              
                   </table> --%>
                   <div class="single-post-details-area">
						<div class="post-content">
							<h4 class="post-title">${notice.NTitle }</h4>
							<br />
							<div class="post-meta mb-30">
								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>작성자  : ${notice.NDate}</a> 
								<a href="#"><i class="fa fa-user" aria-hidden="true"></i>조회수 : ${notice.NTotal}</a>
							</div>
							<div class="post-meta mb-30">
								<%-- <button type="button" class="btn mt-15"
										onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeUpdate.do?noticeNo=${notice.nno}'">수정하기</button> --%>
							</div>
							<div><p></p></div>
							<%-- <div class="post-thumbnail mb-30">
								<img src="${pageContext.request.contextPath}/resources/img/bg-img/35.jpg" alt="">
							</div> --%>
							<br/>
							<div style="font-size : 30px;">${notice.NContent}</div>
							<br /> <br /> <br />
							<blockquote>
								<div class="blockquote-text">
									<h5>“바로 당신의 니즈, 저희 바니마켓이 충족시켜드리겠습니다.”</h5>
									<h5>YOUNG BUNNY</h5>
								</div>
							</blockquote>

						</div>
					</div>
                  </div>
                </div>
              </div>
       
  
	
	 <button class="btn paging" style="float: right;"  onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeList.do'">리스트로</button>
		    &nbsp; &nbsp; &nbsp;
	<button class="btn paging" style="float: right;"  onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeUpdate.do?noticeNo=${notice.nno}'">수정하기</button> 


<c:import url="../admin/common/footer.jsp"/>
