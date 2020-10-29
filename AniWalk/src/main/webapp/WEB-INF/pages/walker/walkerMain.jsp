<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 메인</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<c:if test="${walkingList.size() eq 0}">
		<div class="main-active-none">
			<img src="${pageContext.request.contextPath}/images/walkerMain.png" alt="">
			<h2>활동 내역이 없습니다.</h2>
		</div>
	</c:if>
	<c:if test="${walkingList.size() ne 0}">
	<div class="main-active-list">
		<h2>활동현황</h2>
			<!-- 1일씩 -->
			<div class="subtitle">
				<h4>${walking.walk_date}</h4>
				<hr width="80%" color="gray"/>
			</div>
			<table>
				<thead>
				<tr>
					<th>댕댕이 주인</th>
					<th>댕댕이 이름</th>
					<th>장소</th>
					<th>산책시간</th>
					<th style="text-align: center;">진행현황</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="walking" items="${walkingList}">
				<tr>
					<td>
						${walking.mem_nickname}
					</td>
					<td>
						${walking.dog_name}
					</td>
					<td>
						${walking.recruit_location}
					</td>
					<td>
						${walking.real_walk_start_time}  ~   ${walking.real_walk_end_time}
					</td>
					<td>
						<c:choose>
							<c:when test="${walking.real_walk_start_time eq null}">
								<div class="not">산책 준비중</div>
							</c:when>
							<c:when test="${walking.real_walk_end_time ne null}">
								<div class="done" onclick="location.href='/aniwalk/walker/activDone.do?walking_id=${walking.walking_id}'">산책 완료</div>
							</c:when>
							<c:otherwise>
								<div class="not">산책 중</div>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		
	</div>
	</c:if>
</body>
</html>