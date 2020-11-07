<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오너메뉴</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>


<div class="ownerNav">
	<img src="/aniwalk/images/main_logo.png" alt=""
			onclick="location.href='/aniwalk/owner/index.do'">
	<ul>
		<li>
			<c:if test="${param.filename ne null}">
				<img class="img-circle" src="/owner/${param.filename}" alt=""
					 onclick="location.href='/aniwalk/owner/my.do'"
					 onerror="this.src='/aniwalk/images/profile_test.png'">
				<label onclick="location.href='/aniwalk/owner/my.do'"> ${mem_nickname}</label>
			</c:if>
			<c:if test="${param.filename eq null}">
				<img class="img-circle" src="/owner/${filename}" alt=""
					 onclick="location.href='/aniwalk/owner/my.do'"
					 onerror="this.src='/aniwalk/images/profile_test.png'">
				<label onclick="location.href='/aniwalk/owner/my.do'"> ${mem_nickname}</label>
			</c:if>
			
		</li>
		<li>
			<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/owner/recruitList.do'">산책모집</button>
		</li>
		<li>
			<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/owner/walker.do'">펫프렌즈 리스트</button>
		</li>
		<li>
			<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/owner/talk.do'">대화리스트</button>
		</li>
		<li>
			<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/owner/activityList.do'" >산책정보</button>
		</li>
	</ul>
</div>
</body>
</html>