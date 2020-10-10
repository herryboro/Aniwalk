<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톡리스트</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owner.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<div class="talk-list">
		<!-- 검색 -->
		<div class="search-part">
			<form name="walkerListSearchForm">
				<label>
					<input class="form-control" type="search" placeholder="이름 검색">
				</label>
				<button class="btn btn-primary" type="submit">검색</button>
			</form>
		</div>

		<div class="list-part" >

			<div class="talk-item">
				<ul>
					<li>
						<a href="/aniwalk/owner/talkContent.do?mem_nickname='${mem_nickname}'"><img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt=""></a>
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>

			<div class="talk-item">
				<ul>
					<li>
						<img class="img-circle" src="${pageContext.request.contextPath}/images/applier.png" alt="">
					</li>
					<li>
						<div>
							<label>반려견주인 닉네임</label>
							<span>제일 최근 대화 내용</span>
						</div>
					</li>
				</ul>
				<label>최근 대화 날짜</label>
			</div>
		</div>
	</div>

</body>
</html>