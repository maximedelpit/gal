
var nl = document.getElementById("user_nl_subscription")
if(nl) {
  nl.addEventListener('click', function(event){
    debugger;
    var lkdn_btn = document.getElementById('btn-user-linkedin-connect-signup');
    href = lkdn_btn.href
    var regex = /(.+)(accepts_tos=)(true|false)(&)(nl_subscription=)(true|false)/;
    href.replace(regex, '$1$2$3$4$5' + event.target.checked);
  });

}

var tos = document.getElementById("user_accepts_tos")
if(tos){tos.addEventListener('click', function(event){
  var lkdn_btn = document.getElementById('btn-user-linkedin-connect-signup');
  href = lkdn_btn.href
  var regex = /(.+)(accepts_tos=(true|false))(&)(nl_subscription=(true|false))/;
  href.replace(regex, '$1$2'+ event.target.checked + '$4$5$6');
  if(event.target.checked) {

  } else {

  }
});}
