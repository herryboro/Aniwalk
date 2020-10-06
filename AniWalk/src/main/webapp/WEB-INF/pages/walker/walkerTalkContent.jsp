<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>톡방</title>
	<link rel="stylesheet" type="text/css" href="../../static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
</head>
<body>
<div class="talk-content">
	<div class="content-part">
		<!-- 여기 아래부터 톡글 시작 -->
		<!-- 상대방 -->
		<div class="you">
			<img src="../../images/applier.png" class="img-circle" alt="">
			<ul>
				<li>
					<label>프렌즈네임</label>
				</li>
				<li>
					<div>톡내용톡내용톡내톡내용</div>
					<span>톡한날짜</span>
				</li>
			</ul>
		</div>

		<div class="you">
			<img src="../../images/applier.png" class="img-circle" alt="">
			<ul>
				<li>
					<label>프렌즈네임</label>
				</li>
				<li>
					<div class="reserve-box-you">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-21</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 방배로26길 13</span>
							</li>
							<li>
								<label>반려견 : </label>
								<span>크림(포메라니안)</span>
							</li>
							<li>
								<label>주의사항 : </label>
							</li>
							<li>
								<div>
									악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악악<br>
									악악악악악악악악악악악악악악악악악악악악악악악악악<br>
									악악악악악악악악악악악악악악악악악악악악악악악
								</div>
							</li>
						</ul>
						<div class="btn-line">
							<button class="btn btn-primary" type="button">매칭완료</button>
							<button class="btn btn-default" type="button">거절</button>
						</div>

					</div>
					<span style="position: relative; top: 40%;">톡한날짜</span>
				</li>
			</ul>
		</div>
		<!-- 끝 -->

		<!-- 자신 -->
		<div class="my">
			<ul>
				<li style="min-width: 60px">
					<span>톡한날짜</span>
				</li>
				<li>
					<div class="reserve-box-my">
						<label>[반려견주인] 님과 산책이 매칭되었습니다.</label>
						<button class="btn btn-primary">정보보기</button>
					</div>
				</li>
			</ul>
		</div>

	</div>
</div>

<!-- 대화입력창 -->
<form class="talk-inputForm">
	<label>
		<input type="text" class="form-control">
	</label>
	<button class="btn btn-primary">입력</button>
</form>

</html>