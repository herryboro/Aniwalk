<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>산책활동리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="active-list">
	<img src="${pageContext.request.contextPath}/images/ownerindex.png" alt="" class="img-rounded" style="background: rgba(52, 152, 219, 0.6)">
	<h2>총 <span>${fn:length(allList) }</span>개의 산책일정이 있습니다.</h2>
	<div class="list-part">
		<c:forEach var="all" items="${allList}">
			<c:if test="${all.real_walk_end_time eq null}">
				<!-- 1개 시작 -->
				<ul class="list-item onair" onclick="location.href='/aniwalk/owner/activity.do?walking_id=${all.walking_id}'">
					<li style="justify-content: center">
						<img class="img-rounded" alt="" src="/walker/${all.wk_profile_img1}">
		
					</li>
					<li style="width: 55%">
						<ol>
							<li>
								<label>펫프렌즈 : </label>
								<span>${all.wk_name}</span>
							</li>
							<li>
								<label>시간 : </label>
								<span> ${all.walk_start_time} ~  ${all.walk_end_time}</span>
							</li>
							<li>
								<label>반려견 : </label>
								<span>${all.dog_name}</span>
							</li>
							<li>
								<label>시작장소 : </label>
								<span>${all.recruit_location}</span>
							</li>
							<li>
								<label>주의사항</label>
							</li>
							<li>
								<div class="notice">
									${all.recruit_notices}
								</div>
							</li>
						</ol>
					</li>
				</ul>
				<!-- 1개 끝 -->
			</c:if>
			<c:if test="${all.real_walk_end_time ne null}">
				<!-- 1개 시작 -->
				<ul class="list-item" onclick="location.href='/aniwalk/owner/activDone.do?walking_id=${all.walking_id}'">
					<li style="justify-content: center">
						<img class="img-rounded" alt="" src="/walker/${all.wk_profile_img1}">
		
					</li>
					<li style="width: 50%">
						<ol>
							<li>
								<label>펫프렌즈 : </label>
								<span>${all.wk_name}</span>
							</li>
							<li>
								<label>시간 : </label>
								<span> ${all.walk_start_time} ~  ${all.walk_end_time}</span>
							</li>
							<li>
								<label>반려견 : </label>
								<span>${all.dog_name}</span>
							</li>
							<li>
								<label>시작장소 : </label>
								<span>${all.recruit_location}</span>
							</li>
							<li>
								<label>주의사항</label>
							</li>
							<li>
								<div class="notice">
									${all.recruit_notices}
								</div>
							</li>
						</ol>
					</li>
				</ul>
				<!-- 1개 끝 -->
			</c:if>
		</c:forEach>
	</div>
</div>

</body>
</html>