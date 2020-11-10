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
<input id='walking_id' type="hidden" name="walking_id" value="${walking_id}">

<script src="${pageContext.request.contextPath}/static/js/map.js"></script>
<script src="${pageContext.request.contextPath}/static/js/walkerActiviting.js"></script>
<script>
	// 테스트 좌표
	/* let test = ['37.49848940973516 127.02452016301457',
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
	} */
	
</script>
<script>
const savelocation = () => {
	setTimeout(()=> {
		currentPosition();
		saveCurrentPosition(walking_id, currentlat, currentlng);
		savelocation();
	}, 10000);
};
currentPosition(); // 현재 위치 호출 함수
	
$(document).ready(function(){
	setPositionCenter();
})

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
		currentlat = locationlist[i][0];
		currentlng = locationlist[i][1];
	}
	setPositionCenter();
	loadImg(datalist);
	savelocation();
}

</script>
</body>
</html>