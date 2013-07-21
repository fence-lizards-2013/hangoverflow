var Cocktail = {
  init: function(){
    $('.delete_cocktail').on('ajax:success', this.deleteCocktail);
    $('#toggle_search_button').on('click', this.toggleSearchForm);
  },

  toggleSearchForm: function() {
    $('.search_form_wrapper').toggle('slide');
  },

  deleteCocktail: function(event, data) {
    $(this).closest('.cocktail').fadeOut(function(){
      $(this).remove();
    });
  }
}


$(document).ready(function(){
  Cocktail.init();
});
