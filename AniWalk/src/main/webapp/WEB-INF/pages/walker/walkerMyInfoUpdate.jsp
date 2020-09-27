<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 개인정보수정</title>
	<link rel="stylesheet" type="text/css" href="../../static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="myinfo-update">

		<form>
			<h3>개인정보수정</h3>
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>encore@naver.com</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" class="form-control" placeholder="비밀번호 입력">
						<span class="text-primary"></span>
						<span class="text-danger"></span>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="password" class="form-control" placeholder="비밀번호 재입력">
						<span class="text-primary"></span>
						<span class="text-danger"></span>
					</td>
				</tr>
				<tr>
					<th rowspan="2">
						활동지역
						<br><br>
						활동지역 변경은<br>
						신청후 7주일 이후에<br>
						변경됩니다.
					</th>
					<td class="select-city">1
						<select class="form-control">
							<option selected>대도시</option>
						</select>
						<select class="form-control">
							<option>소도시</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="select-city">2
						<select class="form-control">
							<option selected>대도시</option>
						</select>
						<select class="form-control">
							<option>소도시</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>짧은 자기소개</th>
					<td>
						<input type="text" class="form-control">
					</td>
				</tr>
				<tr>
					<th>활동중지 신청</th>
					<td>
						<button type="button" class="btn btn-danger">활동중지</button>
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
</html>