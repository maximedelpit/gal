//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require select2


$('.select2').select2({
  theme: "bootstrap",
  tags: true,
  tokenSeparators: [",", " "]
}).on("change", function(e) {
  var isNew = $(this).find('[data-select2-tag="true"]');
  if(isNew.length){
    isNew.replaceWith('<option selected value="'+isNew.val()+'">'+isNew.val()+'</option>');
    // $.ajax({
    //     // ... store tag ...
    // });
  }
});
