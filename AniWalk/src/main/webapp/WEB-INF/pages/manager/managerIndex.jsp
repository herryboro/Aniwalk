<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manager.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="/aniwalk/static/js/manager.js" type="text/javascript"></script>
<body>
<div class="manager-login">
    <form action="${pageContext.request.contextPath}/manager/indexPro.do" method="post">
    	<img src="/aniwalk/images/main_logo.png" alt="">
	    <ul>
	    	<li>
	    		<label>관리자 아이디</label>
	    		<label>
	    			<input type="text" class="form-control" name="manager_id">
	    		</label>
	    	</li>
	    	<li>
	    		<label>관리자 비밀번호</label>
	    		<label>
	    			<input type="password" class="form-control" name="manager_pw">
	    		</label>
	    	</li>
			<li>
				<button type="submit" class="btn btn-primary">로그인</button>
			</li>
	    </ul>
    </form>
	<h3 id="showToday"></h3>
</div>
<script>
    function init() {
        clock();
        setInterval(clock, 1000);
    }
    init();
</script>
</body>
</html>