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
<body>
<c:if test="${result eq 2}">
	<div class="dash-nav">
		<ul>
			<li><a href="/aniwalk/manager/user.do">유저관리</a></li>
			<li><a href="/aniwalk/manager/walker.do">워커관리</a></li>
			<li><a href="/aniwalk/manager/manageMatching.do">예약관리</a></li>
			<li><a href="/aniwalk/manager/managePoint.do">포인트관리</a></li>
		</ul>
	</div>
</c:if>
<script>
	const clickItem = document.getElementsByTagName('li');

	const bgWhite = function(){
		for(let i=0; i<clickItem.length; i++){
			clickItem[i].style.background = '#fafafa';
			clickItem[i].style.color = '#212121';
		}

	}

	for(let i=0; i<clickItem.length; i++){
		clickItem[i].addEventListener('click',function(){
			bgWhite();
			this.style.background = '#3c3cfd';
			this.style.color = '#fafafa'
		});
	}
</script>
</body>
</html>