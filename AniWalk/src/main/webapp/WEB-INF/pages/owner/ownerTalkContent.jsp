<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톡방</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	
</head>
<body>
	<div class="talk-content">
		<div class="reserve-btn">산책 예약하기</div>
		
		<div class="content-part" id="messageWindow">
			<c:forEach var="chatDto" items="${chatDtos}">
				<c:choose>
					<c:when test="${chatDto.walk_date ne null}"> <!-- 예약 신청 -->
						<div class="reserve-box-my">
							<ul>
								<li>
									<label>날짜 : </label>
									<span>${chatDto.walk_date }</span>
								</li>
								<li>
									<label>시간 : </label>
									<span>${chatDto.walk_start_time  } ~ ${chatDto.walk_end_time  }</span>
								</li>
								<li>
									<label>장소 : </label>
									<span>${chatDto.recruit_location }</span>
								</li>
								<li>
									<label>반려견 : </label>
									<span>${chatDto.dog_name }(${chatDto.dog_type })</span>
								</li>
								<li>
									<label>주의사항 : </label>
									<div>
										${chatDto.recruit_notices }
									</div>
								</li>
							</ul>
							<button class="btn btn-primary" type="button">예약 정보 수정</button>
						</div>
					</c:when>
					<c:when test="${chatDto.reservation eq 'accept'}"> <!-- 워커가 예약 수락 -->
						<div class="you">
							<img src="/walker/${wk_profile_img1}" class="img-circle" alt="">
							<ul>
								<li>
									<label>${chatDto.walker_id}</label>
								</li>
								<li>
									<div class="reserve-box-you">
										<label>프렌즈 ${chatDto.walker_id}님이 산책 예약을 수락했습니다.</label>
										<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/owner/activityList.do'">정보보기</button>
									</div>
									<span style="position: relative; top: 40%;">${chatDto.chat_date}</span>
								</li>
							</ul>
						</div>
					</c:when>
					<c:when test="${chatDto.reservation eq 'reject'}"> <!-- 워커가 예약 거절 -->
						<div class="you">
							<img src="/walker/${wk_profile_img1}" class="img-circle" alt="">
							<ul>
								<li>
									<label>${chatDto.walker_id}</label>
								</li>
								<li>
									<div class="reserve-box-you">
										<label>프렌즈 ${chatDto.walker_id}님과 산책이 매칭되지 않았습니다.</label>
									</div>
									<span style="position: relative; top: 40%;">${chatDto.chat_date}</span>
								</li>
							</ul>
						</div>
					</c:when>
					<c:otherwise> <!-- 일반 채팅 내용 -->
						<c:choose> 
							<c:when test="${chatDto.send_nickname eq mem_nickname}"> <!-- 내가 보낸 내용 -->
								<div class="my">
									<ul>
										<li style="min-width: 60px">
											<span>${chatDto.chat_date}</span>
										</li>
										<li>
											<div class="my-talk-content">${chatDto.contents }</div>
										</li>
									</ul>
								</div>
							</c:when>
							<c:otherwise><!-- 상대방이 보낸 내용 -->
								<div class="you">
									<img src="/walker/${wk_profile_img1}" class="img-circle" alt="">
									<ul>
										<li>
											<label>${chatDto.walker_id} </label>
										</li>
										<li>
											<div>${chatDto.contents }</div>
											<span>${chatDto.chat_date}</span>
										</li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
		</div>
	</div>

	<!-- 대화입력창 -->
	<form class="talk-inputForm">
	<input type="hidden" value="${mem_nickname}" id="chat_id" name="mem_nickname">
	<input type="hidden" value="${walker_id}" id="walker_id" name="walker_id">
	<input type="hidden" value="${wk_profile_img1}" id="wk_profile_img1" name="wk_profile_img1">
	<input type="hidden" value="${wk_id}" id="wk_id">
		<label>
			<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
		</label>
		<button class="btn btn-primary" type="button" id="send">입력</button>
	</form>
	<div class="modal-bg hidden">
		<div class="modal-content" onclick="event.stopPropagation()">
			<button class="close" type="button">&times;</button>
			<div class="reserve-modal">
				<h3>매칭안된 모집글 리스트</h3>
				<div class="dont-match-list">
					<c:forEach var="non" items="${nonMatchList}">
						<div class="list-item">
							<img src="/owner/${non.dog_image}" class="img-rounded" alt="">
							<ul>
								<li>
									<label>날짜 : </label>
									<span>${non.walk_date}</span>
								</li>
								<li>
									<label>시간 : </label>
									<span>${non.walk_start_time} ~ ${non.walk_end_time}</span>
								</li>
								<li>
									<label>장소 : </label>
									<span>${non.recruit_location}</span>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<!-- 모집글 작성 버튼 -->
				<div class="new-recruit">
					<i class="far fa-plus-square"></i>
					<label>새로운 모집글 작성</label>
				</div>
				<!-- 예약, 취소 버튼 -->
				<div class="btn-line">
					<button type="button" class="btn btn-primary reservation-btn" onclick="reservation()">예약하기</button>
					<button type="button" class="btn btn-default cancel-btn">취소</button>
				</div>
			</div>
		</div>
	</div>
