
document.getElementById("user_nl_subscription").addEventListener('click', (event) => {
  debugger;
  var lkdn_btn = document.getElementById('btn-user-linkedin-connect-signup');
  href = lkdn_btn.href
  var regex = /(.+)(accepts_terms_of_sales=)(true|false)(&)(nl_subscription=)(true|false)/;
  href.replace(regex, '$1$2$3$4$5' + event.target.checked);
});

document.getElementById("user_accepts_terms_of_sales").addEventListener('click', (event) => {
  var lkdn_btn = document.getElementById('btn-user-linkedin-connect-signup');
  href = lkdn_btn.href
  var regex = /(.+)(accepts_terms_of_sales=(true|false))(&)(nl_subscription=(true|false))/;
  href.replace(regex, '$1$2'+ event.target.checked + '$4$5$6');
  if(event.target.checked) {

  } else {

  }
});
