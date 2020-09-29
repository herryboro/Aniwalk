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
    const addForm = `
        <form style="display: flex; justify-content: space-around; margin-top: 10px;">
            <label>인증번호</label>
            <input type="text" class="from-control" style="width: 65%;">
            <button type="button" class="btn btn-primary">인증번호입력</button>
        </form>
    `;

    const inputPhoneNum = document.getElementById('inputPhoneNum');
    let phoneNum = inputPhoneNum.value.split('');
    let minusError = 0;
    for(let i=0; i<phoneNum.length; i++){
        if(phoneNum[i] === '-'){
            minusError++;
        }
    }

    if(minusError >= 1){
        authPart.innerHTML = phoneMinusError;
    }else if (inputPhoneNum.value.length < 11){
        authPart.innerHTML = phoneInputError;
    }else if (check_kor.test(inputPhoneNum.value) || check_eng.test(inputPhoneNum.value) || check_spc.test(inputPhoneNum.value) ){
        authPart.innerHTML = phoneInputError;
    }
    else{
        authPart.innerHTML = addForm;
    }


}