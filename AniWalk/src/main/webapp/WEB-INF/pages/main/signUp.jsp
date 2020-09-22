<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="../../static/css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- js -->
	<script src="../../static/js/main.js"></script>

<body>
<div class="container register">
	<div class="register-left">
		<img src="../../images/main_logo.png" alt="">
		<p>
			Walk anywhere with your dog
		</p>
	</div>
	<div class="register-right">
		<h2>회원 정보 등록</h2>
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-6">
					<label>
						<input class="form-control" type="text" placeholder="닉네임 입력">
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
				<div class="col-sm-offset-2 col-sm-10">
					<button id="dogAdd" type="button" class="btn btn-success">반려견 등록</button>
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

<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<form>
			<div class="addDog">
				<input class="form-control" type="file" name="dog_images" placeholder="강아지사진들">
				<label>
					<input class="form-control" type="text" name="dog_name" placeholder="강아지이름">
				</label>
				<select name="dog_type">
					<option selected>강아지 종류들 어디서 가져올거얌</option>
				</select>
				<label>
					<textarea class="form-control" name="dog_notice"></textarea>
				</label>
				<div>
					<button type="reset" class="btn btn-success" onclick="addDog()">등록</button>
					<button type="button" class="btn btn-danger" onclick="addModalHidden()">취소</button>
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

</html>