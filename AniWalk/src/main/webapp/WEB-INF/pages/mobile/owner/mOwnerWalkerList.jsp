<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

	<title>오너 로그인</title>

	<link rel="stylesheet" href="../../../static/css/mOwner.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- jQuery Mobile -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<link rel="stylesheet" href="themes/mobile.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
</head>
<body>

<section id="page4" data-role="page">
	<header data-role="header" data-add-back-btn="true">
		<h1 onclick="location.href='mOwnerMain.jsp'">ANIWALK</h1>
		<a href="javascript:window.history.back();"><i class="fas fa-arrow-left"></i></a>
		<a href="mOwnerMy.jsp"><i class="fas fa-user"></i></a>
	</header>
	<div class="content" data-role="content">
		<div class="walker-list">

			<div class="search-part">
				<form name="walkerListSearchForm">
					<label>
						<input class="form-control" type="search" placeholder="이름 및 장소를 검색">
					</label>
					<button class="ui-btn-corner-all" type="submit"><i class="fas fa-search"></i></button>
				</form>
			</div>


			<div class="list-part">

				<!-- loop -->
				<ul class="list-item">
					<li style="text-align: center">
						<img class="img-rounded" src="../../../images/profile_test.png" alt="">
						<h5>사람이름</h5>
					</li>
					<li>
						<ul>
							<li style="display: flex;">
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul style="font-size: 0.9rem">
									<li class="addr">주소적는란</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<!-- loop end -->
				<!-- loop -->
				<ul class="list-item">
					<li style="text-align: center">
						<img class="img-rounded" src="../../../images/profile_test.png" alt="">
						<h5>사람이름</h5>
					</li>
					<li>
						<ul>
							<li style="display: flex;">
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul style="font-size: 0.9rem">
									<li class="addr">주소적는란</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<!-- loop end -->
				<!-- loop -->
				<ul class="list-item">
					<li style="text-align: center">
						<img class="img-rounded" src="../../../images/profile_test.png" alt="">
						<h5>사람이름</h5>
					</li>
					<li>
						<ul>
							<li style="display: flex;">
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul style="font-size: 0.9rem">
									<li class="addr">주소적는란</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<!-- loop end -->
				<!-- loop -->
				<ul class="list-item">
					<li style="text-align: center">
						<img class="img-rounded" src="../../../images/profile_test.png" alt="">
						<h5>사람이름</h5>
					</li>
					<li>
						<ul>
							<li style="display: flex;">
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul style="font-size: 0.9rem">
									<li class="addr">주소적는란</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<!-- loop end -->
				<!-- loop -->
				<ul class="list-item">
					<li style="text-align: center">
						<img class="img-rounded" src="../../../images/profile_test.png" alt="">
						<h5>사람이름</h5>
					</li>
					<li>
						<ul>
							<li style="display: flex;">
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
							</li>
							<li>
								<ul style="font-size: 0.9rem">
									<li class="addr">주소적는란</li>
									<li>이 밑부터는 자격증 적는란</li>
									<li>없으면 안써도되고</li>
									<li>있으면 4개까지 적을 수잇음</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<!-- loop end -->

			</div>
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
</body>
</html>