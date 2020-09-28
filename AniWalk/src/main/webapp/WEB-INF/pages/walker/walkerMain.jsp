<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프렌즈 메인</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/walker.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<div class="main-active-none">
		<img src="${pageContext.request.contextPath}/images/walkerMain.png" alt="">
		<h2>활동 내역이 없습니다.</h2>
	</div>

	<div class="main-active-list hidden">
		<h2>활동현황</h2>
		<!-- 1일씩 -->
		<div class="subtitle">
			<h4>2020-09-27</h4>
			<hr width="80%" color="gray"/>
		</div>
		<table>
			<thead>
			<tr>
				<th>장소</th>
				<th>시간</th>
				<th style="text-align: center;">진행현황</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					서울시 서초구 반포대로 13길 26
				</td>
				<td>
					오전 9:30  ~   오전 10:00 (30분)
				</td>
				<td>
					<div class="not">미진행</div>
				</td>
			</tr>
			<tr>
				<td>
					서울시 강남구 테헤란로 123
				</td>
				<td>
					오후 3:00 ~ 오후 3:20  (20분)
				</td>
				<td>
					<div class="done">진행완료</div>
				</td>
			</tr>
			</tbody>
		</table>

		<div class="subtitle">
			<h4>2020-09-26</h4>
			<hr width="80%" color="gray"/>
		</div>
		<table>
			<thead>
			<tr>
				<th>장소</th>
				<th>시간</th>
				<th style="text-align: center;">진행현황</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					서울시 서초구 반포대로 13길 26
				</td>
				<td>
					오전 9:30  ~   오전 10:00 (30분)
				</td>
				<td>
					<div class="not">미진행</div>
				</td>
			</tr>
			<tr>
				<td>
					서울시 강남구 테헤란로 123
				</td>
				<td>
					오후 3:00 ~ 오후 3:20  (20분)
				</td>
				<td>
					<div class="done">진행완료</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>


	
</body>
</html>