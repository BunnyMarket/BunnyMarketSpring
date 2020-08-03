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
  
  </style>
</head>
	<%@ include  file="common/header.jsp"  %>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">거래 현황 확인</h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                    <table class="table" >
                      <thead class=" text-primary">
                        <th>판매자 회원명 </th>
                        <th>상품페이지 제목</th>
                        <th>낙찰(판매)된 가격</th>
                        <th>날짜</th>
                        <th>택배 / 직거래 </th>
                        <th>거래 성사 상태 </th>
                        <th>point</th>
                      </thead>
                      <tbody> 
                      <c:forEach items="${deal}" var="d" varStatus="st">
                        <tr id="${d.dno}" >
                          <td>${d.dsId}</td>
                          <td>${d.PTitle}</td>
                          <td>${d.PPrice}</td>
                          <td>${d.DDate}</td>
	                     <td>
	                     <input type="hidden" id="dmethod-${st.index}" value="${d.DMethod}" />
	                       <input type="radio" name="${d.DMethod}" id="stop-${st.index}" value="${d.DMethod}" disabled> 거래중지 <br/>
	                       <input type="radio" name="${d.DMethod}" id="dt-${st.index}"value="${d.DMethod}"disabled > 직거래
	                       <input type="radio" name="${d.DMethod}" id="par-${st.index}" value="${d.DMethod}" disabled > 택배 <br/>
	                       <input type="radio" name="${d.DMethod}" id="nd-${st.index}" value="${d.DMethod}" disabled > 미결정
	                      
	                      </td>
                          <td>
                          <input type="hidden" id="dsStatus-${st.index}" value="${d.dsStatus}" />
                          <input type="hidden" id="dbStatus-${st.index}" value="${d.dbStatus}" />
                          <input type="checkbox" id="seller-${st.index}" disabled> 판매자 (${d.dsId}) <br/>
                          <input type="checkbox" id="buyer-${st.index}"disabled> 구매자  (${d.dbId})<br/>
                          </td>
                          <td>
                          <c:if test="${d.DMethod eq 0}">
                          <button class="btn" id="btn-${st.index}">포인트</button>
                          </c:if>
                          </td>
                        </tr>
                         <script>
					    	$(function(){
					    		var seller = $('#dsStatus-${st.index}').val();
					    		var buyer = $('#dbStatus-${st.index}').val();
					    		if(seller == 1){
					    			$('#seller-${st.index}').attr('checked', 'checked');
					    		}
					    		if(buyer == 1){
					    			$('#buyer-${st.index}').attr('checked', 'checked');
					    		}
					    	});
					    	$(function(){
					    		var stop = $('#stop-${st.index}').val();
					    		var dt = $('#dt-${st.index}').val();
					    		var par = $('#par-${st.index}').val();
					    		var nd = $('#nd-${st.index}').val();
					    		if(stop == 0){
					    			$('#stop-${st.index}').attr('checked', 'checked');
					    		}
					    		if(dt == 1){
					    			$('#dt-${st.index}').attr('checked', 'checked');
					    		}
					    		if(par == 2){
					    			$('#par-${st.index}').attr('checked', 'checked');
					    		}
					    		if(nd == 3){
					    			$('#nd-${st.index}').attr('checked', 'checked');
					    		}
					    	});
					    	
					    	  $(function(){
			                   		$('#btn-${st.index}').on('click',function(){
			                   				$.ajax({
			                 	   				type : 'POST',
			                 	   				url : '${pageContext.request.contextPath}/admin/dealReturn.do',
			                 	   				data : {"dno" : '${d.dno}'},
			                 					dataType : "json",
			                 					success: function(data){
			                 						if(data.refund == true){
			                 							alert("포인트 돌려주기 성공");
			                 						
			                 						} else {
			                 							console.log(data);
			                 						}
			                 					},
			                 					fail : function(data){
			                 						alert("포인트 돌려주기 실패");
			                 						console.log(data);
			                 					}
			                 			}); 
			                   		});
					    	  });	
					    </script>
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
	<c:out value="${pageBar}"  escapeXml="false"/>
	</div>
</div>
<br/>
<br/>
<br/>
<div class="searchArea">
	<select id="searchCondition" name="searchCondition" >
		<option value="sellerName">판매자명</option>
		<option value="parcel">택배</option>
		<option value="direct">직거래</option>
		<option value="seller">판매자</option>
		<option value="buyer">구매자</option>
		<option value="complete">완료</option>
	</select>&nbsp;&nbsp;
	<input type="search" id="keyword"> &nbsp;
	<button class="paging" >검색</button>

</div>
<br>
<br>
   
    <%@ include file="common/footer.jsp" %>
    


