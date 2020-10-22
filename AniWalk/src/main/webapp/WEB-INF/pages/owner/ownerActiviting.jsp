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
		<div class="walkingInfo">
			<div class="title">
			</div>
			<div class="img-list">
			</div>
		</div>
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
	let linePath = [];
	let currentLat = '';
	let currentLng = '';
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
		imageOption = {offset: new kakao.maps.Point(20, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
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
		//map.setCenter(locPosition);
	}
	
	const drawLine = function() {
		// 지도에 표시할 선을 생성합니다
		let polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		// 지도에 선을 표시합니다 
		polyline.setMap(map);  
	}
	
	const center = function() {
		map.setCenter(new kakao.maps.LatLng(currentLat, currentLng));
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
const getWalkingMission = function (e) {
	$.ajax({
		type: 'post',
		url: '/aniwalk/walking/getWalkingMission.do',
		data:{
			"walking_id" : "${walkingInfo.walking_id}"
		},
		success:function (data){
			if(data != null){
				let missionLoc = [];
				$('.activing-info').empty();
				for(let i=0;i<data.length;i++){
					missionLoc = data[i].mission_perform_location.split(',');
					currentLat = missionLoc[0];
					currentLng = missionLoc[1];
					walkingAction(missionLoc[0], missionLoc[1], data[i].mission_contents);
					viewWalkingMission(data[i])
				}
				if(e=='center') center();
			}
		},
		error: function (a,b,c){
			alert('xx')
		}
	})
}

const viewWalkingMission = function(data) {
	let message = '';
	let images = []
	let image = '';
	images = data.mission_img.split('/');
	for(let i=0;i<images.length-1;i++){
		image += '<img src="/walking/'+ images[i] +'" alt="" class="img-rounded">' 
	}
	switch(data.mission_contents){
	case "start" : message = '산책이 시작되었습니다.'; break;
	case "water" : message = '물을 마시고 있어요.'; break;
	case "snack" : message = '간식을 먹고 있어요.'; break;
	case "pee" : message = '볼일을 보고 있어요.'; break;
	case "oops" : message = '긴급상황 입니다. 메시지를 확인해 주세요.'; break;
	case "end" : message = '산책을 마쳤습니다. 후기를 작성해 주세요!';
				image += '<button id="activeDone" class="btn btn-primary">산책완료</button>'; break;
	}
	$('.activing-info').append('<div class="walkingInfo"><div class="title"><h2>'+ message +
			'</h2><span>'+ data.mission_perform_time +'</span></div><div class="img-list">'+
			image + '</div></div>');
	
}

const getWalkingLocation = function(){
	let locations = [];
	let location = [];
	$.ajax({
		type: 'post',
		url: '/aniwalk/walking/getWalkingLocation.do',
		data:{
			"walking_id" : "${walkingInfo.walking_id}"
		},
		success:function (data){
			if(data != null){
				linePath = [];
				locations = data.split('/');
				
				for(let i in locations){
					if(locations[i] != ''){
						location = locations[i].split(',');
						linePath.push(new kakao.maps.LatLng(location[0],location[1]))	
					}
				}
				drawLine();
			}
		},
		error: function (a,b,c){
			alert('xx')
		}
	})
}

$(document).ready(function(){
	getWalkingMission('center');
	getWalkingLocation();
	let getLocation = setInterval(() => {
		getWalkingMission();
		getWalkingLocation();
	}, 2000);
})
</script>
</body>
</html>
