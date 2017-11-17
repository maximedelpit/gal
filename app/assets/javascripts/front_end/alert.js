$(document).ready(function() {
  setTimeout(function() { $('.alert-info').slideUp() }, 4000);
  $('.close').parent().click(function() {$(this).slideUp()});
});

