<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manager.css">
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
	        <c:forEach items="${memlist}" var="list">
	           <tr onclick="location.href='/aniwalk/manager/userInfo.do?kakao_id=${list.kakao_id}'">
	                <td>${list.kakao_id}</td>
	                <td>${list.mem_nickname}</td>
	                <td>${list.mem_phone}</td>
	                <td>user location</td>
	                <td>sign out date</td>
	            </tr>
	        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>