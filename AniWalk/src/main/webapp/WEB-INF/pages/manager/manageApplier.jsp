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
            <td>활동지역 1</td>
            <td>활동지역 2</td>
            <td>신청날짜</td>
            <td>합격상태</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="applier" items="${applierList}">
	        <tr onclick="location.href='/aniwalk/manager/walkerInfo.do?wk_id=${applier.wk_id}'">
	            <td>${applier.wk_name}</td>
	            <td>${applier.wk_email}</td>
	            <td>${applier.wk_phone}</td>
	            <td>${applier.wk_location1}</td>
	            <td>${applier.wk_location2}</td>
	            <td>${applier.apply_date}</td>
	            <td>${applier.apply_state}</td>
	        </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>