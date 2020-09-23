<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인메뉴</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
<div class="main-nav">
	<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">

	<ul class="nav-ul">
		<li><a href="/aniwalk/index.do">Home</a></li>
		<li>사용방법</li>
		<li>사용후기</li>
		<li>Login</li>
		<li><a href="/aniwalk/walkerApply.do">Walker신청</a></li>
	</ul>
</div>

</body>
</html>