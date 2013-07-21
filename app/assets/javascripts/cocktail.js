var Cocktail = {
  init: function(){
    this.container = $('#cocktail_grid');
    $('.delete_cocktail').on('ajax:success', this.deleteCocktail);
    $('#search_button').on('click', this.openSearchForm);
    $('#modal form').on('ajax:success', this.renderCocktails);

    this.getCocktails();
  },

  renderCocktails: function(event, data) {

    console.log("Rendering Cocktails");

    $('.search_form_wrapper').hide();
    Cocktail.container.masonry('remove', Cocktail.container.children());
    Cocktail.container.children().remove();
    Cocktail.container.append($(data));
    Cocktail.container.masonry('reloadItems');

    // debugger
    // Cocktail.container.children().hide().fadeIn();
  
  },

  getCocktails: function() {
    $.get("/cocktails")
    .done(function(response){

      Cocktail.container.append($(response));
      Cocktail.container.children().hide().fadeIn();
      Grid.init();
      Cocktail.container.imagesLoaded(function(){
        console.log('imagesLoaded');
      });

      // var interval = 0;
      //  $(response).each(function(){
      //     var cocktail = this;
      //     setTimeout(function() {
      //       $('#cocktail_grid').append(cocktail);
      //     }, interval = interval + 100);
      //   });

      //  setTimeout(function(){
      //    Grid.init();
      //  }, 5000);
       
    });
  },

  searchFormCenter: function() {
    var top, left;

    top = Math.max($(window).height() - $('#modal').outerHeight(), 0) / 2;
    left = Math.max($(window).width() - $('#modal').outerWidth(), 0) / 2;

    $('#modal').css({
      top:top + $(window).scrollTop(), 
      left:left + $(window).scrollLeft()
    });
  },

  openSearchForm: function() {
    Cocktail.searchFormCenter();
    $('.search_form_wrapper').fadeIn();
    $(window).on('resize.modal', Cocktail.searchFormCenter);
    $('#close').on('click', Cocktail.closeSearchForm);
  },

  closeSearchForm: function() {
    $('.search_form_wrapper').fadeOut();
    $(window).unbind('resize.modal');
  },

  deleteCocktail: function(event, data) {
    $(this).closest('.cocktail').fadeOut(function(){
      $(this).remove();
    });
  }
}

var Grid = {
  init: function(){
    console.log("Initializing Masonry");
    
    Cocktail.container.masonry({
      columnWidth: 1,
      itemSelector: '.cocktail'
    });
  },

  destroy: function() {
    console.log("Destroying Masonry");
    Cocktail.container.masonry('destroy');
  }
}

$(document).ready(function(){
  Cocktail.init();
});
