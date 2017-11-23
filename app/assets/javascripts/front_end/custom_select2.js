$('.select2').select2({
  closeOnSelect: true,
  allowClear: false,
  placeholder: '',
  tags: true,
  minimumInputLength: 1,
  tokenSeparators: [","]//,
  // createSearchChoice: function(term) {
  //   debugger;
  //   return {
  //     id: null,
  //     name: term + ' (new)'
  //   };
  // }
})
// .on("change", function(e) {
//   var isNew = $(this).find('[data-select2-tag="true"]');
//   if(isNew.length){
//     isNew.replaceWith('<option selected value="'+isNew.val()+'">'+isNew.val()+'</option>');
//     // $.ajax({
//     //     // ... store tag ...
//     // });
//   }
// });

