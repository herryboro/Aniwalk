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
<div class="user-info">
    <div class="info-top">
        <h4>Applier Profile</h4>
    </div>
    <div class="info-content">
        <div class="left-box">
            <img class="img-rounded" src="../../images/applier.png" alt="">
            <ul>
                <li>
                    <label>신청자</label>
                    <span>신청인</span>
                </li>
                <li>
                    <label>생년월일</label>
                    <span>900909</span>
                </li>
                <li>
                    <label>핸드폰</label>
                    <span>010-3938-4995</span>
                </li>
                <li>
                    <label>거주지</label>
                    <span>서울시 서초구 반포대로16길 42</span>
                    <span>롯데캐슬 1004동 209호</span>
                </li>
                <li>
                    <label>이메일</label>
                    <span>test@guest.com</span>
                </li>
            </ul>
        </div>

        <form class="right-box">
            <!-- 합격전 -->
            <h4>신청정보</h4>
            <ul class="applier-info">
                <li>
                    <label>신청날짜</label>
                    <span>2020-09-23</span>
                </li>
                <li>
                    <label>활동지역</label>
                    <span>서울특별시 서초구</span>
                </li>
                <li>
                    <label>신청상태</label>
                    <select>
                        <option>연락전</option>
                        <option>교육대기</option>
                        <option>교육수료</option>
                        <option>합격</option>
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
</body>

</html>