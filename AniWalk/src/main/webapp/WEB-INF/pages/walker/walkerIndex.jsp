<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 첫화면</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="../../static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="walker-index">
		<img src="../../images/main_logo.png" alt="">
		<button class="btn btn-primary">활동 시작하기</button>
	</div>
	<div class="walker-login hidden">
		<form>
			<img src="../../images/main_logo.png" alt="">
			<ul>
				<li>
					<label>아이디</label>
					<label>
						<input type="text" class="form-control">
					</label>
				</li>
				<li>
					<label>비밀번호</label>
					<label>
						<input type="password" class="form-control">
					</label>
				</li>
				<li class="text-center">
					<div>
						<i class="fas fa-angle-double-right"></i>
						<span>비밀번호 찾기</span>
					</div>
				</li>
				<li>
					<button type="submit" class="btn">로그인</button>
				</li>
			</ul>
		</form>

	</div>
</body>
<script>
	const indexDiv = document.querySelector('.walker-index');
	const loginDiv = document.querySelector('.walker-login');
	const btn = document.querySelector('.btn-primary');

	btn.addEventListener('click',function(){
		indexDiv.classList.add('hidden');
		loginDiv.classList.remove('hidden');

	});
</script>
</html>