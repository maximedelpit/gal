function autosize(){
  var el = this;
  setTimeout(function(){
    el.style.cssText = 'height:auto; padding:0';
    // for box-sizing other than "content-box" use:
    // el.style.cssText = '-moz-box-sizing:content-box';
    el.style.cssText = 'height:' + el.scrollHeight + 'px';
  },0);
}
var textareas = document.querySelectorAll('textarea')
for (var i = 0; textareas.length; i++) {
  textareas[i].addEventListener('keydown', autosize);
}
