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
				<c:when test="${chatDto.walk_date ne null}"> <!-- 오너가 보낸 예약 신청 내역  -->
					<div class="you">
						<img src="/owner/${mem_profile_img}" class="img-circle" alt="">
						<ul>
							<li>
								<label>${chatDto.mem_nickname}</label>
							</li>
							<li>
								<div class="reserve-box-you">
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
										</li>
										<li>
											<div>
												${chatDto.recruit_notices }
											</div>
										</li>
									</ul>
									<div class="btn-line">
										<button class="btn btn-primary" type="button" id="btn_accept" onclick="matchingSuccess()">수락</button>
										<button class="btn btn-default" type="button" id="btn_reject" onclick="matchingFail()">거절</button>
									</div>
			
								</div>
								<span style="position: relative; top: 40%;">${chatDto.chat_date}</span>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${chatDto.reservation eq 'accept'}"> <!-- 예약 수락 -->
					<div class="my">
						<ul>
							<li style="min-width: 60px">
								<span>${chatDto.chat_date}</span>
							</li>
							<li>
								<div class="reserve-box-my">
									<label>[${chatDto.mem_nickname}]님과 산책이 매칭되었습니다.</label>
									<button class="btn btn-primary"  type="button" onclick="location.href='/aniwalk/walker/main.do'">정보보기</button>
								</div>
							</li>
						</ul>
					</div>
				</c:when>
				<c:when test="${chatDto.reservation eq 'reject'}"> <!-- 예약 거절 -->
					<div class="my">
						<ul>
							<li style="min-width: 60px">
								<span>${chatDto.chat_date}</span>
							</li>
							<li>
								<div class="reserve-box-my">
									<label>[${chatDto.mem_nickname}]님과 산책이 매칭되지 않았습니다.</label>
								</div>
							</li>
						</ul>
					</div>
				</c:when>
				<c:otherwise> <!-- 일반 채팅 -->
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
								<img src="/owner/${mem_profile_img}" class="img-circle" alt="">
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
				</c:otherwise>
			</c:choose>
	
		</c:forEach>
	</div>
</div>

<!-- 대화입력창 -->
<form class="talk-inputForm">
<input type="hidden" value="${mem_nickname}" id="mem_nickname" name="mem_nickname">
<input type="hidden" value="${walker_id}" id="chat_id" name="walker_id">
<input type="hidden" value="${mem_profile_img }" id="mem_profile_img" name="mem_profile_img">
	<label>
		<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
	</label>
	<button class="btn btn-primary" type="button" id="send">입력</button>
</form>

