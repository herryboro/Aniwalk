//카카오톡지도

let linePath = [];

const walking_id = document.getElementById('walking_id').value;

const mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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

//건너뛰기 버튼 클릭시
const jumpBtn = document.getElementById('jumpBtn');
jumpBtn.addEventListener('click',function(){
	location.href = '#';
})

const getWalkingMission = function (e) {
	$.ajax({
		type: 'post',
		url: '/aniwalk/walking/getWalkingMission.do',
		data:{
			"walking_id" : walking_id
		},
		success:function (data){
			if(data != null){
				let missionLoc = [];
				$('.activing-info').empty();
				for(let i=0;i<data.length;i++){
					missionLoc = data[i].mission_perform_location.split(',');
					currentlat = missionLoc[0];
					currentlng = missionLoc[1];
					walkingAction(missionLoc[0], missionLoc[1], data[i].mission_contents);
					viewWalkingMission(data[i])
				}
				if(e=='center') setPositionCenter();
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
			"walking_id" : walking_id
		},
		success:function (data){
			if(data != null){
				linePath = [];
				locations = data.split('/');
				for(let i in locations){
					if(locations[i] != ''){
						location = locations[i].split(',');
						currentlat = location[0];
						currentlng = location[1];
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

document.getElementById('currentBtn')
	.addEventListener('click', () => setPositionCenter());