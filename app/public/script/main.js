var timeleft = 180;
var downloadTimer = setInterval(function(){
  document.getElementById("progressBar").value = 180 - --timeleft;
  if(timeleft <= 0)
    clearInterval(downloadTimer);
},1000);
