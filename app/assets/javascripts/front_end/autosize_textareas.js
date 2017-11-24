function autosize(){
  var el = this;
  setTimeout(function(){
    el.style.cssText = 'height:auto; padding:0';
    // for box-sizing other than "content-box" use:
    // el.style.cssText = '-moz-box-sizing:content-box';
    el.style.cssText = 'height:' + el.scrollHeight + 'px';
  },0);
}
// var textareas = document.querySelectorAll('textarea')
// for (var textarea in textareas) {
//   textarea.addEventListener('keydown', autosize);
// }


var textareas = document.querySelectorAll('textarea')
textareas.forEach(function(textarea, index, array){
  textarea.addEventListener('keydown', autosize);
});
