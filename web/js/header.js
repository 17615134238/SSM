function getE(id) {
    return document.getElementById(id);
};
function riqi() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    var hour = date.getHours()-0;
    var minutes = date.getMinutes()-0;
    var secends = date.getSeconds()-0;
    var str = year+"-"+month+"-"+day+"   "+compare(hour)+":"+compare(minutes)+":"+compare(secends);
    getE("time").innerText=str;
    setInterval(riqi,1000);
};
function compare(t) {
    if(t<10){
        t="0"+t;
    }
    return t;
};