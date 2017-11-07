$('.select2').select2({
  closeOnSelect: false,
  debug: true,
  allowClear: true,
  placeholder: '',
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
