<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<!-- 스와이퍼 -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">	
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
</head>
<body>
<div class="my-page">
	<section class="my-part">
		<div class="subtitle">
			<h4>My</h4>
		</div>
		<ul>
			<li>
				<label>포인트 : </label>
				<span>${joinDtos.get(0).getMem_point()} point</span>
				<button class="btn btn-success" type="button">포인트 충전</button>
			</li>
			<li>
				<label>가입날짜 : </label>
				<span><fmt:formatDate value="${joinDtos.get(0).getMem_join_date()}" pattern="yyyy-MM-dd"/></span>
			</li>
		</ul>
		<button class="btn btn-primary" type="button">개인정보수정</button>
	</section>


	<section class="mydogs">
		<div class="subtitle">
			<h4>반려견 정보</h4>
		</div>
		<div class="mydogs-slider">
			<!-- Slider main container -->
			<div class="swiper-container">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<c:forEach items="${joinDtos}" var="joinDto">
					<div class="swiper-slide">
						<div class="mydog-item">
							<div class="mydog-name">${joinDto.dog_name}</div>
							<div class="mydog-info-part">
								<img class="img-thumbnail" src="/owner/${joinDto.dog_image}" alt="">
								<ul>
									<li class="first">
										<label>견종</label>
										<span>${joinDto.dog_type}</span>
									</li>
									<li>
										<label>생일</label>
										<span>${joinDto.dog_birth}</span>
									</li>
									<li>
										<label>정보</label>
										<span class="text-area">
											${joinDto.dog_info}
										</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
		
		
		
		
		<div class="mydog-add">
			<i class="far fa-plus-square"></i>
			<label>반려견 추가</label>
		</div>
	</section>

	<section class="my-walked">
		<div class="subtitle">
			<h4>산책내역</h4>
		</div>
		<div class="form-group">
			<div class="walked-month">2020년 9월</div>
			<div class="walked-info">
				<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/moveInfo.png" alt="">
				<ul>
					<li>
						<label>날짜</label>
						<span>09-24 목요일 12:00</span>
					</li>
					<li>
						<label>거리</label>
						<span>2.3km</span>
					</li>
					<li>
						<label>산책시간</label>
						<span>30분 12초</span>
					</li>
				</ul>
			</div>
		</div>
	</section>
</div>
<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<button class="close-btn" type="button">&times;</button>
		<form class="mydog-input">
			<div class="input-form">
				<div>
					<img id="clickImg" src="${pageContext.request.contextPath}/images/profile_test.png" alt="" class="img-rounded">
					<h5>&lt;대표사진설정&gt;</h5>
					<input id="uploadImg" type="file" class="hidden">
				</div>
				<div style="width: 40%">
					<ul>
						<li>
							<label>* 이름</label>
							<input type="text" class="form-control" placeholder="강아지 이름을 입력해주세요">
						</li>
						<li>
							<label>* 견종</label>
							<select class="form-control">
								<option value="" selected>견종</option>
								<option>포메라니안</option>
								<option>폼피츠</option>
								<option>사모예드</option>
							</select>
						</li>
						<li>
							<label>생일</label>
							<input type="date" class="form-control">
						</li>
						<li>
							<label>특징</label>
						</li>
						<li>
							<label style="width: 100%">
								<textarea class="form-control" cols="20"></textarea>
							</label>
						</li>
					</ul>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
</div>
<script>
	const mydogAdd = document.querySelector('.mydog-add');
	const modalBg = document.querySelector('.modal-bg');
	const closeBtn = document.querySelector('.close-btn');
	mydogAdd.addEventListener('click',function(){
		modalBg.classList.remove('hidden');
	});
	modalBg.addEventListener('click',function (){
		modalBg.classList.add('hidden');
	});
	closeBtn.addEventListener('click',function (){
		modalBg.classList.add('hidden');
	});
</script>
<script>
	const clickImg = document.getElementById('clickImg');
	const uploadImg = document.getElementById('uploadImg');

	clickImg.addEventListener('click',function (){
		uploadImg.click();
	});

	// 반려견 사진
	$('#uploadImg').on('change', function(e){
		var maxSize = 209715200;
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if(f.size >= maxSize) {
				alert("파일 사이즈 초과");
				$('#uploadImg').val('');
			} else if(!f.type.match("image.*")) {
				alert("사진과 동영상만 업로드 가능합니다!");
			} else {
				$('#clickImg').attr('src', URL.createObjectURL(e.target.files[0]));
				console.log(uploadImg.value);
			}
		});
	});
</script>
<script>
//슬라이더
	var swiper = new Swiper('.swiper-container', {
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
</script>
</body>
</html>