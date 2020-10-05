<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인메뉴</title>
</head>
<body>
<div class="main-nav">
	<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">

	<ul class="nav-ul">
		<li><a href="/aniwalk/index.do">Home</a></li>
		<li>사용방법</li>
		<li>사용후기</li>
		<li><a href="/aniwalk/walker/index.do">프렌즈 Login</a></li>
		<li><a href="/aniwalk/walkerApply.do">프렌즈 신청</a></li>
	</ul>
</div>

</body>
</html>