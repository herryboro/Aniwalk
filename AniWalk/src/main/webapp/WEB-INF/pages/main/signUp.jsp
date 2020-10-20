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
<div class="container register" style="width: 100%; height: 100%;">
	<div class="register-left">
		<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">
		<p>
			Walk anywhere with your dog
		</p>
	</div>
	<div class="register-right">
		<form class="form-horizontal" name="signUpForm" method="post" action="/aniwalk/signIn.do" enctype="multipart/form-data" onsubmit="return signUpCheck()">
			<div class="form-group">
				<label class="col-sm-2">닉네임</label>
				<div class="col-sm-6">
					<label>																				<!-- get방식을 받으려면  ${param.xx}를 사용-->
						<input class="form-control" type="text" placeholder="닉네임 입력" name="mem_nickname" maxlength="10" required>
						<input class="form-control" type="hidden" name="kakao_id" value="${param.kakao_id}">
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">핸드폰번호</label>
				<div class="col-sm-10">
					<label>
						<input id='phoneNum' name='mem_phone' class="form-control" type="text"
							   placeholder="휴대폰번호 11자리를 -빼고 입력해주세요" required minlength="11" maxlength="11">
						<input id='auth-btn' type="button" class="btn btn-primary auth-btn" value="휴대폰 인증하기">
					</label>
					<!-- 핸드폰 인증 -->
					<input id='auth_num' type="hidden">
					<div class="form-group">
						<input type="hidden" id="authResult" name="auth_pass">
						<div class="unuse"></div>
						<div class="auth-part">
						</div>
					</div>
				</div>
			</div>




			<div class="form-group">
				<label class="col-sm-2">반려견 정보 등록</label>
			</div>
			<div class="form-group">
				<div class="col-sm-12">

				<div class="mydog-input" enctype="multipart/form-data" action="/aniwalk/owner/myPro.do" method="post">
					<div class="input-form">
						<div>
							<img id="clickImg" src="${pageContext.request.contextPath}/images/profile_test.png" alt="" class="img-rounded">
							<h5>&lt;대표사진설정&gt;</h5>
							<input id="uploadImg" type="file" class="hidden" name="files" required>
						</div>
						<div style="width: 40%">
							<ul>
								<li>
									<label>* 이름</label>
									<input type="text" class="form-control" name="dog_name" placeholder="강아지 이름을 입력해주세요" required>
								</li>
								<li>
									<label>* 견종</label>
									<select class="form-control" name="dog_type" required>
										<option value="" selected>견종</option>
										<option>포메라니안</option>
										<option>폼피츠</option>
										<option>사모예드</option>
										<option>진돗개</option>
										<option>푸들</option>
										<option>말티즈</option>
									</select>
								</li>
								<li>
									<label>생일</label>
									<input type="date" name="dog_birth" class="form-control" required>
								</li>
								<li>
									<label>특징</label>
								</li>
								<li>
									<label style="width: 100%">
										<textarea class="form-control" name="dog_info" cols="20" required></textarea>
									</label>
								</li>
							</ul>
						</div>
					</div>
				</div>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" required> 개인정보 수집에 대한 동의
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-12">
					<button type="submit" class="btn btn-primary">Sign in</button>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
<script>
$(document).ready(function(){
	$('footer').removeClass('absolute-position');

});
</script>

<script>
	const clickImg = document.getElementById('clickImg');
	const uploadImg = document.getElementById('uploadImg');

	clickImg.addEventListener('click',function (){
		uploadImg.click();
	});

	// 반려견 사진
	$('#uploadImg').on('change', function(e){
		var maxSize = 209715200;
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if(f.size >= maxSize) {
				alert("파일 사이즈 초과");
				$('#uploadImg').val('');
			} else if(!f.type.match("image.*")) {
				alert("사진과 동영상만 업로드 가능합니다!");
			} else {
				$('#clickImg').attr('src', URL.createObjectURL(e.target.files[0]));
				console.log(uploadImg.value);
			}
		});
	});
</script>

<script>
	//인증번호 관련
	const authBtn = document.querySelector('.auth-btn');
	authBtn.addEventListener('click',function(){
		$.ajax({
			url:"/aniwalk/walker/phoneCheck.do",
			type:"get",
			data:{
				"phoneNum" : $('#phoneNum').val()
			},
			success:function(data){
				if(data === ''){
					addPhoneAuthForm();
					if(addPhoneAuthForm()){
						$('#phoneNum').attr("readonly", "readonly");
						$('.auth-phone').empty();
						$('#auth-btn').val('인증번호 다시받기');
						$.ajax({
							url:"/aniwalk/walker/auth.do",
							type:"post",
							data:{
								"wk_phone" : $('#phoneNum').val()
							},
							success:function(data){
								var auth_num = $('#auth_num').val(data);
							},
							error:function(a,b,c){
							}
						})
					}
				}else{
					phoneUnusable();
				}
			},
			error:function(a,b,c){
			}
		})
	})
</script>
<script>

	function auth(){
		alert($('.auth').val());
		$.ajax({
			url:"/aniwalk/walker/authNum.do",
			type:"post",
			data:{
				"auth_num" : $('#auth_num').val(),
				"auth" : $('.auth').val()
			},
			success:function(data){
				if(data == 'pass'){
					$('#auth-btn').remove();
					$('.auth-part').empty();
					$('.auth-part').html('<input type="button" class="btn btn-primary" value="인증이 완료되었습니다."></label>');
					$('#authResult').val('auth-pass');
				} else {
					alert('인증번호가 틀렸습니다.');
				}
			},
			error:function(a,b,c){
			}
		})
	}
</script>
</html>