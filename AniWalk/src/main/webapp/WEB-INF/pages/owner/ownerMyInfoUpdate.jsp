<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 개인정보수정</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- jQuery -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="myinfo-update">

		<form action="">
		<input type="hidden" name="owner_id">
			<h3>개인정보수정</h3>
			<table class="table">
				<tr>
					<th colspan="2">
						<div class="img-part">
							<img id="clickImg" src="/aniwalk/images/profile_test.png" alt="" class="img-rounded">
							<h5>&lt;대표사진설정&gt;</h5>
							<input id="uploadImg" type="file" class="hidden" name="files">
						</div>
					</th>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" class="form-control" value="오너닉네임"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" class="form-control" value="오너전화번호" readonly>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="submit" class="btn btn-primary">수정완료</button>
					</th>
				</tr>

			</table>
		</form>

	</div>
</body>
<script>
	const userImg = document.getElementById('userImg');
	const userInputImg = document.getElementById('userInputImg');
	userImg.addEventListener('click',function (){
		userInputImg.click();
	});

</script>
</html>