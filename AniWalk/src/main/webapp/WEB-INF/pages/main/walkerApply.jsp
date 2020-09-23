<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈신청</title>
</head>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- js -->
	<script src="${pageContext.request.contextPath}/static/js/main.js"></script>

<body>
<div class="container">
	<h3>서비스약관동의</h3>
	<form id="applyForm1" class="walker-apply-form" method="post" action="/aniwalk/index.do">
		<ul class="terms">
			<li>
				<div>
					<i class="far fa-check-circle"></i>
					<span>전체동의</span>
				</div>
			</li>
			<li>
				<div>
					<i class="far fa-check-circle"></i>
					<span>[필수] 개인정보 수집 및 이용 동의</span>
				</div>
			</li>
			<li>
				<div>
					<i class="far fa-check-circle"></i>
					<span>[선택] 이벤트 정보 수신 동의</span>
				</div>
			</li>
		</ul>

		<button type="button" class="btn btn-primary auth-btn">휴대폰 인증하기</button>

		<ul class="apply-list userinfo">
			<li>
				<label>이름</label>
				<label><input class="form-control" type="text" placeholder="이름" required></label>
			</li>
			<li>
				<label>휴대폰번호</label>
				<label><input class="form-control" type="text" placeholder="휴대폰번호" required></label>
			</li>
			<li>
				<label>생년월일</label>
				<label><input class="form-control" type="text" placeholder="생년월일 6자리" required></label>
			</li>
			<li>
				<label>거주지 주소</label>
				<label><input class="form-control" type="text" placeholder="ex)서울시 서초구 00동 00호" required></label>
			</li>
			<li>
				<label>이메일 주소</label>
				<label><input class="form-control" type="text" placeholder="이메일 주소 입력" required></label>
			</li>
		</ul>

		<ul class="apply-list">
			<li>
				<h3>[필수] 활동하실 지역을 선택해 주세요</h3>
			</li>
			<li>
				<select class="form-control" required>
					<option>서울특별시</option>
					<option>경기도</option>
					<option>인천광역시</option>
				</select>
			</li>
			<li><!-- ajax로 구현.. ex)경기도 선택하면 하위 select는 고양시 일산서구-->
				<select class="form-control">
					<option></option>
				</select>
			</li>
		</ul>

		<ul class="apply-list">
			<li>
				<h3>[선택] 자격증 정보를 올려주세요</h3>
			</li>
			<li>
				<input class="form-control" type="file">
			</li>
			<li>
				<input class="form-control" type="file">
			</li>
			<li>
				<input class="form-control" type="file">
			</li>
			<li>
				<input class="form-control" type="file">
			</li>
		</ul>

		<button type="submit" class="btn btn-success">신청</button>
	</form>
</div>
</body>

</html>