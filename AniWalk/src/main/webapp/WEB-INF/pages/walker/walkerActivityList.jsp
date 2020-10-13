<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 산책리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<div class="walker-active-list">
		<div class="today-part">
			<label>오늘 <span class="color-blue">3번</span>의 산책이 <span class="color-purple">예약</span>되어있습니다.</label>
		</div>
		<div class="row list-part">
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button" onclick="location.href='/aniwalk/walker/activiting.do'">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->
			<!-- item 시작 -->
			<div class="col-md-3 list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li>
						<label>견종 : </label>
						<span>포메라니안</span>
					</li>
					<li>
						<label>장소 : </label>
						<span>서울시 서초구 반포대로 13길 26</span>
					</li>
					<li>
						<label>시간 : </label>
						<span>오후 1:30 ~ 오후 2:00</span>
					</li>
					<li>
						<label>주의사항</label>
					</li>
					<li>
						1. 다른 강아지 무서워하니 조심해주세요<br>
						2. 사람들이 막 만지는게 하지말아주세요<br>
						3. 풀 좋아하니까 시작전에 진드기 방지 스프레이 뿌리고 산책해주세요<br>
					</li>
				</ul>
				<button class="btn btn-primary" type="button">산책시작</button>
			</div>
			<!-- item 끝 -->

		</div>



	</div>
	
</body>
</html>