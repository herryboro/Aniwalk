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
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
</head>
<body>
	<div class="talk-content">
		<div class="reserve-btn">산책 예약하기</div>
		
		<div class="content-part" id="messageWindow">
			<c:forEach var="chatDto" items="${chatDtos}">
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
							<img src="${pageContext.request.contextPath}/images/applier.png" class="img-circle" alt="">
							<ul>
								<li>
									<label>${chatDto.walker_id}</label>
								</li>
								<li>
									<div>${chatDto.contents }</div>
									<span>${chatDto.chat_date}</span>
								</li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 여기 아래부터 톡글 시작 
			 상대방
			<div class="you">
				<img src="${pageContext.request.contextPath}/images/applier.png" class="img-circle" alt="">
				<ul>
					<li>
						<label>프렌즈네임</label>
					</li>
					<li>
						<div>톡내용톡내용톡내톡내용</div>
						<span>톡한날짜</span>
					</li>
				</ul>
			</div>

			<!-- 자신 
			<div class="my">
				<ul>
					<li style="min-width: 60px">
						<span>톡한날짜</span>
					</li>
					<li>
						<div class="my-talk-content">톡내용</div>
					</li>
				</ul>
			</div>
		
			<div class="reserve-box-my">
				<ul>
					<li>
						<label>날짜 : </label>
						<span>2020-09-21</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00 (30분)</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울특별시 서초구 방배로26길 13</span>
					</li>
					<li>
						<label>반려견 : </label>
						<span>크림(포메라니안)</span>
					</li>
					<li>
						<label>주의사항 : </label>
						<div>
							악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악<br>
							악악악악악악악악악악악악악악악악악악악악악악악악악<br>
							악악악악악악악악악악악악악악악악악악악악악악악
						</div>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">예약 정보 수정</button>
			</div>

		
			<div class="you">
				<img src="${pageContext.request.contextPath}/images/applier.png" class="img-circle" alt="">
				<ul>
					<li>
						<label>프렌즈네임</label>
					</li>
					<li>
						<div class="reserve-box-you">
							<label>프렌즈 이름 님이 산책 예약을 수락했습니다.</label>
							<button class="btn btn-primary">정보보기</button>
						</div>
						<span style="position: relative; top: 40%;">톡한날짜</span>
					</li>
				</ul>
			</div>
			 끝 -->
		</div>
	</div>

	<!-- 대화입력창 -->
	<form class="talk-inputForm">
	<input type="hidden" value="${mem_nickname}" id="chat_id" name="mem_nickname">
	<input type="hidden" value="${walker_id}" id="walker_id" name="walker_id">
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

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="${pageContext.request.contextPath}/images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="${pageContext.request.contextPath}/images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->


				</div>
				<!-- 모집글 작성 버튼 -->
				<div class="new-recruit">
					<i class="far fa-plus-square"></i>
					<label>새로운 모집글 작성</label>
				</div>
				<!-- 예약, 취소 버튼 -->
				<div class="btn-line">
					<button type="button" class="btn btn-primary">예약하기</button>
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

	const modalClose = function(){
		modalBg.classList.add('hidden');
	}

	reserveBtn.addEventListener('click',function(){
		modalBg.classList.remove('hidden');
	});

	modalBg.addEventListener('click',modalClose);
	close.addEventListener('click',modalClose);
	cancelBtn.addEventListener('click',modalClose);
</script>
<script>
	//매칭안된 모집글 클릭시 이벤트
	const listItem = document.querySelectorAll('.list-item');
	for(let i=0; i<listItem.length; i++) {
		listItem[i].addEventListener('click',function(){
			for(let j=0; j<listItem.length; j++){
				listItem[j].classList.remove('on-click');
			}
			listItem[i].classList.add('on-click');
		});
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
	     
    //var textarea = document.getElementById('messageWindow');
    var webSocket = new WebSocket("ws://localhost:8080/aniwalk/broadcasting");
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
        console.log("open");
    };
    webSocket.onmessage = function(event) {
    	console.log("onmessage");
    	onMessage(event)
        
    };
    function onMessage(event) {
    	var NowTime = getTimeStamp();
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        console.log(sender + content);
        var chatToInsert ='';
        if (content == "") {
            
        } else {
        	if(sender == $("#chat_id").val()){ //내가 보낸 메시지
        		//나
            	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
            	chatToInsert += '<li><div class="my-talk-content">'+content+'</div></li></ul></div>';
            	$("#messageWindow").append(chatToInsert)
        	}else{ //상대방
        		chatToInsert += '<div class="you">';
        		chatToInsert += '<img src="${pageContext.request.contextPath}/images/applier.png" class="img-circle" alt="">';
        		chatToInsert += '<ul><li><label>'+sender+'</label></li><li><div>'+content+'</div><span>'+NowTime+'</span></li></ul></div>';
        		$("#messageWindow").append(chatToInsert)	
        	}
        }
    }
    function onOpen(event) {
        $("#messageWindow").append("연결 성공");
    }
    function onError(event) {
        alert(event.data);
    }

   	$("#send").click(function(event){
   		console.log("onclick send()");
   		
   		send();
   	})

    function send() {
        if (inputMessage.value == "") {
        } else {	//내가 메시지 보냈을 때
        	var NowTime = getTimeStamp();
        	console.log('send()')
        	var chatToInsert ='';
        	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
        	chatToInsert += '<li><div class="my-talk-content">'+inputMessage.value+'</div></li></ul></div>';
        	$("#messageWindow").append(chatToInsert)
        	
        	var trans_object = {
        		'mem_nickname' : $("#chat_id").val(),
        		'walker_id' : $("#walker_id").val(),
        		'send_nickname' : $("#chat_id").val(),
        		'receive_nickname' : $("#walker_id").val(),
        		'chat_date' : NowTime,
        		'contents' : inputMessage.value
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
        			alert("success"+retVal.val);
        		},
        		error : function(retVal,status,er){
        			alert("error"+retVal);
        		}
        	});
        	
        	
        }//else 
        
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";

    }
    
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