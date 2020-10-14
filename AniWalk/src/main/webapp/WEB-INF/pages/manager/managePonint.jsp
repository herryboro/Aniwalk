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

<!-- js -->
<script src="/aniwalk/static/js/manager.js"></script>

<body>
<div class="manage-point">
    <h4>포인트 사용 대상자 검색</h4>
    <form class="search-form">
        <label>
            <input type="search" class="form-control" placeholder="반려견 주인이나 프렌즈 이름으로 검색">
        </label>
        <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span>
        </button>
    </form>

    <div class="search-result">
        <h4>검색결과</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>권한</td>
                <td>이름</td>
                <td>핸드폰</td>
                <td>지역</td>
            </tr>
            </thead>
            <tbody>
            <!-- loop -->
            <tr>
                <td>반려견주인<!-- 펫프렌즈 --></td>
                <td>반려견주인 닉네임 <!-- walker인 경우 이름 --></td>
                <td>010-1234-5678</td>
                <td>서울특별시 서초구</td>
            </tr>
            <!-- loop end -->
            </tbody>
        </table>
    </div>

    <div class="point-used">
        <h4>포인트 내역 확인</h4>

        <table class="table table-striped">
            <thead>
            <tr>
                <td>날짜</td>
                <td>사용목적</td>
                <td>금액</td>
                <td>비고</td>
            </tr>
            </thead>
            <tbody>
            <!-- loop -->
            <tr>
                <td>2020-10-14</td>
                <td>충전<!--owner : 충전/사용 --><!--walker : 활동수입/출금 --></td>
                <td>202020</td>
                <td><!--onwer 사용일때, walker 활동수입 일 경우 match_id를 걸어놓고 클릭시 사용내역을 모달로 보여준다 -->
                    <label id="matchId">match_id</label>
                </td>
            </tr>
            <!-- loop end -->
            </tbody>
        </table>
    </div>
</div>


<div class="modal-bg hidden">
    <div class="modal-content" onclick="event.stopPropagation()">
        <button type="button" class="close">&times;</button>
        <div class="my-walked">
            <div class="form-group">
                <div class="walked-month">09-24 목요일 12:00</div>
                <div class="walked-info">
                    <img class="img-thumbnail" src="/aniwalk/images/moveInfo.png" alt="">
                    <ul>
                        <li>
                            <label>펫프렌즈</label>
                            <span>이름</span>
                        </li>
                        <li>
                            <label>반려견주인</label>
                            <span>닉네임</span>
                        </li>
                        <li>
                            <label>반려견</label>
                            <span>이름</span>
                        </li>
                        <li>
                            <label>거리</label>
                            <span>2.3km</span>
                        </li>
                        <li>
                            <label>산책시간</label>
                            <span>30분 12초</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const matchId = document.getElementById('matchId');
    const modalBg = document.querySelector('.modal-bg');
    const closeBtn = document.querySelector('.close');
    matchId.addEventListener('click',openModal);
    modalBg.addEventListener('click',closeModal);
    closeBtn.addEventListener('click',closeModal);
</script>
</body>
</html>