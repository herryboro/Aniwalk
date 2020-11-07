<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인메뉴</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manager.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
<div class="top">
	<a href="/aniwalk/index.do"><img src="${pageContext.request.contextPath}/images/main_logo.png" alt=""></a>

	<ul class="nav-ul">
	<c:if test="${result eq 0 || result eq -1 || result eq null}">
		<a href="/aniwalk/manager/index.do"><li>로그인</li></a>
	</c:if>
	<c:if test="${result eq 2}">
		<a href="/aniwalk/manager/logout.do"><li>로그아웃</li></a>
	</c:if>
		
	</ul>
</div>

</body>
</html>