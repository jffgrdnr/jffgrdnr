define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/favorites/page.html'
], function($, _, Backbone, favoritesPageTemplate){
  var FavoritesPage = Backbone.View.extend({
    el: '.page',
    render: function () {
      this.$el.html(favoritesPageTemplate);
    }
  });
  return FavoritesPage;
});
