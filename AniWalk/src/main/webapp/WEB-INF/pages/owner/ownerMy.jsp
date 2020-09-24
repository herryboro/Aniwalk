<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../../static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
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
				<span>20200 point</span>
				<button class="btn btn-success" type="button">포인트 충전</button>
			</li>
			<li>
				<label>가입날짜 : </label>
				<span>2020-09-24</span>
			</li>
		</ul>
		<button class="btn btn-primary" type="button">개인정보수정</button>
	</section>


	<section class="mydogs">
		<div class="subtitle">
			<h4>반려견 정보</h4>
		</div>
		<div class="mydog-item">
			<div class="mydog-name">반려견이름</div>
			<img class="img-thumbnail" src="../../images/mydog.jpg" alt="">
			<ul>
				<li class="first">
					<label>견종</label>
					<span>포메라니안</span>
				</li>
				<li>
					<label>생일</label>
					<span>2019년 11월 14일</span>
				</li>
				<li>
					<label>성격</label>
					<span class="text-area">
						성격은<br>
						br태그를 달고<br>
						나타내야한다
					</span>
				</li>
			</ul>
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
				<img class="img-thumbnail" src="../../images/moveInfo.png" alt="">
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

</body>
</html>