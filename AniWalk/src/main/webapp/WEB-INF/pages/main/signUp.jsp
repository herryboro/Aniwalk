<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<body>
<div class="container register">
	<div class="register-left">
		<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">
		<p>
			Walk anywhere with your dog
		</p>
	</div>
	<div class="register-right">
		<h2>회원 정보 등록</h2>
		<form class="form-horizontal" method="post" action="/aniwalk/signIn.do" enctype="multipart/form-data">
		
			<div class="form-group">
				<label class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-6">
					<label>																				<!-- get방식을 받으려면  ${param.xx}를 사용-->
						<input class="form-control" type="text" placeholder="닉네임 입력" name="mem_nickname">
						<input class="form-control" type="hidden" name="kakao_id" value="${param.kakao_id}">
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">핸드폰번호</label>
				<div class="col-sm-6">
					<span>
						<input class="form-control" type="text" placeholder="핸드폰번호">
					</span>
					<button class="btn btn-default">인증번호 받기</button>
					<input class="form-control" type="text" placeholder="인증번호입력">
					<button class="btn btn-primary">인증하기</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">반려견 정보 등록</label>
				<div class="col-sm-6">
					<label>
						강아지 프로필: <input id="dogAdd" type="file" class="form-control" name="files">
						강아지 이름: <input id="dogAdd" type="text" class="form-control" name="dog_name">
						견종: <input id="dogAdd" type="text" class="form-control" name="dog_type">
						크기: <input id="dogAdd" type="text" class="form-control" name="dog_size">
						강아지 정보: <input id="dogAdd" type="text" class="form-control" name="dog_info">
					</label>
				</div>
			</div>
		
			<div id="dogList" class="form-group hidden">


			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox"> 개인정보 수집에 대한 동의
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
				</div>
			</div>
		</form>
	</div>
</div>


<script>
	const dogAddBtn = document.getElementById('dogAdd');
	const modalBg = document.querySelector('.modal-bg');

	removeModalHidden = () => {
		modalBg.classList.remove('hidden');
	}
	addModalHidden = () => {
		modalBg.classList.add('hidden');
	}

	dogAddBtn.addEventListener('click',removeModalHidden);
	modalBg.addEventListener('click',addModalHidden);
</script>
<script>
	const dogList = document.getElementById('dogList');

	let mydogList = [];
	addDog = function() {

		let dog_name = document.getElementsByName('dog_name')[0].value;
		let dog_type = document.getElementsByName('dog_type')[0].value;
		let dog_notice = document.getElementsByName('dog_notice')[0].value;
		let dog_images = document.getElementsByName('dog_images')[0].value;

		let mydog = {
			name: dog_name,
			type: dog_type,
			notice: dog_notice,
			images: dog_images
		}

		if (mydogList.length >= 0) {
			dogList.classList.remove('hidden');
		}

		const addmydog = `
			<div name="item" class="col-sm-offset-2 col-sm-10">
				<img src="../../images/main_logo.png" alt="" width="100px"; height="100px";>
				<ul>
					<li>이름 :` + mydog.name + `</li>
					<li>견종 :` + mydog.type + `</li>
					<li>주의사항 :` + mydog.notice + `</li>
				</ul>
			</div>
			`;


		console.log(mydog);
		mydogList.push(mydog);

		dogList.innerHTML += addmydog;

		console.log(mydogList);

		addModalHidden();
		const items = document.getElementsByName('item');
		for(let i=0; i<items.length; i++){
			items[i].classList.add('list-item');
		}
	}
</script>
</body>
<style>
	.list-item{
		display: flex;
		flex-wrap: nowrap;
		justify-content: center;
		align-items: center;
	}
</style>
<script>
$(document).ready(function(){
	$('footer').removeClass('absolute-position');

});
</script>
</html>