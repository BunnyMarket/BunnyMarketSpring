<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../../resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../resources/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../../resources/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../../resources/demo/demo.css" rel="stylesheet" />
  <style>
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
  	.btnw{
  	box-shadow: 3px 4px 0px 0px #8a2a21;
	background:linear-gradient(to bottom, #c62d1f 5%, #f24437 100%);
	background-color:#c62d1f;
	border-radius:18px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:7px 25px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
  	}
  	table{
  	text-align : center;}
  	
  	/*
  	/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
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
	<%@ include  file="common/header.jsp"  %>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="background : orange;">
                  <h4 class="card-title ">회원 리스트 </h4>
                  <p class="card-category"> </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive" >
                    <table class="table" >
                      <thead class=" text-primary">
                      	<tr>
                      		
	                        <th>아이디</th>
	                        <th>이름</th>
	                        <th>닉네임 </th>
	                        <th>포인트 </th>
	                        <th>경고 횟수 </th>
	                        <th>제재중</th>
                      	</tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${list}" var="c" varStatus="st">
                        <tr id="${c.userId}" >
                        <%-- <td  id="${st.count}" style="display:none;">${st.count}</td>  --%>
                          <td>${c.userId}</td>
                          <td>${c.userName}</td>
                          <td>${c.nickName}</td>
                          <td>${c.nowPoint}</td>
              			  <c:choose>
              			  	<c:when test="${c.count ge 10 }">
                      	   <td style="color:red;">${c.count}</td>  
              			  	</c:when>
              			  	<c:otherwise>
              			  	   <td >${c.count}</td> 
              			  	</c:otherwise>
                      	  </c:choose>
                          <td>
							 <c:if test="${c.mStatus eq 1}">
							<div _ngcontent-dqh-c114="" class="togglebutton">
								<label _ngcontent-dqh-c114="">
									<input _ngcontent-dqh-c114="" type="checkbox" >
									<span _ngcontent-dqh-c114="" class="toggle" id="toggle-${st.index}" ></span>
								 </label>
							</div>
							</c:if>
							 <c:if test="${c.mStatus ne 1}">
							<div _ngcontent-dqh-c114="" class="togglebutton">
								<label _ngcontent-dqh-c114="">
									<input _ngcontent-dqh-c114="" type="checkbox" checked="checked" >
									<span _ngcontent-dqh-c114="" class="toggle" id="toggle-${st.index}" ></span>
								 </label>
							</div>
							</c:if> 
							
                          </td>
                        </tr>
                 	<script>
                    $(function(){
                    	
                   		$('#toggle-${st.index}').on('click',function(){
                   			var id = $(this).closest('tr').children().eq(0).text();  
                   				console.log(id);
                   				console.log('#toggle-${st.index}');
                   			var ts = $(this).closest('label').children(0).is(":checked")==true;
                   				console.log(ts);
                   			if(ts==true){ // 비활성화 시킬때
                   				$.ajax({
                 	   				type : 'POST',
                 	   				url : '${pageContext.request.contextPath}/admin/member/memberCountDown.do',
                 	   				data : {"userId" : id},
                 					dataType : "json",
                 					success: function(data){
                 						if(data.Save == true){
                 							alert("부활성공");
                 							$(this).closest('label').children(0).addAttr('checked');
                 						} else {
                 							console.log(data);
                 						}
                 					},
                 					fail : function(data){
                 						alert("부활실패");
                 						console.log(data);
                 					}
                 				});
                   			}else{ // 활성화시킬때 
                   				$.ajax({
                 	   				type : 'POST',
                 	   				url : '${pageContext.request.contextPath}/admin/member/memberCountUp.do',
                 	   				data : {"userId" : id},
                 					dataType : "json",
                 					success: function(data){
                 						if(data.kill == true){
                 							alert("킬성공");
                 							$(this).closest('label').children(0).removeAttr('checked');
                 						} else {
                 							console.log(data);
                 						}
                 					},
                 					fail : function(data){
                 						alert("킬실패");
                 						console.log(data);
                 					}
                 				});
         	   				}
                   		});  //onclick
                   	 }); 
                 	</script>
                       </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
<div class="pageAdmin">
      <c:out value="${pageBar}" escapeXml="false"/>
     </div>
              </div>
            </div>
            </div>
            </div>
            </div>
	<br/>

<br/>
<br/>
<br/>
<div class="searchArea">
	<select id="searchCondition" name="searchCondition" >
		<option value="userId">아이디</option>
		<option value="userName">이름</option>
		<option value="userNickName">닉네임</option>
	</select>&nbsp;&nbsp;
	<input type="search" id="keyword"
	 onkeypress="if(event.keyCode==13) {search();}"> &nbsp;
	<button class=" btn paging" onclick="search();">검색</button>
</div>
<br>
<br>

    <%@ include file="common/footer.jsp" %>


