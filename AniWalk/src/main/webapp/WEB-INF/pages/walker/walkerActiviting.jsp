<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<div class="content-part">
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
						<span id="walkingStartTime"></span>
					</div>
					<form id='start' name="startImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="startImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="startImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="startUpload">사진업로드</button>
					</form>
				</li>
				<li class="mission-water hidden">
					<div class="active-title">
						<input name="missionType" type="hidden" >
						<h4>mission : 급수</h4><button class="btn" type="button" onclick="closeBtn()">X</button>
					</div>
					<form id='water' name="missionImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="waterImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="waterImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="waterUpload">사진업로드</button>
					</form>
				</li>
				<li class="mission-snack hidden">
					<div class="active-title">
						<input name="missionType" type="hidden" >
						<h4>mission : 간식</h4><button class="btn" type="button" onclick="closeBtn()">X</button>
					</div>
					<form id='snack' name="missionImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="snackImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="snackImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="snackUpload">사진업로드</button>
					</form>
				</li>
				<li class="mission-pee hidden">
					<div class="active-title">
						<input name="missionType" type="hidden" >
						<h4>mission : 배변</h4><button class="btn" type="button" onclick="closeBtn()">X</button>
					</div>
					<form id='pee' name="missionImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="peeImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="peeImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="peeUpload">사진업로드</button>
					</form>
				</li>
				<li class="mission-oops hidden">
					<div class="active-title">
						<input name="missionType" type="hidden" >
						<h4>mission : 긴급</h4><button class="btn" type="button" onclick="closeBtn()">X</button>
					</div>
					<form id='oops' name="missionImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="oopsImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="oopsImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="oopsUpload">사진업로드</button>
					</form>
				</li>
				<li class="end-part hidden">
					<div class="active-title">
						<input name="missionType" type="hidden" >
						<h4>산책종료</h4><button class="btn" type="button" onclick="closeBtn()">X</button>
					</div>
					<form id='end' name="missionImgForm" class="upload-part" enctype="multipart/form-data">
						<div onclick="endImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="endImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="endUpload">사진업로드</button>
					</form>
				</li>
			</ul>
			<div class="mission-img">
				<c:forEach var="mission" varStatus="status" items="${missionList}">
				<c:set var="imgList" value="${fn:split(mission.mission_img,'/')}" ></c:set>
					<c:if test="${status.first}"><div>${mission.mission_contents}</div></c:if>
					<c:if test="${!status.first && (missionList[status.index].mission_contents != missionList[status.index-1].mission_contents)}">
						<div>${mission.mission_contents}</div>
					</c:if>
					<c:forEach var="img" items="${imgList}">
						<c:if test="${fn:contains(img, '.mp4') or fn:contains(img, '.avi')}">
							<video src="/walking/${img}" class="activ-img img-rounded" muted autoplay="autoplay" loop="loop"></video>
						</c:if>
						<c:if test="${!fn:contains(img, '.mp4') and !fn:contains(img, '.avi')}">
			    			<img src="/walking/${img}" alt="" class="activ-img img-rounded">
			    		</c:if>
		    		</c:forEach>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="active-menu">
		<i class="fas fa-walking color-white"></i>
		<i class="fas fa-tint"></i>
		<i class="fas fa-drumstick-bite"></i>
		<i class="fas fa-toilet"></i>
		<i class="fas fa-exclamation-circle"></i>
		<i class="fas fa-sign-out-alt"></i>
	</div>
</div>
<input id='loc' type="hidden" name="mission_perform_location">
<input id='mission' type="hidden" name="mission_contents" value="start">

