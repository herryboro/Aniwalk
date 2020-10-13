<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>오너 로그인</title>

	<link rel="stylesheet" href="../../../static/css/mOwner.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

	<!-- jQuery Mobile -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

<section id="page1" data-role="page">
	<div class="content" data-role="content">
		<ul class="login">
			<li>
				<img src="../../../images/main_logo.png" class="img-rounded" alt="">
			</li>
			<li>
				<a id="custom-login-btn" href="mOwnerMain.jsp">
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
				</a>
			</li>
		</ul>
	</div>
</section>

<script>
	function loginWithKakao() {
		Kakao.Auth.authorize({
			redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
		})
	}
</script>
</body>
</html>