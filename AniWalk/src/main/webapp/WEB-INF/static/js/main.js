let agreeError = '필수 항목에 동의하셔야 합니다.';
let profileImgError = '사진 1개이상 업로드 하셔야합니다.'
let twoTextInputError = '2글자 이상 입력하세요';
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
    const authPhoneLi = document.querySelector('.auth-phone');
    const addForm = `
        <form style="display: flex; justify-content: space-around; margin-top: 10px;">
            <label>인증번호</label>
            <input type="text" class="from-control" style="width: 65%;">
            <button type="button" class="btn btn-primary">인증번호입력</button>
        </form>
    `
    authPhoneLi.innerHTML += addForm;
}