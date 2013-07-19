var Cocktail = {
  init: function(){
    $('.delete_cocktail').on('ajax:success', this.deleteCocktail);
  },

  deleteCocktail: function(event, data) {
    $(this).closest('.cocktail').fadeOut(function(){
      $(this).remove();
    });
  }
}

$(document).ready(function(){
  Cocktail.init();

  // I know this is ugly, just seeing if it works
  // $('reveal-search').on('click', function() {
  //   console.log("I'm in the reveal-search event");
  //   $('.search').css('display', 'inherit');
  // });
});
