function clock(){
    let today = new Date();
    let dd = today.getDate();
    let mm = today.getMonth()+1; //January is 0!
    let yyyy = today.getFullYear();
    let now = today.getHours() + '시 ' + today.getMinutes() + '분 '
        + today.getSeconds() + '초';

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }

    today = yyyy + '년 ' + mm+'월 '+dd+'일' + now;

    const showToday = document.getElementById('showToday');
    showToday.innerHTML = today;
}
