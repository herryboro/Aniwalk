<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집글리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>

	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.7.2.js"></script>

</head>
<body>
<input type="hidden" value="${mem_nickname}" id="mem_nickname">
	
		<div class="list-part">
		<input type="hidden" value="${walkingDtos}" id="test" name="test">
			<!-- 날짜별 모집글 리스트 -->
			<c:forEach var="walkingDto" items="${walkingDtos}" >
				<div class="list-item">
					<img src="/owner/${walkingDto.dog_image}" alt="" class="img-rounded">
					<ul>
						<li>
							<label>견종 :</label>
							<span>${walkingDto.dog_type}</span>
						</li>
						<li>
							<label>장소 : </label>
							<span>${walkingDto.recruit_location}</span>
						</li>
						<li>
							<label>날짜 : </label>
							<span>${walkingDto.walk_date.replace('00:00:00','')}</span>
						</li>
						<li>
							<label>시간 : </label>
							<span>${walkingDto.walk_start_time} ~ ${walkingDto.walk_end_time}</span>
						</li>
						<li>
							<label>포인트 : </label>
							<span>${walkingDto.walking_point}</span>
						</li>
						<li>
							<label>모집글 올린 날짜 : </label>
							<span>${walkingDto.recruit_date}</span>
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>

		<div class="btn-part">
			<button class="btn btn-default" type="button" onclick="location.href='/aniwalk/owner/recruit.do'">모집글 작성하기</button>
		</div>

	
	<div class="modal-bg hidden">
		<div class="modal-content " onclick="event.stopPropagation()" style="flex-direction: column; justify-content: flex-start">
			<button class="close close-btn" type="button">&times;</button>
			<div class="subtitle">
				<h4>신청자 리스트</h4>
			</div>
			<div class="recruit-walker-list" id="list">
				
			</div>
		</div>
	</div>


<script>
	//모달창
	const listItems = document.querySelectorAll('.list-item');
	const modalBg = document.querySelector('.modal-bg');
	const closeBtn = document.querySelector('.close-btn');

	const modalClose = function(){
		modalBg.classList.add('hidden');
	}
	//walking_id 받아오기
	var i = 0;
	var walkingList = new Array();
	<c:forEach items="${walkingDtos}" var="dto">
		walkingList[i] = "${dto.walking_id}";
		i+=1;
	</c:forEach>
	console.log("리스트====>"+walkingList[0]+walkingList[1]);
	
	for(let i=0; i<listItems.length; i++){
		
		listItems[i].addEventListener('click',function(){
			
			modalBg.classList.remove('hidden');
			console.log("i====>"+i);
			
			var walking_id = walkingList[i];
			console.log('여기여기여기'+walking_id);
			

			$.ajax({
				url: "/aniwalk/walking/ajax_applyList.do" ,
				type: "get",
				data:  {
							"walking_id" : walking_id
						},
				success: function(data){ //익명으로 함수 생성
					var add='';
					var move = "location.href='/aniwalk/walking/matching.do?match_wk_id=" ; 
					var end ="'";
					$('#list').empty();
					for (var i=0; i<data.length; i++){
						var certiList = data[i].wk_certificate_list.split('/');
						add += '<div class="list-item"><img src="/walker/'+data[i].wk_profile_img1+'" alt="" class="img-rounded">' ; 
						add += '<div class="right-part"><ul><li><div><div class="star-rating"><span style="width:30%"></span>';
						add += '</div></div></li><li><h4>'+data[i].wk_intro+'</h4></li><li><h3>'+data[i].wk_name+'</h3></li>';
						add += '<li><ul><li class="addr">'+data[i].wk_addr+'</li>';
						for(var j=0; j<certiList.length-1;j++){
							add += '<li>'+certiList[j]+'</li>';	
						}
						add += '</ul></li><li><button class="btn btn-primary" type="button" onclick="'+move+data[i].apply_wk_id+'&walking_id='+walking_id+end+'">매칭하기</button></li></ul></div></div>';
					}
					$('#list').empty();
					$('#list').append(add);
					
		
				},
				error: function(a,b,c){ //ajax 실패시 원인
					alert("에러"+c);
				}
			})

		});
	}
	modalBg.addEventListener('click',modalClose);
	closeBtn.addEventListener('click',modalClose);
</script>



</body>
</html>