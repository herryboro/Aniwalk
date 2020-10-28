<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 첫화면</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="walker-index">
		<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">
		<button class="btn btn-primary">활동 시작하기</button>
	</div>
	<div class="walker-login hidden">
		<form onkeydown="return captureReturnKey(event)">
			<img src="${pageContext.request.contextPath}/images/main_logo.png" alt="">
			<ul>
				<li>
					<h5>아이디</h5>
					<label>
						<input type="text" class="form-control" id="walker_id">
					</label>
				</li>
				<li>
					<h5>비밀번호</h5>
					<label>
						<input type="password" class="form-control" id="wk_pw">
					</label>
				</li>
				<li class="text-center">
					<div>
						<i class="fas fa-angle-double-right"></i>
						<span>비밀번호 찾기</span>
					</div>
				</li>
				<li>
					<button type="button" class="btn" id="loginbt">로그인</button>
				</li>
			</ul>
		</form>

	</div>
</body>
<script>
	const indexDiv = document.querySelector('.walker-index');
	const loginDiv = document.querySelector('.walker-login');
	const btn = document.querySelector('.btn-primary');
	
	const captureReturnKey = function (e) { 
	    if(e.keyCode == 13 && e.srcElement.type != 'input') 
	        return false; 
	}
	
	btn.addEventListener('click',function(){
		indexDiv.classList.add('hidden');
		loginDiv.classList.remove('hidden');

	});
	
	document.getElementById('walker_id').addEventListener('keydown', (event) => {
		if(event.keyCode == 13){
			document.getElementById('wk_pw').focus();
		}
	})
	
	document.getElementById('wk_pw').addEventListener('keydown', (event) => {
		if(event.keyCode == 13){
			document.getElementById('loginbt').click();
		}
	})
	
	$(document).ready(function(){
		$("#loginbt").click(function(){
		var walker_id = $("#walker_id").val();
		var wk_pw = $("#wk_pw").val();
		
			if(walker_id==""){
				alert("아이디를 입력해주세요");
			}else if(wk_pw==""){ 
				alert("비밀번호를 입력해주세요");
			}else{
				$.ajax({
					url:"/aniwalk/walker/loginCheck.do",
					type: "get",
					data: {
							"walker_id" : walker_id,
							"wk_pw" : wk_pw
						},
					success : function(data){
						switch(data){
						case 1 : alert("아이디를 확인해주세요."); break;
						case 3 : alert("아이디와 비밀번호가 일치하지 않습니다."); break;
						default : 
							//세션에 id 저장
							//sessionStorage.setItem("walker_id",walker_id);
							//alert(sessionStorage.getItem("walker_id"));
							location.href="main.do?walker_id="+walker_id;
						}
					},
					error: function(a,b,c){ //ajax 실패시 원인
						alert(c);
					}
				});
				
			}
			
		})
	});
</script>
</html>