<script>
	//모달창
	const reserveBtn = document.querySelector('.reserve-btn');
	const modalBg = document.querySelector('.modal-bg');
	const close = document.querySelector('.close');
	const cancelBtn = document.querySelector('.cancel-btn');
	const reservationBtn = document.querySelector('.reservation-btn');
	
	const modalClose = function(){
		modalBg.classList.add('hidden');
	}

	reserveBtn.addEventListener('click',function(){
		modalBg.classList.remove('hidden');
	});

	modalBg.addEventListener('click',modalClose);
	close.addEventListener('click',modalClose);
	cancelBtn.addEventListener('click',modalClose);
	reservationBtn.addEventListener('click',modalClose);
</script>
<script>
	//매칭안된 모집글 클릭시 이벤트
	const listItem = document.querySelectorAll('.list-item');
	var matchingIndex = 0; 
	for(let i=0; i<listItem.length; i++) {
		listItem[i].addEventListener('click',function(){
			for(let j=0; j<listItem.length; j++){
				listItem[j].classList.remove('on-click');
			}
			listItem[i].classList.add('on-click');
			matchingIndex = i;
			console.log("matchingIndex::"+matchingIndex);
			
		});
	}
	
	//예약하기 버튼 클릭 시 이벤트
	function reservation(){
		var NowTime = getTimeStamp();
		var nonMatchList = [];
		var cnt = 0;
		<c:forEach var="one" items="${nonMatchList}">
			//nonMatchList[cnt] = '${one}'
			nonMatchList[cnt] = [];
			nonMatchList[cnt][0] = '${one.walk_date}';
			nonMatchList[cnt][1] = '${one.walk_start_time}';
			nonMatchList[cnt][2] = '${one.walk_end_time}';
			nonMatchList[cnt][3] = '${one.recruit_location}'
			nonMatchList[cnt][4] = '${one.dog_name}'  
			nonMatchList[cnt][5] = '${one.recruit_notices}' //주의사항
			nonMatchList[cnt][6] = '${one.dog_type}' //견종
			nonMatchList[cnt][7] = '${one.walking_id}' //walking 테이블 업데이트를 위한 것
			cnt += 1;
		</c:forEach>
		console.log("버튼 클릭 시: nonnonMatchList:"+nonMatchList[matchingIndex][0]);
		console.log("버튼 클릭 시: matchingIndex:"+matchingIndex);
		//mongodb에 insert
		var trans_object = {
       		'walker_id' : $("#walker_id").val(),
       		'mem_nickname' : $("#chat_id").val(),
       		'send_nickname' : $("#chat_id").val(),
       		'receive_nickname' : $("#walker_id").val(),
			'walk_date' : nonMatchList[matchingIndex][0],
			'walk_start_time' : nonMatchList[matchingIndex][1],
			'walk_end_time' : nonMatchList[matchingIndex][2],
			'recruit_location' : nonMatchList[matchingIndex][3],
			'dog_name' : nonMatchList[matchingIndex][4],
			'recruit_notices' : nonMatchList[matchingIndex][5],
       		'wk_profile_img1' : $('#wk_profile_img1').val(),
       		'dog_type' : nonMatchList[matchingIndex][6],
       		'chat_date' : NowTime,
       		'wk_id' : $('#wk_id').val(),
       		'walking_id' : nonMatchList[matchingIndex][7]
		
       	}
       	var trans_json = JSON.stringify(trans_object); //json으로 변환
       	
       	$.ajax({ //mongodb insert
       		url : "/aniwalk/owner/chatInsert.do",
       		type: 'post',
       		dataType : 'json',
       		data : trans_json,
       		contentType : 'application/json',
       		momeType : 'application/json',
       		success: function(retVal){
       			//alert("success"+retVal.val);
       		},
       		error : function(retVal,status,er){
       			//alert("error"+retVal);
       		}
       	});
		

		
		//소켓에 예약정보 보내기
		var msg = {
			type : "reservation", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : $("#walker_id").val(),
			walk_date : nonMatchList[matchingIndex][0],
			walk_start_time : nonMatchList[matchingIndex][1],
			walk_end_time : nonMatchList[matchingIndex][2],
			recruit_location : nonMatchList[matchingIndex][3],
			dog_name : nonMatchList[matchingIndex][4],
			recruit_notices : nonMatchList[matchingIndex][5],
			dog_type : nonMatchList[matchingIndex][6],
			chat_date : NowTime,
			
		};
		ws.send(JSON.stringify(msg));
		
		//내 채팅창에 추가
		var chatToInsert ='';
		chatToInsert += '<div class="reserve-box-my"><ul><li><label>날짜 : </label><span>'+nonMatchList[matchingIndex][0]+'</span></li>';
		chatToInsert += '<li><label>시간 : </label><span>'+nonMatchList[matchingIndex][1]+' ~ '+nonMatchList[matchingIndex][2]+'</span></li>';
		chatToInsert += '<li><label>장소 : </label><span>'+nonMatchList[matchingIndex][3]+'</span></li>';
		chatToInsert += '<li><label>반려견 : </label><span>'+nonMatchList[matchingIndex][4]+'('+nonMatchList[matchingIndex][6]+')</span></li>';
		chatToInsert += '<li><label>주의사항 : </label><div>'+nonMatchList[matchingIndex][5]+'</div></li></ul>';
		chatToInsert += '<button class="btn btn-primary" type="button">예약 정보 수정</button></div>';

		$("#messageWindow").append(chatToInsert)	
		
		//모달창 닫기
		
	}


