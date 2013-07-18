$(document).ready(function(){
  $('form').on('click', '.add_fields', function(e){
  var time = new Date().getTime();
  var regex = new RegExp($(this).attr('data-id'), 'g');
  $(this).before($(this).data('fields').replace(regex,time)); 
  }); 
});


//
