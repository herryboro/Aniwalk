<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워커리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>

<body>
	<div class="walker-list">

		<div class="search-part">
			<form name="walkerListSearchForm">
				<label>
					<input class="form-control" type="search" placeholder="이름 및 장소를 검색">
				</label>
				<button class="btn btn-primary" type="submit">검색</button>
			</form>
		</div>
		<div class="items">
			<c:forEach var="walker" items="${walkerList}">
				<ul class="list-item">
					<li>
						<a href="/aniwalk/owner/walkerInfo.do?wk_id=${walker.wk_id}"><img src="/walker/${walker.wk_profile_img1}" alt=""></a>
					</li>
					<li>
						<ul>
							<li>
								<h4>짧은 자기소개</h4>
							</li>
							<li>
								<h3>${walker.wk_name}</h3>
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul>
									<li class="addr">${walker.wk_addr}</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</div>

	</div>
</body>
</html>