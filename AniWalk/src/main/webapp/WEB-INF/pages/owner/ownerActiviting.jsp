<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>산책중인 정보</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
	<!-- jquery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="activing">
	<div class="map-part">
		<div id="map" style="width:100%;height:100%;"></div>
	</div>
	<button id='currentBtn' type="button">현재 위치 보기</button>
	<div class="subtitle">
		<h4>실시간 산책정보</h4>
	</div>
	<div class="activing-info">
		<div class="walkingInfo">
			<div class="title">
			</div>
			<div class="img-list">
			</div>
		</div>
	</div>
	<button id="activeDone" class="btn btn-primary hidden">산책완료</button>
</div>


<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<button type="button" class="close">&times;</button>
		<form class="review-form">
			<h2>산책에 대한 평점을 주세요</h2>
			<input class="star-score" type="hidden" value="5">
			<div class="starRev">
				<span class="starR on">별1</span>
				<span class="starR on">별2</span>
				<span class="starR on">별3</span>
				<span class="starR on">별4</span>
				<span class="starR on">별5</span>
			</div>
			<label>
				<textarea class="form-control" placeholder="평가후기를 남겨주세요."></textarea>
			</label>
			<h4>이미지 혹은 영상을 업로드 해주세요</h4>
			<input type="file" class="form-control" >
			<div class="btn-line">
				<button class="btn btn-primary" type="submit">확인</button>
				<button id="jumpBtn" class="btn btn-default" type="button">건너뛰기</button>
			</div>
		</form>

	</div>
</div>

<input id="review" type="hidden" value="${review}">
<input id="walking_id" type="hidden" value="${walkingInfo.walking_id}">
<script src="${pageContext.request.contextPath}/static/js/map.js"></script>
<script src="${pageContext.request.contextPath}/static/js/ownerActiviting.js"></script>
<script>
document.getElementById('currentBtn')
.addEventListener('click', () => setPositionCenter());

$(document).ready(function(){
	getWalkingMission('center');
	getWalkingLocation();
	let getLocation = setInterval(() => {
		getWalkingMission();
		getWalkingLocation();
	}, 10000);
})
</script>
</body>
</html>
