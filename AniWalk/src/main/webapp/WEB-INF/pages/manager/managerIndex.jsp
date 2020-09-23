<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<link rel="stylesheet" type="text/css" href="../../static/css/manager.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
<div>
    <h1>관리자 로그인 해야된다</h1>

    <h3 id="showToday"></h3>
    <button class="btn btn-primary">로그인</button>
</div>
<script>

    let today = new Date();
    let dd = today.getDate();
    let mm = today.getMonth()+1; //January is 0!
    let yyyy = today.getFullYear();
    let now = today.getHours() + '시 ' + today.getMinutes() + '분 '
            + today.getSeconds() + '초';

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }

    today = yyyy + '년 ' + mm+'월 '+dd+'일' + now;

    const showToday = document.getElementById('showToday');
    showToday.innerHTML = today;
</script>
</body>
</html>