<script type="text/javascript">
//매칭 성공 시(수락버튼 클릭시)
function matchingSuccess(){
	//버튼 비활성화
	
	var NowTime = getTimeStamp();
	//walking 테이블 업데이트
	var walking_id = "";
	$.ajax({
		url: "/aniwalk/chat/walkingUpdate.do" ,
		type: "get",
		data:  {
					"walker_id" : $('#chat_id').val(),
					"mem_nickname" : $('#mem_nickname').val()
				},
		async: false ,
		success: function(data){ //익명으로 함수 생성
			
			walking_id = data;
			console.log("data 업데이트::"+walking_id);
			//mongodb에 내용 넣기 
			var trans_object = {
		  		'walker_id' : $("#chat_id").val(),
		  		'mem_nickname' : $("#mem_nickname").val(),
		  		'send_nickname' : $("#chat_id").val(),
		  		'receive_nickname' : $("#mem_nickname").val(),
		  		'chat_date' : NowTime,
		  		'walking_id' : walking_id,
		  		'reservation' : 'accept'
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
		   	
			//웹소켓으로 보내기 type=accept
		   	var msg = {
				type : "accept", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
				target : $("#mem_nickname").val(),
				walking_id : walking_id,
				chat_date : NowTime
				
			};
			ws.send(JSON.stringify(msg));
		  
			var move = "'/aniwalk/walker/main.do'";
			
			//채팅 내용 추가
			var chatToInsert ='';
			chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
			chatToInsert += '<li><div class="reserve-box-my"><label>['+$("#mem_nickname").val()+'] 님과 산책이 매칭되었습니다.</label>';
			chatToInsert += '<button class="btn btn-primary" type="button" onclick="location.href='+move+'">정보보기</button></div></li></ul></div>';

			$("#messageWindow").append(chatToInsert)
			
		},
		error: function(a,b,c){ //ajax 실패시 원인
			alert("에러"+c);
		}
	})
	
} //matchingSuccess함수

//매칭 거절 시
function matchingFail(){
	var NowTime = getTimeStamp();
	//버튼 비활성화
	
	var NowTime = getTimeStamp();
	//mongodb에 내용 넣기 
	var trans_object = {
  		'walker_id' : $("#chat_id").val(),
  		'mem_nickname' : $("#mem_nickname").val(),
  		'send_nickname' : $("#chat_id").val(),
  		'receive_nickname' : $("#mem_nickname").val(),
  		'chat_date' : NowTime,
  		'reservation' : 'reject'
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
	//웹소켓으로 보내기 type=reject
	var msg = {
		type : "reject", //메시지 구분하는 구분자 - 상대방 아이디와 메시지 포함해서 보냄
		target : $("#mem_nickname").val(),
		chat_date : NowTime
		
	};
	ws.send(JSON.stringify(msg));
	
	//채팅창에 내용 추가
	var chatToInsert ='';
	chatToInsert += '<div class="my"><ul><li style="min-width: 60px">';
	chatToInsert += '<span>톡한날짜</span></li><li><div class="reserve-box-my">';
	chatToInsert += '<label>['+$("#mem_nickname").val()+'] 님과의 산책 매칭이 취소 되었습니다.</label></div></li></ul></div>';
	$("#messageWindow").append(chatToInsert)	
	
} //matchingFail함수

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
		var mem_profile_img = $('#mem_profile_img').val();
		var NowTime = getTimeStamp();
        var message = event.data.split("|");
        var type = message[0];
        var target = $('#mem_nickname').val();
        
        var chatToInsert ='';
        if (content == "") {
            
        } else {
        	if(type=='reservation'){ //type이 reservation인 경우
        		var sender = message[1];
        		var date = message[2];
        		var start_time = message[3];
        		var end_time = message[4];
        		var location = message[5];
        		var dogName = message[6];
        		var notices = message[7];
        		var dogType = message[8];
        		var chatDate = message[9];
        		
        		//내 채팅창에 내용 추가
        		var chatToInsert ='';
        		
        		chatToInsert += '<div class="you"><img src="/owner/'+mem_profile_img+'" class="img-circle" alt=""><ul>';
        		chatToInsert += '<li><label>'+$('#mem_nickname').val()+'</label></li>';
        		chatToInsert += '<li><div class="reserve-box-you"><ul><li><label>날짜 : </label><span>'+date+'</span></li>';
        		chatToInsert += '<li><label>시간 : </label><span>'+start_time+' ~ '+end_time+'</span></li>';
        		chatToInsert += '<li><label>장소 : </label><span>'+location+'</span></li>';
        		chatToInsert += '<li><label>반려견 : </label><span>'+dogName+'('+dogType+')</span></li>';
        		chatToInsert += '<li><label>주의사항 : </label></li><li><div>'+notices+'</div></li></ul>';
        		chatToInsert += '<div class="btn-line"><button class="btn btn-primary" type="button" id="btn_accept" onclick="matchingSuccess()">수락</button>';
        		chatToInsert += '<button class="btn btn-default" type="button" id="btn_reject" onclick="matchingFail()">거절</button></div></div>';
        		chatToInsert += '<span style="position: relative; top: 40%;">'+chatDate+'</span></li></ul></div>';
        		
        		$("#messageWindow").append(chatToInsert)
        		//거절 버튼 비활성화, 수락 버튼 매칭완료로 변경

        	}else if(type =='chat'){ //type이 chat인 경우 
        		var content = message[1];
        		var sender = message[2];
     
        		if(sender != $("#chat_id").val()){ //내가 보낸 메시지
            		//나
                	chatToInsert += '<div class="my"><ul><li style="min-width: 60px"><span>'+NowTime+'</span></li>';
                	chatToInsert += '<li><div class="my-talk-content">'+content+'</div></li></ul></div>';
                	$("#messageWindow").append(chatToInsert)
            	}else{ //상대방
            		chatToInsert += '<div class="you">';
            		chatToInsert += '<img src="/owner/'+mem_profile_img+'" class="img-circle" alt="">';
            		chatToInsert += '<ul><li><label>'+target+'</label></li><li><div>'+content+'</div><span>'+NowTime+'</span></li></ul></div>';
            		$("#messageWindow").append(chatToInsert)	
            	}
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
        		'contents' : inputMessage.value,
        		'mem_profile_img' : $('#mem_profile_img').val()
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