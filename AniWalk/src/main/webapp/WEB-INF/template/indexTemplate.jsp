<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기페이지</title>
</head>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- js -->

<body>
	<nav>
		<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	</nav>
	<article>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</article>
	<footer> Copyright@ PandoraBox Web / App Project </footer>
</body>
</html>