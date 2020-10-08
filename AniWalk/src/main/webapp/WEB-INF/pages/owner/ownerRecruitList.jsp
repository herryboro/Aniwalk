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
</head>
<body>
<input type="hidden" value="${mem_nickname}" id="mem_nickname">
	<div class="recruit-list">
		<div class="list-part">
		
			<!-- 날짜별 모집글 리스트 -->
			<c:forEach var="walkingDto" items="${walkingDtos}" varStatus="mystatus">
				<c:choose>
				
					<c:when test="${mystatus.index==0} "> <!-- 맨 처음인 경우 -->
						<div class="subtitle">
						<label>${walkingDto.recruit_date} </label>
						<hr width="80%" color="gray"/>
						</div>
						<div class="list-group" >
							<div class="list-item">
								<img src="/owner/${walkingDto.dog_image}" alt="" class="img-rounded">
								<ul>
									<li>
										<label>견종 : </label>
										<span>${walkingDto.dog_type}</span>
									</li>
									<li>
										<label>장소 : </label>
										<span>${walkingDto.recruit_location}</span>
									</li>
									<li>
										<label>시간 : </label>
										<span>${walkingDto.walk_start_time} ~ ${walkingDto.walk_end_time}</span>
									</li>
								</ul>
							</div>
						</div>
					</c:when>
					<c:otherwise>	<!-- 맨 처음이 아닌 경우 -->
						<c:choose>
							<c:when test="${walkingDtos[mystatus.index-1].recruit_date==walkingDtos[mystatus.index].recruit_date}"> <!-- 위에 날짜와 같은 경우 -->
								<div class="list-group" >
								<div class="list-item">
									<img src="/owner/${walkingDto.dog_image}" alt="" class="img-rounded">
									<ul>
										<li>
											<label>견종 : </label>
											<span>${walkingDto.dog_type}</span>
										</li>
										<li>
											<label>장소 : </label>
											<span>${walkingDto.recruit_location}</span>
										</li>
										<li>
											<label>시간 : </label>
											<span>${walkingDto.walk_start_time} ~ ${walkingDto.walk_end_time}</span>
										</li>
									</ul>
								</div>
								</div>
							</c:when>
						
							<c:otherwise>	<!-- 위의 날짜와 다른 경우 -->
								
								<div class="subtitle">
									<label>${walkingDto.recruit_date}</label>
									<hr width="80%" color="gray"/>
								</div>
								<div class="list-group">
									<div class="list-item">
										<img src="/owner/${walkingDto.dog_image}" alt="" class="img-rounded">
										<ul>
											<li>
												<label>견종 : </label>
												<span>${walkingDto.dog_type}</span>
											</li>
											<li>
												<label>장소 : </label>
												<span>${walkingDto.recruit_location}</span>
											</li>
											<li>
												<label>시간 : </label>
												<span>${walkingDto.walk_start_time} ~ ${walkingDto.walk_end_time}</span>
											</li>
										</ul>
									</div>
								</div>
								
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</div>

		<div class="btn-part">
			<button class="btn btn-default" type="button" onclick="location.href='/aniwalk/owner/recruit.do'">모집글 작성하기</button>
		</div>

	</div>
	<div class="modal-bg hidden">
		<div class="modal-content" onclick="event.stopPropagation()">
			<button class="close" type="button">&times;</button>
			<form class="recruit-write">
				<h4>1.반려견 선택</h4>
				<section>
					<ol>
						<li>
							<img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
						</li>
						<li>
							<label>선택된 반려견</label>
						</li>
					</ol>
				</section>

				<section class="date-select">
					<div class="form-group">
						<div>
							<h4>2.일정 선택</h4>
							<i class="far fa-calendar-plus"></i>
						</div>
						<label>
							<input type="date" class="form-control">
						</label>
					</div>
					<div class="form-group">
						<div>
							<h4>3.시간 선택</h4>
							<i class="far fa-clock"></i>
						</div>
						<label>
							<input type="date" class="form-control">
						</label>
					</div>
				</section>

				<h4>4.주소선택</h4>
				<section>
					<div id="map" style="width:500px;height:400px;" class="kakao-map"></div>
					<label id="centerAddr">선택한 지역</label>
				</section>

				<h4>5.주의사항</h4>
				<section class="notice">
					<label>
						<textarea class="form-control" cols="200">
							써놓은 주의사항들
						</textarea>
					</label>
				</section>
				<div class="btn-line">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-danger">삭제하기</button>
				</div>
			</form>
		</div>
	</div>


<script>
	//모달창
	const listItems = document.querySelectorAll('.list-item');
	const modalBg = document.querySelector('.modal-bg');
	const close = document.querySelector('.close');

	const modalClose = function(){
		modalBg.classList.add('hidden');
	}

	for(let i=0; i<listItems.length; i++){
		listItems[i].addEventListener('click',function(){
			modalBg.classList.remove('hidden');
		});
	}

	modalBg.addEventListener('click',modalClose);
	close.addEventListener('click',modalClose);
</script>

<script>
	//카카오톡지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
				message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
				iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}

</script>


</body>
</html>