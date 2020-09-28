let agreeError = '필수 항목에 동의하셔야 합니다.';
let profileImgError = '사진 1개이상 업로드 하셔야합니다.'
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