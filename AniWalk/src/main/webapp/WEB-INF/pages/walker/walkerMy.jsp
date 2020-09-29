<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 마이페이지</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<section class="walker-my">

		<div class="subtitle">
			<h4>MY</h4>
			<hr width="80%" color="gray"/>
		</div>
		<div class="info-part">
			<img class="img-rounded" src="${pageContext.request.contextPath}/images/applier.png" alt="">
			<table>
				<tr>
					<th>활동지역</th>
					<td>${walkerDto.wk_location}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${walkerDto.wk_point} point</td>
					<td>
						<button class="btn btn-default" type="button">포인트 사용</button>
					</td>
				</tr>
				<tr>
					<th>활동시작</th>
					<td>${walkerDto.activity_start_date}</td>
				</tr>
				<tr>
					<th colspan="3">
						<button id="infoUpdate" class="btn btn-primary" type="button">개인정보수정</button>
					</th>
				</tr>
			</table>
		</div>

		<div class="subtitle">
			<h4>산책후기</h4>
			<hr width="80%" color="gray"/>
		</div>
		<div class="review-part">
			<div class="review-score">
				<h3>평점</h3>
				<div class="star-rating">
					<span style="width:30%"></span>
				</div>
				<span>4.0</span>
			</div>

			<div class="list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li class="bottom-margin">
						<img src="${pageContext.request.contextPath}/images/profile_test.png" alt="" class="img-circle">
						<label>반려견주인 닉네임</label>
						<div class="star-rating">
							<span style="width:30%"></span>
						</div>
						<span class="right">2020-09-27</span>
					</li>
					<li>
						새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
						보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
						이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
					</li>
				</ul>
			</div>

			<div class="list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li class="bottom-margin">
						<img src="${pageContext.request.contextPath}/images/profile_test.png" alt="" class="img-circle">
						<label>반려견주인 닉네임</label>
						<div class="star-rating">
							<span style="width:30%"></span>
						</div>
						<span class="right">2020-09-27</span>
					</li>
					<li>
						새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
						보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
						이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
					</li>
				</ul>
			</div>

			<div class="list-item">
				<img src="${pageContext.request.contextPath}/images/mydog.jpg" alt="" class="img-rounded">
				<ul>
					<li class="bottom-margin">
						<img src="${pageContext.request.contextPath}/images/profile_test.png" alt="" class="img-circle">
						<label>반려견주인 닉네임</label>
						<div class="star-rating">
							<span style="width:30%"></span>
						</div>
						<span class="right">2020-09-27</span>
					</li>
					<li>
						새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
						보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
						이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
					</li>
				</ul>
			</div>
		</div>
	</section>

<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<form class="password-field" method="post" >
			<h3>개인정보수정</h3>
			<div>
				<label>비밀번호</label>
				<label class="input-label">
					<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" id="pw_check">
				</label>
			</div>
			<button type="button" class="btn btn-primary" onclick="check()">비밀번호 입력</button>
		</form>
	</div>
</div>

	<script>
		const infoUpdate = document.getElementById('infoUpdate');
		const modalBg = document.querySelector('.modal-bg');

		infoUpdate.addEventListener('click',function (){
			modalBg.classList.remove('hidden');
		});

		modalBg.addEventListener('click',function(){
			modalBg.classList.add('hidden');
		});
		
		function check(){
			var wk_pw = "${walkerDto.wk_pw}";
			console.log("wk_pw:"+wk_pw);
			var pw = $('#pw').val();
			console.log("pw:"+pw);
			if(wk_pw!=pw){
				alert("비밀번호가 일치하지 않습니다.");
				$('#pw').val("");
			}else{
				location.href="myInfo.do";
			}
		}
		
	</script>
</body>
</html>