<script>
	// 카카오 지도
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};
	let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	let markers = []; //지도에 표시된 마커 객체를 가지고 있을 배열입니다
	let geocoder = new kakao.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성합니다
	let mapTypeControl = new kakao.maps.MapTypeControl(); //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	let zoomControl = new kakao.maps.ZoomControl(); // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	let currentlat = ''; // 현재 위도
	let currentlng = ''; // 현재 경도
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도에 마커 추가
	const walkingAction = function (lat, lng) {
		var locPosition = new kakao.maps.LatLng(lat, lng);
		
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
	 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: locPosition, 
	        image: markerImage // 마커이미지 설정 
	    });
		markers.push(marker)
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
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
		displayMarker(coord, message);
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
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
				coord2Address(locPosition)
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
					message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
	}

	// 지도에 현재 위치의 마커와 인포윈도우를 표시하는 함수입니다
	const displayMarker = function (locPosition, message) {
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
		markers[0] = marker;

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	};

	//지도 위에 표시되고 있는 마커를 모두 제거합니다
	const removeMarker = function () {
		for ( var i = 0; i < markers.length; i++ ) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	
	const missionLoc = function () {
		$('#loc').val(currentlat + ',' + currentlng);
	}
	
</script>
<script>
	//산책 미션 네비게이션 
	const activeBtn = document.getElementsByTagName('i');
	const removeWhite = function(){
		for(let j=0; j<activeBtn.length; j++){
			activeBtn[j].classList.remove('color-white');
		}
	}
	const addHidden = function (){
		$('#input-list > li').addClass('hidden');
		$('.mission-img').addClass('hidden');
	}
	const closeBtn = function (){
		addHidden();
		removeWhite();
		$('.mission-img').removeClass('hidden');
	}
	const action = function (){
		//급수
		activeBtn[2].addEventListener('click',function (){
			addHidden();
			document.querySelector('.mission-water').classList.remove('hidden');
			removeWhite();
			this.classList.add('color-white');
			$('#mission').val('water')
		});
	
		//간식
		activeBtn[3].addEventListener('click',function (){
			addHidden();
			document.querySelector('.mission-snack').classList.remove('hidden');
			removeWhite();
			this.classList.add('color-white');
			$('#mission').val('snack')
		});
	
		//배변
		activeBtn[4].addEventListener('click',function (){
			addHidden();
			document.querySelector('.mission-pee').classList.remove('hidden');
			removeWhite();
			this.classList.add('color-white');
			$('#mission').val('pee')
		});
	
		//돌발상황
		activeBtn[5].addEventListener('click',function (){
			addHidden();
			document.querySelector('.mission-oops').classList.remove('hidden');
			removeWhite();
			this.classList.add('color-white');
			$('#mission').val('oops')
		});
	
		//산책종료
		activeBtn[6].addEventListener('click',function (){
			addHidden();
			document.querySelector('.end-part').classList.remove('hidden');
			removeWhite();
			this.classList.add('color-white');
			$('#mission').val('end')
		});
	}
	// 사진 업로드
	const uploadImg = function (e){
		var cnt = 0;
		var maxSize = 209715200;
		var input = $(e.target)
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		if(files.length == 0){
			input.prev().empty();
			input.prev().append('<img src="/aniwalk/images/main_logo.png" alt="" class=" img-rounded">');
		} else if(files.length > 2) {
			alert('최대 2개 까지 선택 가능합니다.');
			input.val('');
		} else {
			filesArr.forEach(function(f) {
	    		if(f.size >= maxSize) {
	    			alert("파일 사이즈 초과");
	    			input.val('');
	    		} else if(!(f.type.match("image.*") || f.type.match("video.mp4") || f.type.match("video.avi") )) {
	    			alert("사진과 동영상만 업로드 가능합니다!");
	    		} else {
	    			input.prev().empty();
	    			for(var i=0; i<files.length; i++){
	    				if(files[i].type.match("video.mp4")|| files[i].type.match("video.avi")){
	    					input.prev().append('<video class="activ-img img-rounded" src='+URL.createObjectURL(files[i])+ ' muted autoplay="autoplay" loop="loop"></video>')
	    				} else {
	    					input.prev().append('<img src='+URL.createObjectURL(files[i])+' alt="" class="activ-img img-rounded">');
	    				}
	    				missionLoc();
	    			}
	    		}
	    	});
		}
	}
	// 현재 생성중인 산책 미션 불러오기
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
	// 산책 미션 DB에 저장
	const saveImg = function (e) {
		var input = $(e.target);
		var formData = new FormData(input.parent()[0]);
		if(input.prev().val()!=''){
			input.parent().parent().addClass('hidden');
			document.querySelector('.mission-img').classList.remove('hidden');
			document.getElementById('walkingStartTime').innerText = nowHour+'시 ' + nowMinute+'분';
			$.ajax({
				type: 'post',
				enctype: 'multipart/form-data',
				url: '/aniwalk/walking/walkingStart.do?walking_id=1234&mission_contents='
						+ $('#mission').val() + '&mission_perform_location=' + $('#loc').val(),
				data: formData,
				processData: false,
		        contentType: false,
		        cache: false,
				success:function (data){
					input.prev().val('')
					input.prev().prev().empty();
					input.prev().prev().append('<img src="/aniwalk/images/main_logo.png" alt="" class=" img-rounded">');
					action();
					walkingAction(currentlat, currentlng);
					removeWhite();
					if($('#mission').val() == 'start') {
						activeBtn[2].click();
					}
					$('.mission-img').empty()
					loadImg(data)
				},
				error: function (a,b,c){
					alert('xx')
				}
			})
		} else {
			alert('사진을 선택해주세요');
		}
	}
</script>
<script>
	//업로드 할 사진 선택시 이벤트
	const startChangeImg = document.getElementById('startImg');
	const waterChangeImg = document.getElementById('waterImg');
	const snackChangeImg = document.getElementById('snackImg');
	const peeChangeImg = document.getElementById('peeImg');
	const oopsChangeImg = document.getElementById('oopsImg');
	const endChangeImg = document.getElementById('endImg');
	
	const startImgClick = function (){
		document.getElementById('startImg').click();
	}
	const waterImgClick = function (){
		document.getElementById('waterImg').click();
	}
	const snackImgClick = function (){
		document.getElementById('snackImg').click();
	}
	const peeImgClick = function (){
		document.getElementById('peeImg').click();
	}
	const oopsImgClick = function (){
		document.getElementById('oopsImg').click();
	}
	const endImgClick = function (){
		document.getElementById('endImg').click();
	}
	
	startChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	waterChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	snackChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	peeChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	oopsChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	endChangeImg.addEventListener('change',function (e){
		uploadImg(e);
	})
	
</script>
<script>
	// 업로드 버튼 클릭시 이벤트
	const startUploadBtn = document.getElementById('startUpload');
	const waterUploadBtn = document.getElementById('waterUpload');
	const snackUploadBtn = document.getElementById('snackUpload');
	const peeUploadBtn = document.getElementById('peeUpload');
	const oopsUploadBtn = document.getElementById('oopsUpload');
	const endUploadBtn = document.getElementById('endUpload');
	const today = new Date;
	
	let nowHour = today.getHours();
	let nowMinute = today.getMinutes();

	startUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	waterUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	snackUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	peeUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	oopsUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	endUploadBtn.addEventListener('click',function (e){
		saveImg(e);
	})
	
	$(document).ready(function(){
		if($('.mission-img').children().length){
			$('#input-list > li').addClass('hidden');
			action()
			removeWhite()
		}	
		currentPosition(); // 현재 위치 호출 함수
	})
</script>
</body>
</html>