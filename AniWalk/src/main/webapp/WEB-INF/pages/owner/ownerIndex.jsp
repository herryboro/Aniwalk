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
	<h2>오늘 <span>${fn:length(todayList) }</span>개의 산책일정이 있습니다.</h2>
	<div class="list-part">
		<c:forEach var="today" items="${todayList}">
		<!-- 1개 시작 -->
		<ul class="list-item onair">
			<li style="justify-content: center">
				<img class="img-rounded" alt="" src="/walker/${today.wk_profile_img1}">
			</li>
			<li style="width: 55%">
				<ol>
					<li>
						<label>펫프렌즈</label>
						<label>${today.wk_name}</label>
					</li>
					<li>
						<label>시간 : </label>
						<span> ${today.walk_start_time} ~  ${today.walk_end_time}</span>
					</li>
					<li>
						<label>반려견 : </label>
						<span>${today.dog_name}</span>
					</li>
					<li>
						<label>시작장소 : </label>
						<span>${today.recruit_location}</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						<div class="notice">
							${today.recruit_notices}
						</div>
					</li>
				</ol>
			</li>
		</ul>
		<!-- 1개 끝 -->
		</c:forEach>
	</div>
</div>
<div class="modal-bg hidden">
	<div class="modal-content">
		<button class="close">&times;</button>
		<div class="popup">
			<h2>진행중인 산책이 아닙니다.</h2>
			<button type="button" class="btn btn-primary close-btn">확인</button>
		</div>
	</div>
</div>
<script>
	const listItem = document.querySelectorAll('.list-item');
	const onAir = document.querySelectorAll('.onair');
	const modalBg = document.querySelector('.modal-bg');
	const close = document.querySelector('.close');
	const closeBtn = document.querySelector('.close-btn');

	for(var i=0; i<listItem.length; i++){
		listItem[i].addEventListener('click',function(){
			if(this.classList.contains('onair')){ //산책 진행 중
				location.href = '/aniwalk/owner/activity.do?walking_id="${today.walking_id}"';
			}else {
				modalBg.classList.remove('hidden'); //산책이 진행 중이 아님
			}
		})
	}
	close.addEventListener('click',function (){
		modalBg.classList.add('hidden');
	})
	closeBtn.addEventListener('click',function (){
		modalBg.classList.add('hidden');
	})
</script>

</body>
</html>