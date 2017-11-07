$(document).ready(function() {
  setTimeout(function() { $('.alert-info').slideUp() }, 2000);
  $('.close').parent().click(function() {$(this).slideUp()});
});

