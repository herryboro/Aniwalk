/* ============공통==============*/

let geocoder = new kakao.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성합니다
let markers = []; //지도에 표시된 마커 객체를 가지고 있을 배열입니다
let currentlat = '';
let currentlng = '';

const walking_id = document.getElementById('walking_id').value;
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
		if(markers[0]) markers[0].setMap(null);
		markers[0] = marker;
	}else{
		markers.push(marker);
	}
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
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
	//walkingAction(currentlat,currentlng,'current')
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

			var locPosition = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
			coord2Address(locPosition)
			walkingAction(position.coords.latitude,position.coords.longitude,'current');
		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'
	}
	
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
const removeMarker = function () {
	for ( var i = 0; i < markers.length; i++ ) {
		markers[i].setMap(null);
	}
	markers = [];
}

const drawLine = function(linePath) {
	// 지도에 표시할 선을 생성합니다
	console.log(linePath);
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
//현재 생성중인 산책 미션 불러오기
const loadImg = function (data) {
	for(var i=0;i<data.length;i++) {
		if(i==0) {
			$('.mission-img').append('<div>'+ data[i].mission_contents +'</div>')	
		} else if(data[i].mission_contents != data[i-1].mission_contents) {
			$('.mission-img').append('<div>'+ data[i].mission_contents +'</div>')
		}
		var img = data[i].mission_img.split('/')
		for(var j=0;j<img.length-1;j++) {
			if(img[j].includes(".mp4") || img[j].includes(".avi")) {
				$('.mission-img').append('<video src="/walking/'+img[j]+ '" class="activ-img img-rounded" muted autoplay="autoplay" loop="loop"></video>')	
			} else {
				$('.mission-img').append('<img src="/walking/'+ img[j] +'" alt="" class="activ-img img-rounded">')
			}
		}
	}
}
const getWalkingLocation = function(){
	$.ajax({
		type: 'post',
		url: '/aniwalk/walking/getWalkingLocation.do',
		data:{
			"walking_id" : walking_id
		},
		async: false,
		success:function (data){
			if(data != null){
				let linePath = data.map((path) => {
					console.log(path.walking_lat);
					currentlat = path.walking_lat;
					currentlng = path.walking_lng;
					return new kakao.maps.LatLng(path.walking_lat, path.walking_lng);	
				})
				drawLine(linePath);
			}
		},
		error: function (a,b,c){
			alert('error:getWalkingLocation');
		}
	})
}