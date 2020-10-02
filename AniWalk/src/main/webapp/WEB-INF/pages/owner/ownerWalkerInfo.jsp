<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워커정보</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="walker-info">
	<div class="info-top">
		<h4>프렌즈 프로필</h4>
	</div>
	<div class="info-content">
		<div class="info-box">
			<img class="img-rounded" src="/walker/${walkerInfo[0].wk_profile_img1}" alt="">
			<span class="glyphicon glyphicon-remove"></span>
			<ul>
				<li>
					<div>
						<div class="star-rating">
							<span style="width:30%"></span>
						</div>
					</div>
				</li>
				<li>
					<h4>짧은 자기소개</h4>
				</li>
				<li>
					<h3>${walkerInfo[0].wk_name}</h3>
				</li>
				<li>
					<ul>
						<li class="addr">${walkerInfo[0].wk_addr}</li>
						<li>이 밑부터는 자격증 적는란</li>
						<li>없으면 안써도되고</li>
						<li>있으면 4개까지 적을 수잇음</li>
					</ul>
				</li>
				<li>
					<button class="btn" type="submit">대화하기</button>
				</li>
			</ul>
		</div>

		<div class="part-title">
			<h4>산책 후기</h4>
			<hr width="80%" color="gray">
		</div>
		<div class="review-list">
			<div class="review-item">
				<img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
				<div class="review-right">
					<ul>
						<li class="bottom-margin">
							<div>
								<img class="img-circle" src="${pageContext.request.contextPath}/images/profile_test.png" alt="">
								<label>사용자닉네임</label>
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
								<span class="right">2020-09-25</span>
							</div>
						</li>
						<li>
							새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
							보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
							이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
						</li>
					</ul>
				</div>
			</div>

			<div class="review-item">
				<img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
				<div class="review-right">
					<ul>
						<li class="bottom-margin">
							<div>
								<img class="img-circle" src="${pageContext.request.contextPath}/images/profile_test.png" alt="">
								<label>사용자닉네임</label>
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
								<span class="right">2020-09-25</span>
							</div>
						</li>
						<li>
							새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
							보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
							이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
						</li>
					</ul>
				</div>
			</div>

			<div class="review-item">
				<img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
				<div class="review-right">
					<ul>
						<li class="bottom-margin">
							<div>
								<img class="img-circle" src="${pageContext.request.contextPath}/images/profile_test.png" alt="">
								<label>사용자닉네임</label>
								<div class="star-rating">
									<span style="width:30%"></span>
								</div>
								<label>(1.5)</label>
								<span class="right">2020-09-25</span>
							</div>
						</li>
						<li>
							새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다
							보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
							이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>