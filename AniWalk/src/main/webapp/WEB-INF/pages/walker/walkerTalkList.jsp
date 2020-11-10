<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>톡리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="talk-list">
	<!-- 검색 -->
	<div class="search-part">
		<form name="walkerListSearchForm">
			<label>
				<input class="form-control" type="search" placeholder="이름 검색">
			</label>
			<button class="btn btn-primary" type="submit">검색</button>
		</form>
	</div>

	<div class="list-part">

		<c:forEach var="chatList" items="${chatLists}">
			<div class="talk-item">
				<ul>
					<li>
						<a href="/aniwalk/walker/talkContent.do?mem_nickname=${chatList.mem_nickname}"><img class="img-circle" src="/owner/${chatList.mem_profile_img}" 
								onerror="this.src='/aniwalk/images/profile_test.png'" alt=""></a>
					</li>
					<li>
						<div>
							<label>${chatList.mem_nickname}</label>
							<span>${chatList.contents}</span>
						</div>
					</li>
				</ul>
				<label>${chatList.chat_date}</label>
			</div>
		</c:forEach>
		
		
	</div>
</div>

</body>
</html>