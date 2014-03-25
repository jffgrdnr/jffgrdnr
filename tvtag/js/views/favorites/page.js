define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/favorites/page.html'
], function($, _, Backbone, favoritesPageTemplate){
  var FavoritesPage = Backbone.View.extend({
    el: '.page',
    render: function () {
      $.getJSON( "../../../favorites.json", function( data ) {
        console.log(data);
        var items = [];
        $.each( data, function( key, val ) {
            if (key == 'title'){
              items.push( "<li class='" + key + "'>" + val + "</li>" );
            }
            if (key == 'screenshotUrl'){
              items.push( "<li class='" + key + "'><span class='flag'>Favorite<span class='triangle'></span></span><img src='" + val + "' /></li>" );
            }
            if (key == '_id'){
              items.push( "<button class='favorite' onclick='removeFavorite(" + key + "," + val + ")';>Remove Favorite</button>" );
            }
        });
       
        $( "<ul/>", {
          "class": "programs",
          html: items.join( "" )
        }).appendTo( ".favorites_list" );
      });
      this.$el.html(favoritesPageTemplate);
    }
  });
  return FavoritesPage;
});
