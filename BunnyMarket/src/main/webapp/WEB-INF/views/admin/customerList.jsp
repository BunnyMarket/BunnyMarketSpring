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
  	
  	*/
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
	                        <th>제재</th>
                      	</tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${user}" var="c" varStatus="st">
                        <tr id="${c.userId}">
                        <td style="display:none;" id="${st.count}"></td>
                          <td>${c.userId}</td>
                          <td>${c.userName}</td>
                          <td>${c.nickName}</td>
                          <td>${c.nowPoint}</td>
                          <td>${c.count}</td>
                          <td><%-- <button class="btnw" id="btnw-${st.index}">제재</button> --%>
                         <%--  <label class="switch">
							  <input type="checkbox" class="checkbox" id="${st.count}">
							  <span class="slider round"></span>
							</label> --%>
							<div _ngcontent-dqh-c114="" class="togglebutton">
								<label _ngcontent-dqh-c114="">
									<input _ngcontent-dqh-c114="" type="checkbox" checked="">
									<span _ngcontent-dqh-c114="" class="toggle" ></span>
								 </label>
							</div>
                          </td>
                        </tr>
                        
                       </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
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
		<option value="id">회원아이디</option>
		<option value="report">경고수</option>
	</select>&nbsp;&nbsp;
	<input type="search" id="keyword"> &nbsp;
	<button class="paging" >검색</button>

</div>
<br>
<br>
<script>
       /*  $(function(){
        	for(var i = 0; i < ${user.size()}; i++){
        		
   		 $('#btnw-'+i).on('click',function(){
   			var id = $(this).parent().parent().attr('id');
   			console.log(id);
   			$.ajax({
   				type : 'POST',
   				url : '${pageContext.request.contextPath}/admin/member/memberCountUp.do',
   				data : {"userId" : id},
				dataType : "json",
				success: function(data){
					if(data.kill == true){
						console.log(data);
						alert('btnw-'+i);
						//$('#btnw-'+i).css({'background-color':'black'});
						$('#btnw-'+i).style.background-color = "black";
					} else {
						console.log(data);
					}
				},
				fail : function(data){
					alert("실패");
					console.log(data);
				}
			});
   		 });
        	}
   	 }); */
   	 
  /*  	 $(function(){
   		 console.log("ckbox-${st.index}");
   		 $("#ckbox").change(function(){
   			 
   		if( $("#ckbox").is("checked")){
   		 alert("checked");
   	 } else{
   		 alert("unchecked");
   	 }
   		 });
   	 }); */
   

    $(function (){
	   $('input:checkbox').on('click',function(){
  			var id = $(this).parent().parent().parent().parent().attr('id');
  			console.log(id);
	   });
   }); 
</script>
    <%@ include file="common/footer.jsp" %>


