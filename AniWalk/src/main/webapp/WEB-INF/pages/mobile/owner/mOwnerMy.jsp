<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<title>오너 마이</title>

	<link rel="stylesheet" href="../../../static/css/mOwner.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- jQuery Mobile -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<link rel="stylesheet" href="themes/mobile.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />

	<!-- 스와이퍼 -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
</head>
<body>

<section id="page4" data-role="page">
	<header data-role="header" data-add-back-btn="true">
		<h1 onclick="location.href='mOwnerMain.jsp'">ANIWALK</h1>
		<a href="javascript:window.history.back();"><i class="fas fa-arrow-left"></i></a>
		<a href="mOwnerMy.jsp"><i class="fas fa-user"></i></a>
	</header>
	<div class="content" data-role="content">
		<h4>My</h4>
		<div class="my-info">
			<ul>
				<li>
					<label>포인트 : 209209 point</label>
					<button class="ui-corner-all">포인트 충전</button>
				</li>
				<li>
					<label>가입날짜 : 2020-10-13</label>
					<button class="ui-corner-all">개인정보수정</button>
				</li>
			</ul>
		</div>

		<h4 style="margin-top: 30px;">MyDogs</h4>
		<div class="mydogs-slider">
			<!-- Slider main container -->
			<div class="swiper-container">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
						<div class="swiper-slide">
							<!-- loop -->
							<div class="mydog-item">

								<div class="mydog-info-part">
									<div>
										<img class="img-rounded" src="../../../images/mydog.jpg" alt="">
										<div class="mydog-name">크림</div>
									</div>
									<ul>
										<li>
											<span>견종 : </span>
											<span>포메라니안</span>
										</li>
										<li>
											<span>생일 : </span>
											<span>2019년 11월 14일</span>
										</li>
										<li>
											<span>성격 : </span>
											<span class="text-area">
												성격은<br>
												br태그를 달고<br>
												나타내야한다
											</span>
										</li>
									</ul>
								</div>
							</div>
							<!-- loop end -->
						</div>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

			</div>
		</div>
		<div class="mydog-add">
			<i class="far fa-plus-square"></i>
			<label>반려견 추가</label>
		</div>

		<h4 style="margin-top: 20px;">Walking</h4>
		<div class="my-walking-list">

			<!-- loop -->
			<div class="form-group">
				<div class="walked-month">2020년 9월</div>
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
			</div>
			<!-- loop end -->
			<!-- loop -->
			<div class="form-group">
				<div class="walked-month">2020년 9월</div>
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
				<!-- inner loop -->
				<div class="walked-info">
					<img class="img-rounded" src="../../../images/moveInfo.png" alt="">
					<ul style="list-style: disc">
						<li>
							<span>09-24 (목요일)</span>
						</li>
						<li>
							<span>12:00 ~ 12:30</span>
						</li>
						<li>
							<span>30분 12초</span>
						</li>
						<li>
							<span>2.3km</span>
						</li>

					</ul>
				</div>
				<!-- inner loop end-->
			</div>
			<!-- loop end -->
		</div>


	</div>
	<div class="nav" data-role="navbar">
		<ul>
			<!-- 모집글리스트 -->
			<li><a href="mOwnerRecruitList.jsp"><i class="fas fa-clipboard-check"></i></a></li>
			<!-- 프렌즈 리스트 -->
			<li><a href="mOwnerWalkerList.jsp"><i class="fas fa-chalkboard-teacher"></i></a></li>
			<!-- 대화 리스트 -->
			<li><a href="mOwnerTalkList.jsp"><i class="fas fa-comment"></i></a></li>
			<!-- 산책정보 리스트 -->
			<li><a href="mOwnerActivityList.jsp"><i class="fas fa-dog"></i></a></li>
		</ul>
	</div>
</section>

<script>
	//슬라이더
	var swiper = new Swiper('.swiper-container', {
		pagination: {
			el: '.swiper-pagination',
		},
	});
</script>
</body>
</html>