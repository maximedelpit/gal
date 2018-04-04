//= require active_admin/base
//= require select2-full


$(document).ready(function() {
  $('.select2').select2({
    closeOnSelect: true,
    selectOnClose: true,
    debug: true,
    allowClear: false,
    placeholder: '',
    tags: true,
    minimumInputLength: 1,
    tokenSeparators: [","]
  });

  // $('.select2-no-add').select2({
  //   closeOnSelect: true,
  //   selectOnClose: true,
  //   debug: true,
  //   allowClear: false,
  //   placeholder: '',
  //   tags: true,
  //   minimumInputLength: 1,
  //   maximumSelectionLength: 1,
  //   tokenSeparators: [","]
  // });
});


