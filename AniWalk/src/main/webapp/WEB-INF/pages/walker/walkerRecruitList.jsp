<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집글리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<section class="walker-recruit-list">

	<!-- 검색 -->
	<div class="search-part">
		<form name="recruitSearchForm">
			<label>
				<input class="form-control" type="search" placeholder="이름 및 장소를 검색">
			</label>
			<button class="btn btn-primary" type="submit">검색</button>
		</form>
		<label class="detail-search">
			<i id="direction" class="fas fa-angle-double-down"></i>
			<span id="detailBtn">상세 검색 조건으로 검색</span>
		</label>
	</div>

	<!-- 모집글 리스트 -->
	<div class="list-part">
		<div class="row">

			<c:forEach var="recruit" items="${recruitList}">
				<div class="form-group col-md-3">
					<a href="/aniwalk/walker/"><img src="/owner/${recruit.dog_image}" alt="" class="img-rounded"></a>
					<ul>
						<li>
							<label>견종 : </label>
							<span>${recruit.dog_type}</span>
						</li>
						<li>
							<label>장소 : </label>
							<span>${recruit.recruit_location}</span>
						</li>
						<li>
							<label>시간 : </label>
							<span>${recruit.walk_start_time} - ${recruit.walk_end_time}</span>
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<!-- 상세 검색 조건 -->
<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<form>
			<ul>
				<li>
					<label>날짜</label>
				</li>
				<li>
					<label>
						<input type="date" class="form-control">
					</label>
				</li>
			</ul>
			<ul>
				<li>
					<label>시간</label>
				</li>
				<li>
					<label>
						<input type="time" class="form-control">
					</label>
				</li>
				<li> ~ </li>
				<li>
					<label>
						<input type="time" class="form-control">
					</label>
				</li>
			</ul>
			<ul>
				<li>
					<label>견종</label>
				</li>
				<li>
					<select class="form-control">
						<option selected>견종</option>
						<option>포메라니안</option>
						<option>요크셔테리어</option>
						<option>보더콜리</option>
						<option>골든리트리버</option>
					</select>
				</li>
			</ul>
			<ul>
				<li>
					<label>활동위치</label>
				</li>
				<li>
					<select class="form-control">
						<option selected>서울특별시 서초구</option>
						<option selected>서울특별시 강남구</option>
					</select>
				</li>
			</ul>
			<button class="btn btn-primary">검색</button>
		</form>
	</div>
</div>
<script>
	const detailBtn = document.getElementById('detailBtn');
	const modalBg = document.querySelector('.modal-bg');
	const direction = document.getElementById('direction');

	detailBtn.addEventListener('click',function (){
		modalBg.classList.toggle('hidden');
		direction.classList.remove('fa-angle-double-down');
		direction.classList.add('fa-angle-double-up');

		detailBtn.innerText = '검색창으로 검색';
	});

	modalBg.addEventListener('click',function(){
		modalBg.classList.add('hidden');
		direction.classList.remove('fa-angle-double-up');
		direction.classList.add('fa-angle-double-down');

		detailBtn.innerText = '상세 검색 조건으로 검색';
	});
</script>
</body>
</html>