<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 템플릿</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">

</head>
<body>
	<nav>
		<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	</nav>
	<article>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</article>
</body>
</html>