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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	
</head>
<body>
<div class="talk-content">
	<div class="content-part" id="messageWindow">
		<c:forEach var="chatDto" items="${chatDtos}">
			<c:choose> 
				<c:when test="${chatDto.send_nickname eq walker_id}"> <!-- 내가 보낸 내용 -->
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
								<label>${chatDto.mem_nickname}</label>
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
	
		<!-- 
		<!-- 여기 아래부터 톡글 시작 
		<!-- 상대방 
		<div class="you">
			<img src="/aniwalk/images/applier.png" class="img-circle" alt="">
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

		<div class="you">
			<img src="/aniwalk/images/applier.png" class="img-circle" alt="">
			<ul>
				<li>
					<label>프렌즈네임</label>
				</li>
				<li>
					<div class="reserve-box-you">
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
							</li>
							<li>
								<div>
									악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악<br>
									악악악악악악악악악악악악악악악악악악악악악악악악악<br>
									악악악악악악악악악악악악악악악악악악악악악악악
								</div>
							</li>
						</ul>
						<div class="btn-line">
							<button class="btn btn-primary" type="button">매칭완료</button>
							<button class="btn btn-default" type="button">거절</button>
						</div>

					</div>
					<span style="position: relative; top: 40%;">톡한날짜</span>
				</li>
			</ul>
		</div>
		<!-- 끝 

		<!-- 자신 
		<div class="my">
			<ul>
				<li style="min-width: 60px">
					<span>톡한날짜</span>
				</li>
				<li>
					<div class="reserve-box-my">
						<label>[반려견주인] 님과 산책이 매칭되었습니다.</label>
						<button class="btn btn-primary">정보보기</button>
					</div>
				</li>
			</ul>
		</div>
 -->
	</div>
</div>

<!-- 대화입력창 -->
<form class="talk-inputForm">
<input type="hidden" value="${mem_nickname}" id="mem_nickname" name="mem_nickname">
<input type="hidden" value="${walker_id}" id="chat_id" name="walker_id">
	<label>
		<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
	</label>
	<button class="btn btn-primary" type="button" id="send">입력</button>
</form>

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
    //var webSocket = new WebSocket("ws://localhost:9928/aniwalk/broadcasting");
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
		var NowTime = getTimeStamp();
        var message = event.data.split("|");
        var sender = message[1];
        var content = message[0];
        console.log('제발제발제발제발----->'+sender+"내용:"+content);
        console.log(sender + content);
        var chatToInsert ='';
        if (content == "") {
            
        } else {
        	if(sender != $("#chat_id").val()){ //내가 보낸 메시지
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
        	var NowTime = getTimeStamp();
        	console.log('send()')
        	var chatToInsert ='';
        	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
        	chatToInsert += '<li><div class="my-talk-content">'+inputMessage.value+'</div></li></ul></div>';
        	$("#messageWindow").append(chatToInsert)
        	
        	var trans_object = {
        		'walker_id' : $("#chat_id").val(),
        		'mem_nickname' : $("#mem_nickname").val(),
        		'send_nickname' : $("#chat_id").val(),
        		'receive_nickname' : $("#mem_nickname").val(),
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
      	
		var msg = {
			type : "chat", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
			target : $("#mem_nickname").val(),
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

</html>