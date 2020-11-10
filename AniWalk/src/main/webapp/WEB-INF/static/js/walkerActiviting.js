/* ============ walkerActiviting.jsp =============*/
let mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

let mapTypeControl = new kakao.maps.MapTypeControl(); //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
let zoomControl = new kakao.maps.ZoomControl(); // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
// 현재 위치 저장하기
const missionLoc = function () {
	$('#loc').val(currentlat + ',' + currentlng);
}

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
//사진 업로드
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

// 산책 미션 DB에 저장
const saveImg = function (e) {
	currentPosition();
	setPositionCenter();
	missionLoc();
	let input = $(e.target);
	let formData = new FormData(input.parent()[0]);
	if(input.prev().val()!=''){
		input.parent().parent().addClass('hidden');
		document.querySelector('.mission-img').classList.remove('hidden');
		document.getElementById('walkingStartTime').innerText = nowHour+'시 ' + nowMinute+'분';
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url: '/aniwalk/walking/walkingStart.do?walking_id='+ walking_id +'&mission_contents='
					+ $('#mission').val() + '&mission_perform_location=' + $('#loc').val(),
			data: formData,
			processData: false,
	        contentType: false,
	        cache: false,
	        async: false,
			success:function (data){
				input.prev().val('')
				input.prev().prev().empty();
				input.prev().prev().append('<img src="/aniwalk/images/main_logo.png" alt="" class=" img-rounded">');
				action();
				walkingAction(currentlat, currentlng, $('#mission').val());
				saveCurrentPosition(walking_id, currentlat, currentlng);
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

//현재 위치 DB에 저장
const saveCurrentPosition = (walking_id, currentlat, currentlng) => {
	$.get("/aniwalk/walker/insertWalkingLocation.do?walking_id="
			+ walking_id + "&walking_lat="+currentlat+"&walking_lng="+currentlng, (data) => {
	});
}

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
	//missionLoc();
	saveImg(e);
	savelocation();
	//teststart(); 
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
	clearTimeout(savelocation);
	alert('산책이 완료 되었습니다 :)');
	location.href='/aniwalk/walker/main.do';
})