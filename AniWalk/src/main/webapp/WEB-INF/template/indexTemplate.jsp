<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기페이지</title>
</head>

<!-- css -->
<link rel="stylesheet" type="text/css" href="/static/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- js -->

<body>
	<nav>
		<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	</nav>
	<article>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		
		<div>
		<tiles:insertAttribute name="sign"></tiles:insertAttribute>
			<div class="innerBox">
				<label>
					반려견의<br>
					행복을 위한<br>
					산책을<br>
					지금 시작해보세요
				</label>
				<a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
				</a>
				<p id="token-result"></p>
				<script type="text/javascript">
					function loginWithKakao() {
						Kakao.Auth.authorize({
							redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
						})
					}
				</script>
			</div>

		</div>
	</article>
	<footer>
			 Copyright@ PandoraBox     Web / App Project
	</footer>
</body>
</html>