<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String msg = (String)request.getAttribute("error-msg");
	Exception e = (Exception)request.getAttribute("exception");
%>

<%@ include file="../common/header.jsp" %>
	<div class="outer">
		<h1>서비스 에러 발생!!!</h1>
		<h3 style="color:hotpink;">ERROR : <%= e.getMessage() %></h3>
		<h4><span>서</span>비스 수행 중 에러가 발생했습니다. 전송 값을 확인해 보시고,<br>
		이상이 없을 시 부서 담당자에게 연락하시기 바랍니다.</h4>
	</div>
<%@ include file="../common/footer.jsp" %>