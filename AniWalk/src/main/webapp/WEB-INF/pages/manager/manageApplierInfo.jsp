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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<body>
<div class="user-info">
    <div class="info-top">
        <h4>Applier Profile</h4>
    </div>
    <div class="info-content">
        <div class="left-box">
            <img class="img-rounded" src="${pageContext.request.contextPath}/images/applier.png" alt="">
            <ul>
                <li>
                    <label>신청자</label>
                    <span>${walkerInfo[0].wk_name}</span>
                </li>
                <li>
                    <label>생년월일</label>
                    <span>${walkerInfo[0].wk_birth}</span>
                </li>
                <li>
                    <label>핸드폰</label>
                    <span>${walkerInfo[0].wk_phone}</span>
                </li>
                <li>
                    <label>거주지</label>
                    <span>${walkerInfo[0].wk_addr}</span>
                </li>
                <li>
                    <label>이메일</label>
                    <span>${walkerInfo[0].wk_email}</span>
                </li>
            </ul>
        </div>

        <form class="right-box">
            <!-- 합격전 -->
            <h4>신청정보</h4>
            <ul class="applier-info">
                <li>
                    <label>신청날짜</label>
                    <span>${walkerInfo[0].apply_date}</span>
                </li>
                <li>
                    <label>시</label>
                    <span>${walkerInfo[0].wk_location1}</span>
                </li>
                <li>
                    <label>구 / 군</label>
                    <span>${walkerInfo[0].wk_location1}</span>
                </li>
                <li>
                    <label>신청상태</label>
                    <select id="apply_state">
                        <option value="1">서류 검토 중</option>
                        <option value="2">교육 대기</option>
                        <option value="3">교육 수료</option>
                        <option value="4">합격</option>
                        <option value="5">불합격</option>
                    </select>
                </li>
            </ul>
            <!-- 합격 후 -->
            <!--
            <h4>활동정보</h4>
            <ul>
                <li>
                    <label>아이디</label>
                    <span>test1234</span>
                </li>
                <li>
                    <label>활동시작 날짜</label>
                    <span>2020-09-25</span>
                </li>
                <li>
                    <label>활동지역</label>
                    <span>서울특별시 서초구</span>
                </li>
                <li>
                    <label>활동상태</label>
                    <select>
                        <option>활동</option>
                        <option>중지</option>
                    </select>
                </li>
            </ul>
            -->
            <div class="btn-line">
                <button class="btn btn-primary" type="submit">수정</button>
                <button class="btn btn-danger" type="button">취소</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var apply_state = "${walkerInfo[0].apply_state}";
		$('#apply_state').val(apply_state).attr('selected', 'selected');
		
	})
</script>
</body>

</html>