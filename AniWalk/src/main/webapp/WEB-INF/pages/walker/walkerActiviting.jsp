<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프렌즈 산책활동</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
	<!-- jquery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="walker-activing">
	<div class="activing-map">
		<input type="hidden" id="recruit_location" name="recruit_location" value="">
		<div id="map" style="width: 500px; height: 400px;" class="kakao-map"></div>
		<label id="centerAddr">현재주소</label>
	</div>
	<!-- 이 부분은 javascript로 관리할 예정 -->
	<div class="activing-input">
		<ul id="input-list">
			<li class="start-part">
				<div class="active-title">
					<h4>산책시작</h4>
				</div>
				<form name="startImgForm" class="upload-part">
					<img src="../../images/main_logo.png" alt="" class="img-rounded" onclick="startImgClick()">
					<input id="startImg" type="file" class="hidden" multiple="multiple">
					<button class="btn btn-primary" type="button" id="startUpload">사진업로드</button>
				</form>
				<div class="output start-output">

				</div>
			</li>
			<li class="mission-part hidden">
				<div class="active-title">
					<input name="missionType" type="hidden" >
					<h4>mission이름 미션</h4>
				</div>
				<form name="missionImgForm" class="upload-part">
					<img src="../../images/main_logo.png" alt="" class="img-rounded">
					<input id="endImg" type="file" class="hidden" multiple="multiple">
					<button class="btn btn-primary" type="button">사진업로드</button>
				</form>
				<div class="output mission-output">

				</div>
			</li>
			<li class="end-part hidden">
				<div class="active-title">
					<h4>산책종료</h4>
				</div>
				<form name="endImgForm" class="upload-part">
					<img src="../../images/main_logo.png" alt="" class="img-rounded" onclick="endImgClick()">
					<button class="btn btn-primary" type="button" id="endUpload" >사진업로드</button>
				</form>
				<div class="output end-output">

				</div>
			</li>
		</ul>
	</div>
	<div class="active-menu">
		<i class="fas fa-walking"></i>
		<i class="fas fa-tint"></i>
		<i class="fas fa-drumstick-bite"></i>
		<i class="fas fa-toilet"></i>
		<i class="fas fa-exclamation-circle"></i>
		<i class="fas fa-sign-out-alt"></i>
	</div>
</div>


<script>
	//카카오톡지도 생성
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();


	//좌표로 주소 불러오기
	function coord2Address(coord) {
		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				document.getElementById('centerAddr').innerHTML = detailAddr;

				document.getElementById('recruit_location').value = result[0].address.address_name;
			}
		};
		message = '<div style="padding:5px;">현재위치</div>';
		displayMarker(coord, message);
		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	}

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
			coord2Address(locPosition)
		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		removeMarker();
		var iwContent = message, // 인포윈도우에 표시할 내용
				iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});
		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition
		});
		// 인포윈도우를 마커위에 표시합니다
		// infowindow.open(map, marker);

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 생성된 마커를 배열에 추가합니다
		markers.push(marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	};

	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	//지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
			markers[i].setMap(null);
		}
		markers = [];
	}
</script>
<script>
	startImgClick = function (){
		document.getElementById('startImg').click();
	}
	endImgClick = function (){
		document.getElementById('endImg').click();
	}
</script>
<script>
	//메뉴 클릭했을 때 이벤트
	const activeBtn = document.getElementsByTagName('i');

	removeWhite = function(){
		for(let j=0; j<activeBtn.length; j++){
			activeBtn[j].classList.remove('color-white');
		}
	}
	addWhite = function (){
		this.classList.add('color-white');
	}
	addHidden = function (){
		$('#input-list > li').addClass('hidden');
	}

	activeBtn[1].addEventListener('click',function (){
		addHidden();
		document.querySelector('.mission-part').classList.remove('hidden');
		removeWhite();
		addWhite();
	});

	activeBtn[5].addEventListener('click',function (){
		addHidden();
		document.querySelector('.end-part').classList.remove('hidden');
		removeWhite();
		addWhite();
	});

</script>
<script>
	const startUploadBtn = document.getElementById('startUpload');
	const endUploadBtn = document.getElementById('endUpload');

	startUploadBtn.addEventListener('click',function (){
		$.ajax({
			type: 'post',
			url: '#',
			dataType: 'text',
			data:{

			},
			success:function (){
				document.querySelector('.start-output').innerHTML
				=
			},
			error: function (a,b,c){

			}
		})
	})
</script>
</body>
</html>