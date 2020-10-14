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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<!-- js -->
<script src="/aniwalk/static/js/main.js"></script>

<style>
	.absolute-position{
		position: absolute;
		bottom: 0;
		left: 0;
	}
</style>
<body>
	<nav>
		<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	</nav>
	<article>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</article>
	<footer class="absolute-position"> Copyright@ PandoraBox Web / App Project </footer>
	
</body>
</html>