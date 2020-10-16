<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<a href="/aniwalk/manager/index.do"><li>로그인</li></a>
		<a href="/aniwalk/manager/logout.do"><li>로그아웃</li></a>
		<li>000 관리자</li>
	</ul>
</div>

</body>
</html>