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
<body>
<div class="manage">
    <form class="search-form">
        <label>
            <input type="search" class="form-control" placeholder="반려견 주인이나 프렌즈 이름으로 검색">
        </label>
        <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span>
        </button>
    </form>

    <h3>현재 매칭된 리스트</h3>

    <table class="table table-striped">
        <thead>
        <tr>
            <td>반려견 주인</td>
            <td>프렌즈</td>
            <td>예약날짜</td>
            <td>예약시간</td>
            <td>예약지역</td>
            <td>진행상태</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>크림이아빠</td>
            <td>강형욱</td>
            <td>2020-10-14</td>
            <td>시작시간 ~ 종료시간</td>
            <td>서울특별시 서초구</td>
            <td>진행전 <!-- 진행중 / 완료전 / --></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>