<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워커정보</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="walker-info">
	<div class="info-top">
		<h4>프렌즈 프로필</h4>
	</div>
	<div class="info-content">
		<div class="info-box">
			<img class="img-rounded" src="/walker/${walkerInfo[0].wk_profile_img1}" alt="">
			<span class="glyphicon glyphicon-remove"></span>
			<ul>
				<li>
					<div>
						<div class="starRev">
							<c:forEach begin="1" varStatus="status" end="${totalScore * 2}">
								<c:if test="${status.current % 2 == 1}">
									<span class="starR1 on"></span>
								</c:if>
								<c:if test="${status.current % 2 == 0}">
									<span class="starR2 on"></span>
								</c:if>
							</c:forEach>
							<c:forEach begin="${(totalScore * 2) % 2}" varStatus="status" 
										end="${9 - totalScore * 2 + ((totalScore * 2) % 2)}">
								<c:if test="${status.current % 2 == 0}">
									<span class="starR1"></span>
								</c:if>
								<c:if test="${status.current % 2 == 1}">
									<span class="starR2"></span>
								</c:if>
							</c:forEach>
						</div>
						<label class="total">${totalScore}</label>
					</div>
				</li>
				<li>
					<h4>짧은 자기소개</h4>
					${walkerInfo[0].wk_intro}
				</li>
				<li>
					<h4>이름</h4>
					${walkerInfo[0].wk_name}
				</li>
				<li>
					<ul>
						<li class="addr">${walkerInfo[0].wk_addr}</li>
						<c:set var="certiList" value="${fn:split(walkerInfo[0].wk_certificate_list,'/')}"/>					
						<c:forEach var="certi" items="${certiList}">
							<li>${certi}</li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<button class="btn" type="submit" onclick="location.href='/aniwalk/owner/talkContent.do?walker_id=${walkerInfo[0].walker_id}'">대화하기</button>
				</li>
			</ul>
		</div>

		<div class="part-title">
			<h4>산책 후기</h4>
			<hr width="80%" color="gray">
		</div>
		<div class="review-list">
			<c:forEach var="review" items="${reviewList}">
				<div class="review-item">
					<img class="img-rounded" src="/owner/${review.dog_image}" alt="">
					<div class="review-right">
						<ul>
							<li class="bottom-margin">
								<div>
									<img class="img-circle" src="/owner/${review.mem_profile_img}" 
										onerror="this.src='/aniwalk/images/profile_test.png'" alt="">
									<label>${review.mem_nickname}</label>
									<div class="starRev">
										<c:forEach begin="1" end="${review.review_score}">
											<span class="starR on"></span>
										</c:forEach>
										<c:forEach begin="1" end="${5-review.review_score}">
											<span class="starR"></span>
										</c:forEach>
									</div>
									<label class="star">${review.review_score}</label>
									<span class="right">${review.review_date}</span>
								</div>
							</li>
							<li>${review.review_contents}</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
<script>
	const backBtn = document.querySelector('.glyphicon-remove');
	backBtn.addEventListener('click',function(){
		window.history.back();
	});
</script>
</html>