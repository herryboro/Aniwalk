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
<div class="user-info">
    <div class="info-top">
        <h4>User Profile</h4>
    </div>
    <div class="info-content">
        <div class="left-box">
            <img class="img-rounded" src="${pageContext.request.contextPath}/images/profile_test.png" alt="">
            <ul>
            	<c:forEach items="${userList}" var="List">
	                <li>
	                    <label>user nickname</label>
	                    <span>${List.mem_nickname}</span>
	                </li>
	                <li>
	                    <label>user phone number</label>
	                    <span>010-3938-4995</span>
	                </li>
	                <li>
	                    <label>user nickname</label>
	                    <span>서울시 서초구 반포대로16길 42</span>
	                    <span>롯데캐슬 1004동 209호</span>
	                </li>
	                <li>
	                    <label>user kakao id</label>
	                    <span>${List.kakao_id}</span>
	                </li>
            	</c:forEach>
            </ul>
            <button class="btn" type="button">카카오톡 메세지 보내기</button>
        </div>

        <div class="right-box">
            <h4>반려견 리스트</h4>
            <div class="form-group">
                <img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
                <ul>
                	<c:forEach items="${userList}" var="List">
	                    <li>
	                        <label>강아지이름</label>
	                        <span>${List.dog_name}</span>
	                    </li>
	                    <li>
	                        <label>견종</label>
	                        <span>${List.dog_type}</span>
	                    </li>
	                    <li>
	                        <label>강아지성격</label>
	                        <div class="textarea-label">
	                        	${List.dog_info}
	                        </div>
	                    </li>
              		</c:forEach>
                </ul>
            </div>
            <!--  
            <div class="form-group">
                <img class="img-rounded" src="${pageContext.request.contextPath}/images/mydog.jpg" alt="">
                <ul>
                    <li>
                        <label>강아지이름</label>
                        <span>크림</span>
                    </li>
                    <li>
                        <label>견종</label>
                        <span>포메라니안</span>
                    </li>
                    <li>
                        <label>강아지성격</label>
                        <div class="textarea-label">
                            강아지 주의사항 적는곳
                        </div>
                    </li>
                </ul>
            </div>
            -->

        </div>
    </div>
</div>
</body>
</html>