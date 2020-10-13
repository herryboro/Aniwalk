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

<section data-role="page">
	<header data-role="header" data-add-back-btn="true">
		<h1 onclick="location.href='mOwnerMain.jsp'">ANIWALK</h1>
		<a href="javascript:window.history.back();"><i class="fas fa-arrow-left"></i></a>
		<a href="mOwnerMy.jsp"><i class="fas fa-user"></i></a>
	</header>
	<div class="content" data-role="content">
		<div class="recruit-list">
			<div class="list-part">
				<!-- loop -->
				<div class="subtitle">
					<label>2020-10-03</label>
				</div>
				<!-- inner loop -->
				<div class="list-item">
					<div>
						<img src="../../../images/mydog.jpg" alt="" class="img-rounded">
						<label>반려견 이름</label>
					</div>
					<ul>
						<li>
							<label>장소 : </label>
							<span>서울시 서초구 반포대로 13길 26</span>
						</li>
						<li>
							<label>시간 : </label>
							<span>오후 1:30 ~ 오후 2:00</span>
						</li>
						<li>
							<label>가격 : </label>
							<span>102320 포인트</span>
						</li>
					</ul>
				</div>
				<!-- inner loop end -->

				<!-- loop end-->
			</div>
			<button class="ui-btn-corner-all" type="button" onclick="location.href='mOwnerRecruit.jsp'">모집글 작성 <i class="far fa-edit"></i></button>
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