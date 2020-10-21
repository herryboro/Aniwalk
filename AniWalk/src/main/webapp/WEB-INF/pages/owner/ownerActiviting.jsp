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

	<div class="subtitle">
		<h4>실시간 산책정보</h4>
	</div>
	<div class="activing-info">
		<c:forEach var="mission" items="${missionList}">
			<div class="walkingInfo">
				<div class="title">
					<c:if test="${mission.mission_contents eq 'start'}">
						<h2>산책이 시작되었습니다.</h2>
						<span>${walkingInfo.real_walk_start_time}</span>
					</c:if>
					<c:if test="${mission.mission_contents eq 'water'}">
						<h2>물을 마시고 있어요</h2>
						<span>${mission.mission_perform_time}</span>
					</c:if>
					<c:if test="${mission.mission_contents eq 'snack'}">
						<h2>간식을 먹고 있어요</h2>
						<span>${mission.mission_perform_time}</span>
					</c:if>
					<c:if test="${mission.mission_contents eq 'pee'}">
						<h2>볼일을 보고 있어요</h2>
						<span>${mission.mission_perform_time}</span>
					</c:if>
					<c:if test="${mission.mission_contents eq 'oops'}">
						<h2>긴급상황 입니다. 메시지를 확인해 주세요</h2>
						<span>${mission.mission_perform_time}</span>
					</c:if>
					<c:if test="${mission.mission_contents eq 'end'}">
						<h2>산책을 마쳤습니다. 후기를 작성해 주세요!</h2>
						<span>${walkingInfo.real_walk_end_time}</span>
					</c:if>
					
				</div>
				<div class="img-list">
					<c:forEach var="missionImg" items="${fn:split(mission.mission_img,'/')}">
						<img src="/walking/${missionImg}" alt="" class="img-rounded">
					</c:forEach>
					<c:if test="${mission.mission_contents eq 'end'}">
						<button id="activeDone" class="btn btn-primary">산책완료</button>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
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



<script>
	//카카오톡지도
	const mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
	const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	const walkingAction = function (lat, lng, content) {
		let locPosition = new kakao.maps.LatLng(lat, lng);
		let imageSrc = '', // 마커이미지의 주소입니다
		imageSize = new kakao.maps.Size(32, 35), // 마커이미지의 크기입니다
		imageOption = {offset: new kakao.maps.Point(20, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		switch(content){
		case "start" : imageSrc = '/aniwalk/images/start.png'; break;
		case "water" : imageSrc = '/aniwalk/images/water.png'; break;
		case "snack" : imageSrc = '/aniwalk/images/snack.png'; break;
		case "pee" : imageSrc = '/aniwalk/images/pee.png'; break;
		case "oops" : imageSrc = '/aniwalk/images/oops.png'; break;
		case "end" : imageSrc = '/aniwalk/images/end.png'; break;
		}
	    
		let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
		// 마커를 생성합니다
	    let marker = new kakao.maps.Marker({
	        position: locPosition, 
	        image: markerImage // 마커이미지 설정 
	    });

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		map.setCenter(locPosition);
	}
</script>
<script>
	//모달
	const activeDone = document.getElementById('activeDone');
	const modalBg = document.querySelector('.modal-bg');
	const close = document.querySelector('.close');
	const modalClose = function(){
		modalBg.classList.add('hidden');
	}

	activeDone.addEventListener('click',function(){
		modalBg.classList.remove('hidden');
	});

	modalBg.addEventListener('click',modalClose);
	close.addEventListener('click',modalClose);

	//별점
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		$('.star-score').val($(this).text().replace('별', ''));
		return false;
	});
</script>
<script>
	//건너뛰기 버튼 클릭시
	const jumpBtn = document.getElementById('jumpBtn');
	jumpBtn.addEventListener('click',function(){
		location.href = '#';
	})
</script>
<script>
$(document).ready(function(){
	if("${missionList.size()}" != 0){
		let location = [];
		let locationlist = [];
		let data = [];
		let datalist = [];
		<c:forEach var="mission" items="${missionList}">
			location = "${mission.mission_perform_location}".split(',')
			location.push("${mission.mission_contents}");
			locationlist.push(location);
			data = {
					mission_contents : "${mission.mission_contents}",
					mission_img : "${mission.mission_img}",
			}
			datalist.push(data);
		</c:forEach>
		for(let i=0;i<datalist.length;i++){
			walkingAction(locationlist[i][0], locationlist[i][1], locationlist[i][2]);
		}
	}	
})

</script>
</body>
</html>
