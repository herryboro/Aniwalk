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
		<div class="active-list">
			<img src="../../../images/ownerindex.png" alt="" class="img-rounded" style="width: 75%; background: rgba(52, 152, 219, 0.6)">
			<h5>오늘 123개의 산책일정이 있습니다.</h5>
			<div class="list-part">

				<!-- loop -->
				<ul class="list-item">
					<li class="title-part">
						<div class="matching-part">
							<img id="walkerImg" class="img-rounded" alt="" src="../../../images/applier.png">
							<i class="fas fa-heart"></i>
							<img id="dogImg" class="img-rounded" alt="" src="../../../images/mydog.jpg">
						</div>
						<div class="matching-text">
							<span class="text-primary">프렌즈이름</span>
							<span>님과 </span>
							<span class="text-success">반려견이름</span>
							<span>의 산책일정입니다.</span>
						</div>

					</li>
					<li class="info-part">
						<ol>
							<li>
								<span>시간 :  시작시간 ~ 종료시간 (분)</span>
							</li>
							<li>
								<span>시작장소 :  시작 장소 주소</span>
							</li>
						</ol>
					</li>
				</ul>
				<!-- loop end -->

				<!-- loop -->
				<ul class="list-item">
					<li class="title-part">
						<div class="matching-part">
							<img id="walkerImg" class="img-rounded" alt="" src="../../../images/applier.png">
							<i class="fas fa-heart"></i>
							<img id="dogImg" class="img-rounded" alt="" src="../../../images/mydog.jpg">
						</div>
						<div class="matching-text">
							<span class="text-primary">프렌즈이름</span>
							<span>님과 </span>
							<span class="text-success">반려견이름</span>
							<span>의 산책일정입니다.</span>
						</div>

					</li>
					<li class="info-part">
						<ol>
							<li>
								<span>시간 :  시작시간 ~ 종료시간 (분)</span>
							</li>
							<li>
								<span>시작장소 :  시작 장소 주소</span>
							</li>
						</ol>
					</li>
				</ul>
				<!-- loop end -->

				<!-- loop -->
				<ul class="list-item">
					<li class="title-part">
						<div class="matching-part">
							<img class="img-rounded" alt="" src="../../../images/applier.png">
							<i class="fas fa-heart"></i>
							<img class="img-rounded" alt="" src="../../../images/mydog.jpg">
						</div>
						<div class="matching-text">
							<span class="text-primary">프렌즈이름</span>
							<span>님과 </span>
							<span class="text-success">반려견이름</span>
							<span>의 산책일정입니다.</span>
						</div>

					</li>
					<li class="info-part">
						<ol>
							<li>
								<span>시간 :  시작시간 ~ 종료시간 (분)</span>
							</li>
							<li>
								<span>시작장소 :  시작 장소 주소</span>
							</li>
						</ol>
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