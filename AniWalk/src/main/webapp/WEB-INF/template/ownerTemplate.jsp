<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려견주인</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>

	<div class="user-nav right-move">
		<span class="close">&times;</span>
		<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	</div>
	<div class="content-part">
		<span class="glyphicon glyphicon-align-justify hidden menu-bar"></span>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
</body>

<script>
	const userNav = document.querySelector('.user-nav');
	const closeBtn = document.querySelector('.close');
	const menuBar = document.querySelector('.menu-bar');
	const contentPart = document.querySelector('.content-part');

	closeBtn.addEventListener('click',function(){
		userNav.classList.remove('right-move');
		userNav.classList.add('left-move');
		setTimeout(function(){
			userNav.classList.add('hidden');
			menuBar.classList.remove('hidden');
		},1000);
	});

	menuBar.addEventListener('click',function (){
		userNav.classList.remove('hidden');

		userNav.classList.remove('left-move');
		userNav.classList.add('right-move');

		menuBar.classList.add('hidden');
	});
</script>
</html>