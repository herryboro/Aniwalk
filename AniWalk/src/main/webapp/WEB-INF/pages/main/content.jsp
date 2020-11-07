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
<div class="main-bg">
	<div class="innerBox">
		<label>
			반려견의<br>
			행복을 위한<br>
			산책을<br>
			지금 시작해보세요
		</label>
		<p id="token-result"></p>
	
		<a id="kakao-login-btn"></a>
	</div>
</div>

<script>
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
		         // alert(JSON.stringify(res))   	         		          
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
		         
		          location.href="loginPro.do?kakao_id="+ kakao_id + "&nickname=" + nickname + "&profile_img=" + profile_img
	           		+ "&connected_time=" + connected_time + "&email=" + email + "&phone_number=" + phone_number + "&gender="+ gender 
	           		+"&kakao_access_token=" + kakao_access_token;
		          
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
</body>
</html>