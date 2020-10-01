<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톡방</title>
	<link rel="stylesheet" type="text/css" href="../../static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2521c7cc3e67ced68e19182536406c54&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<div class="talk-content">
		<div class="reserve-btn">산책 예약하기</div>
		<div class="content-part">
			<!-- 여기 아래부터 톡글 시작 -->
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
			<div class="my">
				<span>톡한날짜</span>
				<div>톡내용</div>
			</div>
			<!-- 끝 -->
		</div>
	</div>
	<!-- 대화입력창 -->
	<form class="talk-inputForm">
		<label>
			<input type="text" class="form-control">
		</label>
		<button class="btn btn-primary">입력</button>
	</form>
	<div class="modal-bg hidden">
		<div class="modal-content" onclick="event.stopPropagation()">
			<button class="close" type="button">&times;</button>
			<div class="reserve-modal">
				<h3>매칭안된 모집글 리스트</h3>
				<div class="dont-match-list">

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="../../images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="../../images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="../../images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->

					<!-- 모집글 1개 -->
					<div class="list-item">
						<img src="../../images/mydog.jpg" class="img-rounded" alt="">
						<ul>
							<li>
								<label>날짜 : </label>
								<span>2020-09-30</span>
							</li>
							<li>
								<label>시간 : </label>
								<span>오후 1:30 ~ 오후 2:00 (30분)</span>
							</li>
							<li>
								<label>장소 : </label>
								<span>서울특별시 서초구 반포대로 13길 26</span>
							</li>
						</ul>
					</div>
					<!-- 끝 -->

				</div>
				<!-- 모집글 작성 버튼 -->
				<div class="new-recruit">
					<i class="far fa-plus-square"></i>
					<label>새로운 모집글 작성</label>
				</div>
				<!-- 예약, 취소 버튼 -->
				<div class="btn-line">
					<button class="btn btn-primary">예약하기</button>
					<button class="btn btn-default cancel-btn">취소</button>
				</div>
			</div>
		</div>
	</div>
<script>
	//모달창
	const reserveBtn = document.querySelector('.reserve-btn');
	const modalBg = document.querySelector('.modal-bg');
	const close = document.querySelector('.close');
	const cancelBtn = document.querySelector('.cancel-btn');

	const modalClose = function(){
		modalBg.classList.add('hidden');
	}

	reserveBtn.addEventListener('click',function(){
		modalBg.classList.remove('hidden');
	});

	modalBg.addEventListener('click',modalClose);
	close.addEventListener('click',modalClose);
	cancelBtn.addEventListener('click',modalClose);
</script>
<script>
	//매칭안된 모집글 클릭시 이벤트
	const listItem = document.querySelectorAll('.list-item');
	for(let i=0; i<listItem.length; i++) {
		listItem[i].addEventListener('click',function(){
			for(let j=0; j<listItem.length; j++){
				listItem[j].classList.remove('on-click');
			}
			listItem[i].classList.add('on-click');
		});
	}
</script>
</body>
<style>
	.on-click{
		background: rgb(52, 152, 219);
		color: white;
	}
</style>
</html>