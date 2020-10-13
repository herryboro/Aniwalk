<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
		<div class="active-start">
			<div class="title">
				<h2>산책이 시작되었습니다.</h2>
				<span>시작시간</span>
			</div>
			<div class="img-list">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
			</div>
		</div>
		<div class="active-mission">
			<div class="title">
				<h2>급수/배변중입니다.</h2>
				<span>미션등록시간</span>
			</div>
			<div class="img-list">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
			</div>
		</div>
		<div class="active-end">
			<div class="title">
				<h2>산책을 완료했습니다.</h2>
				<span>미션등록시간</span>
			</div>
			<div class="img-list">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
			</div>
			<button id="activeDone" class="btn btn-primary">산책완료</button>
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
				iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
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
</body>
</html>
