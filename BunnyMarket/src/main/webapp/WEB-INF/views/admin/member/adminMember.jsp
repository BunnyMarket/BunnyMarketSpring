<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	text-align:center;
}	

.group { 
  position:relative; 
  margin-bottom:45px; 

}
.group input {
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}
.group input:focus { outline:none; }


.label-m {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ .label-m, input:valid ~ .label-m{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

.modal-content{
	text-align: center;
}
 .page-item disabled{
 	color : blue;
 }  	
  </style>

</head>
	<%@ include  file="../common/header.jsp"  %>

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
                      	<th>아이디</th>
                      	<th>사용가능 여부</th>
					  </thead>
					  <tbody>
					  <c:forEach items="${list}" var="a" varStatus="st">
					   <tr id="${a.adminId}">
					  	<td>${a.adminId}</td>
					  	<td>
					  		 <c:if test="${a.AStatus eq 1}">
								<div _ngcontent-dqh-c114="" class="togglebutton">
								 <label _ngcontent-dqh-c114="">
									<input _ngcontent-dqh-c114="" type="checkbox" >
									<span _ngcontent-dqh-c114="" class="toggle" id="toggle-${st.index}" ></span>
								 </label>
								</div>
							</c:if>
							<c:if test="${a.AStatus ne 1}">
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
                 	   				url : '${pageContext.request.contextPath}/admin/adminMember/adminStatusOff.do',
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
                 	   				url : '${pageContext.request.contextPath}/admin/adminMember/adminStatusOn.do',
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
					  <br/>
					  <button class="btn paging" style="float: right;" onclick="Insert();">등록</button>
<div class="pagingArea" >
	<div class="pa">
	<c:out value="${pageBar}"  escapeXml="false"/>
	</div>
</div>
<br/>

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">관리자 등록</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<form action="${pageContext.request.contextPath}/admin/adminMember/adminInsert.do" method="post">

				<div class="modal-body row" style="margin:auto" >

					<div class="group" >      
				      <input type="text" name="adminId" required>
				      <span class="highlight"></span>
				      <span class="bar"></span>
				      <label class="label-m">ID</label>
				    </div>
				      
				    <div class="group">      
				      <input type="password" name="adminPw" required>
				      <span class="highlight"></span>
				      <span class="bar"></span>
				      <label class="label-m">Password</label>
				    </div>
					
			
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn alazea-btn mt-15" style="float: right">등록</button>
					<button type="button" class="btn alazea-btn mt-15" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	function Insert(){
		$('#myModal1').modal();
	}
	
	function goBack(){
		window.history.go();
	}
	$(function(){
		$(".modal-layout").click(function(){
			$('.modal').modal('hide');
		});
	});

</script>
<br/>
<br/>
<br>
<br>
	<%@ include file="../common/footer.jsp" %>