<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집하기</title>
	<link rel="stylesheet" type="text/css" href="../../static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<!-- 스와이퍼 -->
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>

	<!-- 카카오톡지도 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
</head>
<body>
<div class="recruit-write">
	<div>
		<h4>모집글작성</h4>
		<hr width="90%" color="gray">
	</div>

	<section>
		<h4>1.반려견 선택</h4>
		<ol>
			<li>
				<img class="img-rounded" src="../../images/mydog.jpg" alt="">
			</li>
			<li>
				<label>반려견 이름</label>
			</li>
		</ol>
	</section>
	<section class="date-select">
		<div class="form-group">
			<div>
				<h4>2.일정 선택</h4>
				<i class="far fa-calendar-plus"></i>
			</div>
			<label>2020-09-24</label>
		</div>
		<div class="form-group">
			<div>
				<h4>3.시간 선택</h4>
				<i class="far fa-clock"></i>
			</div>
			<label>2020-09-24</label>
		</div>
	</section>
	<section>
		<h4>4.주소선택</h4>
		<div id="map" style="width:500px;height:400px;" class="kakao-map"></div>
		<label id="centerAddr">현재주소만 가져오면되는데 이게 힘드네 어휴</label>
	</section>
	<section class="notice">
		<h4>5.주의사항</h4>
		<label>
			<textarea class="form-control" cols="200"></textarea>
		</label>
	</section>
</div>

</body>

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

</html>