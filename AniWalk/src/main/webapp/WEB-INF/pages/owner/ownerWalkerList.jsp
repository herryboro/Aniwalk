<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
			<form name="walkerListSearchForm" method="post" action="/aniwalk/owner/walker.do">
				<label>
					<input name="searchWalker" class="form-control" type="search" placeholder="이름 및 장소를 검색">
				</label>
				<button class="btn btn-primary" type="submit">검색</button>
			</form>
		</div>
		<div class="items">
			<c:forEach var="walker" items="${walkerList}">
				<ul class="list-item" onclick="location.href='/aniwalk/owner/walkerInfo.do?wk_id=${walker.wk_id}'">
					<li>
						<img src="/walker/${walker.wk_profile_img1}" alt="">
					</li>
					<li>
						<ul>
							<li>
								<h4>짧은 자기소개</h4>
								${walker.wk_intro}
							</li>
							<li>
								<h3>${walker.wk_name}</h3>
								<div class="starRev">
									<c:forEach begin="1" varStatus="status" end="${walker.starcnt}">
										<c:if test="${status.current % 2 == 1}">
											<span class="starR1 on"></span>
										</c:if>
										<c:if test="${status.current % 2 == 0}">
											<span class="starR2 on"></span>
										</c:if>
									</c:forEach>
									<c:forEach begin="${walker.starcnt % 2}" varStatus="status" 
												end="${9 - walker.starcnt + (walker.starcnt % 2)}">
										<c:if test="${status.current % 2 == 0}">
											<span class="starR1"></span>
										</c:if>
										<c:if test="${status.current % 2 == 1}">
											<span class="starR2"></span>
										</c:if>
									</c:forEach>
								</div>
								<label>${walker.total}</label>
							</li>
							<li>
								<ul>
									<li class="addr">${walker.wk_location1}
										<c:if test="${walker.wk_location2 ne null}"> / ${walker.wk_location2}</c:if>
									</li>	
									<c:set var="certiList" value="${fn:split(walker.wk_certificate_list,'/')}"/>					
									<c:forEach var="certi" items="${certiList}">
										<li>${certi}</li>
									</c:forEach>														
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