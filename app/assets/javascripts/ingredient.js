$(document).ready(function(){
  console.log('document ready');

  $('#add_ingredient').on('click',function(e){
      e.preventDefault()
      console.log('clicking on add ingredient');

      var url = $(this).attr('href')
      console.log(url)

      $.ajax({
        type: 'get',
        url: url
      }).done(function(data){
        console.log("Meh")
        $('.ingredients_wrapper').append(data);
      });
  });

});

//
