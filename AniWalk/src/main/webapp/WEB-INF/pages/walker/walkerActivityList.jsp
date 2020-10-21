<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 산책리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<div class="walker-active-list">
		<div class="today-part">
			<label>현재 <span class="color-blue">${activList.size()}번</span>의 산책이 <span class="color-purple">예약</span>되어있습니다.</label>
		</div>
		<div class="row list-part">
			<c:forEach var="walking" items="${activList}">
				<c:if test="${walking.real_walk_end_time eq null}">
				<!-- item 시작 -->
				<div class="col-md-3 list-item">
					<img src="/owner/${walking.dog_image}" alt="" class="img-rounded">
					<ul>
						<li>
							<label>날짜 : </label>
							<span>${walking.recruit_date}</span>
						</li>
						<li>
							<label>견종 : </label>
							<span>${walking.dog_type}</span>
						</li>
						<li>
							<label>장소 : </label>
							<span>${walking.recruit_location}</span>
						</li>
						<li>
							<label>시간 : </label>
							<span>${walking.walk_start_time} - ${walking.walk_end_time}</span>
						</li>
						<li>
							<label>주의사항</label>
						</li>
						<li>
						<pre><span>${walking.recruit_notices}</span></pre>
						</li>
					</ul>
					<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/walker/activiting.do?walking_id=${walking.walking_id}'">산책시작</button>
				</div>
				<!-- item 끝 -->
				</c:if>
			</c:forEach>
		</div>



	</div>
	
</body>
</html>