<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head> 
<style>
 
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
<c:import url="../common/header.jsp"/>
	 <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange">
                  <h4 class="card-title ">${report.RTitle}</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                   <div class="single-post-details-area">
						<div class="content">
							<h4 class="post-title"></h4>
							<br />
							<div class="post-meta mb-30">
								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>${report.RDate}</a>  &nbsp;&nbsp;
								<a href="#"><i class="fa fa-user" aria-hidden="true"></i>${report.RWriter}</a> <br><br>
								<a href="#"><i class="fa " aria-hidden="true"></i>${report.rcContent}</a><br><br>
								<a href="#"><i class="fa fa-user" aria-hidden="true">신고 접수 아이디: </i>${report.reported}</a>
							</div>
							<div class="post-meta mb-30">
							</div>
							<div></div>
							
							<br/>
							<div style="font-size : 30px;">${report.RContent}</div>
							<br /> <br /> <br />
							<blockquote>
								<div class="blockquote-text">
										<h5>“신고된 게시물/댓글은 담당자 확인 후 기준에 맞게 조치하고 있습니다.
									           &nbsp;바니마켓은 건강하고 안전한 인터넷 환경 마련을
										위해 최선의 노력을 하고 있습니다. ”</h5>
									<h5>YOUNG BUNNY</h5>
								</div>
							</blockquote>

						</div>
					</div>
                  </div>
                </div>
              </div>
       
  
	
	 <button class="btn paging" style="float: left;"  onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeList.do'">리스트로</button>
		    &nbsp; &nbsp; &nbsp;


<c:import url="../common/footer.jsp"/>
