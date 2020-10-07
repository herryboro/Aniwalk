<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manager.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
<div class="user-info">
    <div class="info-top">
        <h4>Applier Profile</h4>
    </div>
    <div class="info-content">
        <div class="left-box">
            <img class="img-rounded" src="aniwalk/images/applier.png" alt="">
            <ul>
                <li>
                    <label>신청자</label>
                    <span>${walkerInfo[0].wk_name}</span>
                </li>
                <li>
                    <label>생년월일</label>
                    <span>${fn:substring(walkerInfo[0].wk_birth, 0, 10)}</span>
                </li>
                <li>
                    <label>핸드폰</label>
                    <span>${walkerInfo[0].wk_phone}</span>
                </li>
                <li>
                    <label>거주지</label>
                    <span style="display:block;">${walkerInfo[0].wk_addr}</span>
                </li>
                <li>
                    <label>이메일</label>
                    <span id="applierEmail">${walkerInfo[0].wk_email}</span>
                </li>
                <!-- 합격상태 and 아이디가 없는 경우 활성화 -->
                <!-- 아이디 생성 버튼 누르면 email@앞으로 id가 생성되고 비밀번호는 영어숫자랜덤으로 6자리 제공한다 -->
                <li>
                	<button id="walkerIdCreate" type="button" class="btn btn-primary">아이디 생성</button>
                	<!-- 합격상태 and 아이디가 있는 경우 -->
                	<!-- 임시비밀번호 발급 버튼을 누르면 현재 비밀번호가 임시 비밀번호로 변경된다. -->
                    <!--
                    <button id="walkerPwIssue" type="button" class="btn btn-danger">임시비밀번호 발급</button>
                     -->
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
                <!-- 주소를 00시 00구 /군 /동 이렇게 나오게 하는게 나을듯?? -->
                <!-- 
                	<label>신청한 활동지역</label>
                	<span> ${walkerInfo[0].wk_location1} ${walkerInfo[0].wk_location2} </span>
                	이런식으로 변경하는게 나을듯.
                 -->
                    <label>시</label>
                    <span>${walkerInfo[0].wk_location1}</span>
                </li>
                <li>
                <!-- 주소 변경해야됨!! -->
                    <label>구 / 군</label>
                    <span>${walkerInfo[0].wk_location2}</span>
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
                <li>
                	<label>등록한 자격정보</label>
                	<div class="certificate-group">
                		<!-- 등록한 자격증이 없는 경우 -->
                		<!-- 
                		<h3>등록한 자격증 정보가 없습니다.</h3>
                		 -->
                		<!-- 등록한 자격증이 있는경우 -->
                		<!-- 클릭시 모달로 이미지 크게 보이게 할것임 -->
                		<img class="certificate-img" src="/aniwalk/images/certificate.jpg">
                		<img class="certificate-img" src="/aniwalk/images/walkerMain.png">
                	</div>
                </li>
                <!-- 등록한 자격증이 없을 떄도 있긴해야지 /// 근데 활동중일 때만 나오게 하는게 맞는거지???-->
                <!-- ajax로 처리하는게 get방식으로 처리하는 것보다 나을듯? -->
                <li>
                	<label>자격증 입력</label>
                	<div class="certificate-input-box">
                		<input id="certificateName" type="text" class="form-control" placeholder="자격증 이름을 입력해주세요">
                		<button class="btn btn-success" type="button">등록</button>
                	</div>
                </li>
                <li>
					<label>자격증 리스트</label>                
                	<ol id="certificateList">
                		<li>반려동물 케어 자격증</li>
                		<li>산책 자격증</li>
                	</ol>
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
<div class="modal-bg hidden">
	<div class="modal-content" onclick="event.stopPropagation()">
		<button class="close-btn" type="button">&times;</button>
		<img src="aniwalk/images/certificate.jpg" class="img-rounded big-img">
	</div>
</div>

<script>
	$(document).ready(function(){
		var apply_state = "${walkerInfo[0].apply_state}";
		$('#apply_state').val(apply_state).attr('selected', 'selected');
		
	})
</script>
<script>
	const certificateImg = document.querySelectorAll('.certificate-img');
	const modalBigImg = document.querySelector('.big-img');
	const modalBg = document.querySelector('.modal-bg');
	const closeBtn = document.querySelector('.close-btn');

	for (let i=0; i<certificateImg.length; i++){
	    certificateImg[i].addEventListener('click',function (){
	         modalBigImg.src = this.src;
	         console.log(modalBigImg.src);
	         modalBg.classList.remove('hidden');
        })
    }
	modalBg.addEventListener('click',function (){
	    modalBg.classList.add('hidden');
    });
    modalBg.addEventListener('click',function (){
        modalBg.classList.add('hidden');
    });
    closeBtn.addEventListener('click',function (){
        modalBg.classList.add('hidden');
    });
</script>
<script>
    //아이디 생성 버튼 클릭
    const walkerIdCreate = document.getElementById('walkerIdCreate');
    const applierEmail = document.getElementById('applierEmail');

    walkerIdCreate.addEventListener('click',function(){
        const wk_id = applierEmail.textContent.split('@')[0];
        const wk_passwd = Math.random().toString(36).substr(2,6);
        //console.log('프렌즈 id = ' + wk_id + '프렌즈 pw = ' + wk_passwd);
        $.ajax({
            type : 'post',
            url : '/aniwalk/manager/createWalkerId.do',	//이름 바꿔도됨
            dataType : 'json',
            data : JSON.stringify({
                "wk_id" : wk_id,
                "wk_passwd" : wk_passwd,
            }),
            success : function() {
                alert('아이디가 생성되었습니다.');
                location.reload();
            },
            error : function(a, b, c) {
                console.log(c);
            }
        });
    });
</script>
<script>
    //임시비밀번호 발급 버튼 클릭
    const walkerPwIssue = document.getElementById('walkerPwIssue');
    walkerPwIssue.addEventListener('click',function (){
        const wk_passwd = Math.random().toString(36).substr(2,6);
        //console.log(wk_passwd);
        $.ajax({
            type : 'post',
            url : '/aniwalk/manager/updateWalkerPw.do',	//이름 바꿔도됨
            dataType : 'text',
            data :{
                "wk_passwd" : wk_passwd,
            },
            success : function() {
                alert('비밀번호가 변경되었습니다.');
            },
            error : function(a, b, c) {
                console.log(c);
            }
        });
    });
</script>
<script>
    const certificateName = document.getElementById('certificateName');
    //자격증 정보 입력했을 때
    $.ajax({
        type : 'post',
        url : '/aniwalk/manager/insertCertificate.do',	//이름 바꿔도됨
        dataType : 'text',
        data :{
            "certificate_name" : certificateName.value,
        },
        success : function() {
            alert('자격증 정보가 추가 되었습니다..');
        },
        error : function(a, b, c) {
            console.log(c);
        }
    });
</script>
</body>

</html>