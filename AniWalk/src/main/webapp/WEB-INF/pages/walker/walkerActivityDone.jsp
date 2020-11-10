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
		</div>
		<div class="activing-input">
			<div class="mission-img">
			</div>
		</div>
	</div>
</div>
<input id='loc' type="hidden" name="mission_perform_location">
<input id='mission' type="hidden" name="mission_contents" value="start">
<input id='walking_id' type="hidden" name="walking_id" value="${walkingInfo.walking_id}">

<script src="${pageContext.request.contextPath}/static/js/map.js"></script>

<script>
const mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level: 3 // 지도의 확대 레벨
};
const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

if("${missionList.size()}" != 0){
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
	getWalkingLocation();
}	
</script>
</body>
</html>