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
<div class="manage manage-user">
    <form class="search-form" name="userSearchForm">
        <label>
            <input type="search" class="form-control" placeholder="유저닉네임 검색">
        </label>
        <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span>
        </button>
    </form>

    <h3>유저리스트</h3>

    <table class="table table-striped">
        <thead>
            <tr>
                <td>카카오톡아이디</td>
                <td>닉네임</td>
                <td>핸드폰번호</td>
                <td>지역</td>
                <td>탈퇴날짜</td>
            </tr>
        </thead>
        <tbody>
            <tr onclick="location.href='/aniwalk/manager/userInfo.do'">
                <td>kakaotalk id</td>
                <td>nickname</td>
                <td>phone number</td>
                <td>user location</td>
                <td>sign out date</td>
            </tr>
        </tbody>
    </table>

</div>
</body>
</html>