/* ============공통==============*/

let geocoder = new kakao.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성합니다
let markers = []; //지도에 표시된 마커 객체를 가지고 있을 배열입니다
let currentlat = '';
let currentlng = '';

// 지도에 마커 추가
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
	case "current" : imageSrc = '/aniwalk/images/current.png';imageSize = new kakao.maps.Size(20, 20); break;
	}
    
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	// 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: locPosition, 
        image: markerImage // 마커이미지 설정 
    });
	
	if(content=='current'){
		markers[0] = marker;
	}else{
		markers.push(marker);
	}
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
//	map.setCenter(locPosition)
}

const setPositionCenter = function () {
	map.setCenter(new kakao.maps.LatLng(currentlat, currentlng));
}
// 좌표로 주소 불러오기
const coord2Address = function (coord) {
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			document.getElementById('centerAddr').innerHTML = detailAddr;

			document.getElementById('recruit_location').value = result[0].address.address_name;
		}
	};
	message = '<div style="padding:5px;">현재위치</div>';
	walkingAction(currentlat,currentlng,'current')
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
}

// 현재 위치 가져오기
const currentPosition = function () {
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			currentlat = position.coords.latitude; // 위도
			currentlng = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(currentlat, currentlng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
			coord2Address(locPosition)
		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'
	}
	walkingAction(currentlat,currentlng,'current');
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
const removeMarker = function () {
	for ( var i = 0; i < markers.length; i++ ) {
		markers[i].setMap(null);
	}
	markers = [];
}