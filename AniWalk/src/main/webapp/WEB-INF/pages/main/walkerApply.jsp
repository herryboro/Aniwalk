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
	<script src="/aniwalk/static/js/main.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>

    <!-- Add Firebase products that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
<body>
<div class="container">
	<h3>서비스약관동의</h3>
	<form id="applyForm1" class="walker-apply-form" method="POST" onsubmit="return applyCheck()"
		enctype="multipart/form-data" name='walker' action="/aniwalk/walker/apply.do">
		<ul class="terms">
			<li>
				<div class="all-agree">
					<i class="far fa-check-circle"></i>
					<span>전체동의</span>
				</div>
			</li>
			<li>
				<div class="essential-agree">
					<i class="far fa-check-circle"></i>
					<span>[필수] 개인정보 수집 및 이용 동의</span>
					<input id="essentialAgreeYn" type="hidden" required>
				</div>
				<span id="essential" class="glyphicon glyphicon-chevron-down"></span>
			</li>
			<li id="essential-content" class="hidden">
				1. 목적 : 지원자 개인 식별, 지원의사 확인, 입사전형의 진행, 고지사항 전달, 입사 지원자와의 원활한 의사소통, 지원이력 확인 및 면접 불합격자 재지원 제한
				2. 항목 : 아이디(이메일주소), 비밀번호, 이름, 생년월일, 휴대폰번호
				3. 보유기간 : 회원 탈퇴 시까지 보유 (단, 지원이력 정보는 일방향 암호화하여 탈퇴일로부터 1년간 보관 후 파기합니다.)
			</li>
			<li>
				<div class="choose-agree">
					<i class="far fa-check-circle"></i>
					<span>[선택] 이벤트 정보 수신 동의</span>
				</div>
				<span id="choose" class="glyphicon glyphicon-chevron-down"></span>
			</li>
			<li id="choose-content" class="hidden">
				이벤트/지원 프로모션 혜택 등 다양한 정보를 휴대전화로 받아보실 수 있습니다.
			</li>
		</ul>
		<input type="hidden" name='wk_event_agree' value='0'>
		

		<ul class="apply-list userinfo">
			<li>
				<label>이름</label>
				<label><input name='wk_name' class="form-control" type="text" placeholder="이름" required></label>
			</li>
			<li>
				<label>휴대폰번호</label>
				<label><input name='wk_phone' class="form-control" type="text" placeholder="휴대폰번호" required>
				<button type="button" class="btn btn-primary auth-btn")>휴대폰 인증하기</button></label>
				
			</li>
			<li>
				<label>생년월일</label>
				<label><input name='wk_birth' class="form-control" type="text" placeholder="생년월일 6자리" required></label>
			</li>
			<li>
				<label>거주지 주소</label>
				<label><input name='wk_addr' class="form-control" type="text" placeholder="ex)서울시 서초구 00동 00호" required></label>
			</li>
			<li>
				<label>이메일 주소</label>
				<label><input name='wk_email' class="form-control" type="text" placeholder="이메일 주소 입력" required></label>
			</li>
		</ul>
		
		<ul class="apply-list">
			<li style="display: flex; justify-content: center; align-items: center;">
				<h3>[필수] 프로필사진을 등록해주세요</h3><span>(1개 이상)</span>
			</li>
			<li>
				<input multiple="multiple" type=file class="form-control" name="profile_files[]" required>
			</li>
		</ul>

		<ul class="apply-list">
			<li>
				<h3>[필수] 활동하실 지역을 선택해 주세요</h3>
			</li>
			<li>
				<select id='area' class="form-control" required>
					<option>선택하세요</option>
				</select>
			</li>
			<li><!-- ajax로 구현.. ex)경기도 선택하면 하위 select는 고양시 일산서구-->
				<select id='city' name='wk_location' class="form-control">
					<option>선택하세요</option>
				</select>
			</li>
		</ul>

		<ul class="apply-list">
			<li>
				<h3>[선택] 자격증 정보를 올려주세요</h3>
			</li>
			<li>
				<input name="files" class="form-control" type="file">
			</li>
			<li>
				<input name="files" class="form-control" type="file">
			</li>
			<li>
				<input name="files" class="form-control" type="file">
			</li>
			<li>
				<input name="files" class="form-control" type="file">
			</li>
		</ul>

		<button type="submit" class="btn btn-success">신청</button>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var area = ["강원도", "경기도", "경상남도", "경상북도", "광주광역시", "대구광역시",
			"대전광역시", "부산광역시", "서울특별시", "세종특별자치시", "울산광역시", "인천광역시",
			"전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도"]
		for(var i=0; i<area.length; i++){
			$('#area').append("<option>" + area[i] + "</option>");
		}
		$('#area').attr('option')
		$('#area').on('change', function(){
			$.ajax({
				url:"/aniwalk/walker/region.do",
				type:"get",
				data:{
					"area" : $('#area').val()
				},
				success:function(data){
					$('#city').empty();
					$('#city').append("<option>선택하세요</option>");
					for(var i=0; i<data.length; i++){
						$('#city').append("<option>" + data[i] + "</option>");	
					}
				},
				error:function(a,b,c){
				}
			})
		})
	})

</script>
<script>
	const essentialAgree = document.querySelector('.essential-agree');
	const essentialClick = document.getElementById('essential');
	const essentialContent = document.getElementById('essential-content');

	const chooseAgree = document.querySelector('.choose-agree');
	const chooseClick = document.getElementById('choose');
	const chooseContent = document.getElementById('choose-content');

	ynCheck = () =>{
		if($('.essential-agree').hasClass('agree')){
			$('#essentialAgreeYn').val('Yes');
		}else {
			$('#essentialAgreeYn').val('');
		}
	}



	essentialAgree.addEventListener('click',function(){
		essentialAgree.classList.toggle('agree');
		ynCheck();
	});
	chooseAgree.addEventListener('click',function(){
		chooseAgree.classList.toggle('agree');
		ynCheck();
	});

	essentialClick.addEventListener('click',function(){
		essentialContent.classList.toggle('hidden');
		essentialClick.classList.toggle('glyphicon-chevron-down');
		essentialClick.classList.toggle('glyphicon-chevron-up');
	});
	chooseClick.addEventListener('click',function(){
		chooseContent.classList.toggle('hidden');
		chooseContent.classList.toggle('glyphicon-chevron-down');
		chooseContent.classList.toggle('glyphicon-chevron-up');
	});

	const allAgree = document.querySelector('.all-agree');
	allAgree.addEventListener('click',function (){
		essentialAgree.classList.toggle('agree');
		chooseAgree.classList.toggle('agree');
		ynCheck();
	});

</script>


<script>
$(document).ready(function(){
	$('footer').removeClass('absolute-position');

});

</script>

</body>
<style>
	.agree{
		color: blue;
	}
</style>
</html>