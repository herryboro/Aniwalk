<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
		<!-- 
		<a id="custom-login-btn" href="/aniwalk/login.do">
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
		</a>
		 -->
		
		<p id="token-result"></p>
	
	<a id="kakao-login-btn"></a>

	<script type="text/javascript">
	  // 사용할 앱의 JavaScript 키를 설정해 주세요.
    	Kakao.init('2521c7cc3e67ced68e19182536406c54');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    
		// SDK 초기화 여부를 판단합니다.
		console.log(Kakao.isInitialized());  	  	  

		Kakao.Auth.createLoginButton({
		    container: '#kakao-login-btn',
		    success: function(authObj) {
		      Kakao.API.request({
		        url: '/v2/user/me',
		        success: function(res) {
		          //alert(JSON.stringify(res))   
		          
		          var kakao_id = res.id;
		          var nickname = res.properties['nickname'];
		          var profile_img = res.properties['profile_image'];
		          var connected_time = res.connected_at;
		          var email = res.kakao_account['email'];
		          var phone_number = res.kakao_account['phone_number'];
		          var gender = res.kakao_account['gender']
		          var kakao_access_token = authObj.access_token;
		       
		          
		          
		          console.log(kakao_id);
		          console.log(nickname);
		          console.log(profile_img);
		          console.log(connected_time);
		          console.log(email);
		          console.log(phone_number);
		          console.log(gender);
		          console.log(kakao_access_token);
		         
		          
		          
		        },
		        fail: function(error) {
		          alert(
		            'login success, but failed to request user information: ' +
		              JSON.stringify(error)
		          )
		        },
		      })
		    },
		    fail: function(err) {
		      alert('failed to login: ' + JSON.stringify(err))
		    },
		  })
	</script>	
			
	</div>
</div>
</body>
</html>