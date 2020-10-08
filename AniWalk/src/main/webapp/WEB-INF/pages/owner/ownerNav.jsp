<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<img src="${pageContext.request.contextPath}/images/main_logo.png" alt=""
			onclick="location.href='/aniwalk/owner/index.do'">
	<ul>
		<li>
			<img class="img-circle" src="${pageContext.request.contextPath}/images/profile_test.png" alt="" onclick="location.href='/aniwalk/owner/my.do'">
			<label onclick="location.href='/aniwalk/owner/my.do'"> ${mem_nickname} </label>
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
			<button class="btn btn-primary" type="button" >산책정보</button>
		</li>
	</ul>
</div>
</body>
</html>