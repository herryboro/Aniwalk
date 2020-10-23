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
		<div class="activing-input">
			<ul id="input-list">
				<li class="start-part">
					<div class="active-title">
						<h4>산책시작</h4>
						<span id="walkingStartTime"></span>
					</div>
					<form id='start' name="startImgForm" class="upload-part" enctype="multipart/form-data">
						<div class="align-center" onclick="startImgClick()">
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
						<div class="align-center" onclick="waterImgClick()">
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
						<div class="align-center" onclick="snackImgClick()">
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
						<div class="align-center" onclick="peeImgClick()">
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
						<div class="align-center" onclick="oopsImgClick()">
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
						<div class="align-center" onclick="endImgClick()">
							<img src="/aniwalk/images/main_logo.png" alt="" class="img-rounded">
						</div>
						<input id="endImg" name="files" type="file" class="hidden" multiple="multiple">
						<button class="btn btn-primary" type="button" id="endUpload">사진업로드</button>
					</form>
				</li>
			</ul>
			<div class="mission-img">
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
	let test = ['37.49848940973516 127.02452016301457',
		'37.49868314190035 127.02444389220899',
		'37.49861336571211 127.0241922497157',
		'37.49857960050564 127.02408197853306',
		'37.49852557859171 127.02389253979764',
		'37.49850982525564 127.02382185517129',
		'37.498489566277364 127.02375399633108',
		'37.49846705531117 127.02368330963358',
		'37.49845805317669 127.02364372623782',
		'37.498367950283644 127.02365500654503',
		'37.498361204045025 127.02359846084327',
		'37.49834769403056 127.02357301198829',
		'37.49832518239297 127.02350515265594',
		'37.498316181882984 127.02345708782599',
		'37.498313936659315 127.02342033382392',
		'37.498422080338656 127.0233044531781',
		'37.49840856914664 127.02328465871595',
		'37.498399574104646 127.02320832205935',
		'37.498390571256394 127.02317156593577',
		'37.498374811403075 127.02313198055725',
		'37.49834554472389 127.02304998336464',
		'37.49831178612858 127.02290013261639',
		'37.498296031651606 127.02283227557581',
		'37.49825325945836 127.02269938534587',
		'37.49822849805111 127.02261456264006',
		'37.49820824538704 127.02250995113435',
		'37.498194743738495 127.02243926777116',
		'37.49815196843229 127.0223205137979',
		'37.498147474603215 127.02226114187701',
		'37.498111481495975 127.02200951312659',
		'37.498088987296235 127.02184270358715',
		'37.49807548159916 127.02179181063073',
		'37.498091274683375 127.02165328396262',
		'37.49808452903642 127.02158825714474',
		'37.49811609718541 127.0214073273873',
		'37.498147639573375 127.0213677560025',
		'37.49835039300544 127.02121797332539',
		'37.4985058317961 127.0211332017812',
		'37.49854636644329 127.02119258410367',
		'37.49858464141758 127.02129154646967',
		'37.498611658846045 127.02136223384413',
		'37.498679197331526 127.0215658108131',
		'37.498755750213945 127.02174394602348',
		'37.49880302903294 127.02187401071869',
		'37.498812015996286 127.02199840995054',
		'37.498751187531845 127.02205493597423',
		'37.498622775624774 127.02215384980694',
		'37.49858898205347 127.02218493888356',
		'37.49853490091913 127.02229518310871',
		'37.498503337325154 127.02244501447929',
		'37.49851458914713 127.02250156153653',
		'37.498550602930315 127.02264010444861',
		'37.498604625759846 127.02283519672147',
		'37.49862263220172 127.02290588191829',
		'37.49866540691571 127.02302463697063',
		'37.49869017465829 127.02307553401491',
		'37.49872393136088 127.02323386717477',
		'37.49866310453373 127.02327908337004',
		'37.498611288867565 127.02331864791853',
		'37.49860450389436 127.02345717801383',
		'37.49862250996404 127.02352786335967',
		'37.49864276907171 127.02359572225916',
		'37.4986539799827 127.02385300005156',
		'37.49868323463296 127.02399154170743',
		'37.498714754324396 127.02406788597594',
		'37.49879580265775 127.0242742972284',
		'37.49884082149987 127.02442698042641',
		'37.49886558629354 127.02448918684266',
		'37.498912856193215 127.02464752545042',
		'37.49896011934588 127.02483696346937',
		'37.499007398938005 127.02494724004744',
		'37.499036658303034 127.02505751074304',
		'37.49891726177278 127.02511966923885',
		'37.498847428980014 127.02514226342251',
		'37.498791171757375 127.02487931543605',
		'37.49874164017713 127.02476621128201',
		'37.49870787786705 127.02464463088636',
		'37.49869437632084 127.02457960105063']
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
	let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	let markers = []; //지도에 표시된 마커 객체를 가지고 있을 배열입니다
	let geocoder = new kakao.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성합니다
	let mapTypeControl = new kakao.maps.MapTypeControl(); //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	let zoomControl = new kakao.maps.ZoomControl(); // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	let currentlat = '37.49848940973516'; // 현재 위도
	let currentlng = '127.02452016301457'; // 현재 경도
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도에 마커 추가
	const walkingAction = function (lat, lng, content) {
		var locPosition = new kakao.maps.LatLng(lat, lng);
		var imageSrc = '', // 마커이미지의 주소입니다
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
		map.setCenter(locPosition);
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
	
	// 현재 위치 저장하기
	const missionLoc = function () {
		$('#loc').val(currentlat + ',' + currentlng);
	}
	
	// 테스트 
	const testlocation = function (testlatlng) {
		let testloc = testlatlng.split(' ');
		currentlat = testloc[0]
		currentlng = testloc[1]
		missionLoc()
		$.ajax({
			type: 'post',
			url: '/aniwalk/walking/walkingLocation.do',
			data:{
				"walking_map_path" : $('#loc').val(),
				"walking_id" : "${walking_id}"
			},
			success:function (data){
			},
			error: function (a,b,c){
				alert('xx')
			}
		})
	}
	const teststart = function () {
		for(let i in test){
			setTimeout(() => {
				testlocation(test[i]);	
			}, i * 1000)
		} 
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
		let cnt = 0;
		let maxSize = 209715200;
		let input = $(e.target)
		let files = e.target.files;
		let filesArr = Array.prototype.slice.call(files);
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
		//currentPosition();
		//missionLoc();
		let input = $(e.target);
		let formData = new FormData(input.parent()[0]);
		if(input.prev().val()!=''){
			input.parent().parent().addClass('hidden');
			document.querySelector('.mission-img').classList.remove('hidden');
			document.getElementById('walkingStartTime').innerText = nowHour+'시 ' + nowMinute+'분';
			$.ajax({
				type: 'post',
				enctype: 'multipart/form-data',
				url: '/aniwalk/walking/walkingStart.do?walking_id='+ "${walking_id}" +'&mission_contents='
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
					walkingAction(currentlat, currentlng, $('#mission').val());
					removeWhite();
					if($('#mission').val() == 'start') {
						activeBtn[2].click();
					}
					$('.mission-img').empty();
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
		missionLoc();
		saveImg(e);
		teststart(); 
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
		//currentPosition(); // 현재 위치 호출 함수
		if("${missionList.size()}" != 0){
			$('#input-list > li').addClass('hidden');
			action()
			removeWhite()
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
			loadImg(datalist);
		}	
	})
	
</script>
</body>
</html>