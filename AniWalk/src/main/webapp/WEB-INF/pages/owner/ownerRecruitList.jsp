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
										<label>날짜 : </label>
										<span>${walkingDto.recruit_date}</span>
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
										<label>날짜 : </label>
											<span>${walkingDto.recruit_date}</span>
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
												<label>날짜 : </label>
													<span>${walkingDto.recruit_date}</span>
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



</body>
</html>