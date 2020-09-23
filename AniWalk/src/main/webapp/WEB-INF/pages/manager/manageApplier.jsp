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
<div class="manage">
    <form class="search-form" name="userSearchForm">
        <label>
            <input type="search" class="form-control" placeholder="신청인 검색">
        </label>
        <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span>
        </button>
    </form>

    <h3>신청자 리스트</h3>

    <table class="table table-striped">
        <thead>
        <tr>
            <td>신청자</td>
            <td>이메일</td>
            <td>핸드폰</td>
            <td>신청지역</td>
            <td>신청날짜</td>
            <td>합격여부</td>
        </tr>
        </thead>
        <tbody>
        <tr onclick="location.href='/aniwalk/manager/walkerInfo.do'">
            <td>신청자</td>
            <td>address@mail.com</td>
            <td>010-1234-5678</td>
            <td>서울특별시 서초구</td>
            <td>2020-09-23</td>
            <td>연락전<!--/ 교육대기 / 교육수료 /--></td>
        </tr>
        </tbody>
    </table>

</div>
</body>
</html>