const agreeError = '필수 항목에 동의하셔야 합니다.';
const profileImgError = '사진 1개이상 업로드 하셔야합니다.'
const twoTextInputError = '2글자 이상 입력하세요';
const phoneMinusError = `
        <div class="text-danger">-을 빼고 작성해주세요</div>
    `;
const phoneInputError = `
        <div class="text-danger">핸드폰번호를 제대로 입력해주세요</div>
    `;

const check_num = /[0-9]/;                  // 숫자
const check_eng = /[a-zA-Z]/;               // 문자
const check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
const check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;      // 한글체크


applyCheck =  function(){
    if(applyForm1.essentialAgreeYn.value === ''){
        alert(agreeError);
        return false;
    }
    if(applyForm1.ul.li.profile_files[0].value === ''){
        alert(profileImgError);
        return false;
    }

}


addPhoneAuthForm = function(){
    const authPart = document.querySelector('.auth-part');
    const unuse = document.querySelector('.unuse');
    const addForm = `
        <form id="authForm" style="display: flex; justify-content: space-around; margin-top: 10px;">
            <label>인증번호</label>
            <input class="auth form-control" style="width: 65%;">
            <button onclick="auth()" id="authNum" type="button" class="btn btn-primary">인증번호입력</button>
        </form>
    `;

    const wk_phone = document.getElementById('wk_phone');
    let phoneNum = wk_phone.value.split('');
    let minusError = 0;
    for(let i=0; i<phoneNum.length; i++){
        if(phoneNum[i] === '-'){
            minusError++;
        }
    }

    if(minusError >= 1){
        authPart.innerHTML = phoneMinusError;
        return false;
    }else if (wk_phone.value.length < 11){
        authPart.innerHTML = phoneInputError;
        return false;
    }else if (check_kor.test(wk_phone.value) || check_eng.test(wk_phone.value) || check_spc.test(wk_phone.value) ){
        authPart.innerHTML = phoneInputError;
        return false;
    }
    else{
        authPart.innerHTML = addForm;
        unuse.innerHTML = '';
        return true;
    }


}

phoneUnusable = function(){
    const unuse = document.querySelector('.unuse');
    const authPart = document.querySelector('.auth-part');

    const unusable = `
        <div class="text-danger">이미 사용중인 번호입니다.</div>
    `
    unuse.innerHTML = unusable;
    authPart.innerHTML = '';
}