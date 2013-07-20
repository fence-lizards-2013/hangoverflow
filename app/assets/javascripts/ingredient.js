// REVIEW: looking good!
$(document).ready(function(){
  $('form').on('click', '.add_fields', Ingredient.addIngredient);
  $('form').on('click', '.remove-ingredient',Ingredient.removeFields);
});

var Ingredient = {

  addIngredient: function(e){
    e.preventDefault();
    var time = new Date().getTime();
    var regex = new RegExp($(this).attr('data-id'), 'g');
    $(this).before($(this).data('fields').replace(regex,time));
  },

  removeFields: function() {
    $(this).parent().remove();
  }
}