</script>

<script type="text/javascript">
//채팅
	//현재시간
	function getTimeStamp() {
	   var d = new Date();
	   var s =
	     leadingZeros(d.getFullYear(), 4) + '-' +
	     leadingZeros(d.getMonth() + 1, 2) + '-' +
	     leadingZeros(d.getDate(), 2) + ' ' +
	
	     leadingZeros(d.getHours(), 2) + ':' +
	     leadingZeros(d.getMinutes(), 2) + ':' +
	     leadingZeros(d.getSeconds(), 2);
	
	   return s;
	 }   
     function leadingZeros(n, digits) {
    	   var zero = '';
    	   n = n.toString();

    	   if (n.length < digits) {
    	     for (i = 0; i < digits - n.length; i++)
    	       zero += '0';
    	   }
    	   return zero + n;
    	 }
	     
    var inputMessage = document.getElementById('inputMessage'); //메시지 내용
    var ws;
	var userid = $("#chat_id").val(); //파라미터로 넘겨서 설정할 (내) 아이디
    
	function connect() {
		//웹소켓 객체 생성하는 부분
		//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)

		//url 연결할 서버의 경로
		ws = new WebSocket('ws://localhost:8080/aniwalk/chat');	

		ws.onopen = function() {
			console.log('연결 생성');
			register();
		};
		ws.onmessage = function(e) {
			console.log('메시지 받음');
			var data = e.data;
			//alert("받은 메시지 : " + data);
			addMsg(data);
		};
		ws.onclose = function() {
			console.log('연결 끊김');
		};
	}
	
	//원래 채팅 메시지에 방금 받은 메시지 더해서 설정하기
	function addMsg(msg) { 
		var wk_profile_img1 = $('#wk_profile_img1').val();
		var NowTime = getTimeStamp();
        var message = event.data.split("|");
        var type = message[0];
        var target = $('#walker_id').val();
        var chatToInsert ='';
        
        if (content == "") {
            alert('채팅을 입력해주세요.');
        } else { 
        	
        	if(type == 'chat'){ //type이 reservation인 경우
        		var content = message[1];
            	var sender = message[2];
            	if(sender != $("#chat_id").val()){ //내가 보낸 메시지
            		//나
                	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
                	chatToInsert += '<li><div class="my-talk-content">'+content+'</div></li></ul></div>';
                	$("#messageWindow").append(chatToInsert)
            	}else{ //상대방
            		chatToInsert += '<div class="you">';
            		chatToInsert += '<img src="/walker/'+wk_profile_img1+'" class="img-circle" alt="">';
            		chatToInsert += '<ul><li><label>'+target+'</label></li><li><div>'+content+'</div><span>'+NowTime+'</span></li></ul></div>';
            		$("#messageWindow").append(chatToInsert)	
            	}
        	}else if(type=='accept'){ //타입이 수락인 경우
        		var chat_date =  message[2];
        		var walking_id = message[3];
        		
        		var move = "'/aniwalk/owner/activityList.do'";
        		chatToInsert += '<div class="you"><img src="/walker/${wk_profile_img1}" class="img-circle" alt="">';
    			chatToInsert += '<ul><li><label>'+target+'</label></li><li><div class="reserve-box-you">';
    			chatToInsert += '<label>프렌즈 '+target+'님이 산책 예약을 수락했습니다.</label>';
    			chatToInsert += '<button class="btn btn-primary" type="button" onclick="location.href='+move+'" >정보보기</button></div>';
    			chatToInsert += '<span style="position: relative; top: 40%;">'+chat_date+'</span></li></ul></div>';
    			$("#messageWindow").append(chatToInsert)
    			
        	}else if(type=='reject'){ //타입이 거절인 경우 
        		var chat_date =  message[2];
        		chatToInsert += '<div class="you"><img src="/walker/${wk_profile_img1}" class="img-circle" alt="">';
    			chatToInsert += '<ul><li><label>'+target+'</label></li><li><div class="reserve-box-you">';
    			chatToInsert += '<label>프렌즈 '+target+'님과 산책이 매칭되지 않았습니다.</label>';
    			chatToInsert += '</div>';
    			chatToInsert += '<span style="position: relative; top: 40%;">'+chat_date+'</span></li></ul></div>';
    			$("#messageWindow").append(chatToInsert)
        	}
        }
	}
	
	//메시지 수신을 위한 서버에 id 등록하기
	function register() { 
		var msg = {
			type : "register", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			userid : $("#chat_id").val()
		};
		ws.send(JSON.stringify(msg));
	}
 	
	//메시지를 보냈을 때
	function sendMsg() {
       if (inputMessage.value == "") {
        } else {	//내가 메시지 보냈을 때
        	var wk_profile_img1 = $('#wk_profile_img1').val();
        	var NowTime = getTimeStamp();
        
        	var chatToInsert ='';
        	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
        	chatToInsert += '<li><div class="my-talk-content">'+inputMessage.value+'</div></li></ul></div>';
        	$("#messageWindow").append(chatToInsert)
        	
        	var trans_object = {
        		'walker_id' : $("#walker_id").val(),
        		'mem_nickname' : $("#chat_id").val(),
        		'send_nickname' : $("#chat_id").val(),
        		'receive_nickname' : $("#walker_id").val(),
        		'chat_date' : NowTime,
        		'contents' : inputMessage.value,
        		'wk_profile_img1' : wk_profile_img1
        	}
        	var trans_json = JSON.stringify(trans_object); //json으로 변환
        	
        	$.ajax({ //mongodb insert
        		url : "/aniwalk/owner/chatInsert.do",
        		type: 'post',
        		dataType : 'json',
        		data : trans_json,
        		contentType : 'application/json',
        		momeType : 'application/json',
        		success: function(retVal){
        			//alert("success"+retVal.val);
        		},
        		error : function(retVal,status,er){
        			//alert("error"+retVal);
        		}
        	});

        }//else 
      	
		var msg = {
			type : "chat", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : $("#walker_id").val(),
			message : inputMessage.value
		};
		ws.send(JSON.stringify(msg));
		inputMessage.value="";
	};
	
	//페이지가 로딩되면 connect 실행
	$(function() {
		connect();
		$('#send').on("click", function() {
			sendMsg();
			
		})
	});


    
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
    
</script>


</body>
<style>
	.on-click{
		background: rgb(52, 152, 219);
		color: white;
	}
</style>
</html>