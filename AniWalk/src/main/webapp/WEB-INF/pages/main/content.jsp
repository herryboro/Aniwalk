<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="innerBox">
		<label>
			반려견의<br>
			행복을 위한<br>
			산책을<br>
			지금 시작해보세요
		</label>
		<a id="custom-login-btn" href="/aniwalk/login.do">
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
</body>
</html>