// Filename: router.js
define([
  'jquery',
  'underscore',
  'backbone',
  'vm'
], function ($, _, Backbone, Vm) {
  var AppRouter = Backbone.Router.extend({
    routes: {
      // Pages
      'moments': 'moments',
      'favorites': 'favorites',
      
      // Default - catch all
      '*actions': 'defaultAction'
    }
  });

  var initialize = function(options){
    var appView = options.appView;
    var router = new AppRouter(options);

    var program = 'se-4440ee8506a31b5f6bf71d4e22a2fd95';
    router.on('route:moments', function () {
      require(['views/moments/page'], function (MomentsPage) {
        var momentsPage = Vm.create(appView, 'MomentsPage', MomentsPage);
        momentsPage.render(program);
      });
    });
    router.on('route:defaultAction', function (actions) {
      require(['views/home/page'], function (HomePage) {
        var homePage = Vm.create(appView, 'HomePage', HomePage);
        homePage.render();
      });
    });
    router.on('route:moments', function () {
     require(['views/moments/page'], function (MomentsPage) {
        var momentsPage = Vm.create(appView, 'MomentsPage', MomentsPage);
        momentsPage.render();
      });
    });
    router.on('route:favorites', function (section) {
      require(['views/favorites/page'], function (FavoritesPage) {
        var favoritesPage = Vm.create(appView, 'FavoritesPage', FavoritesPage);
        favoritesPage.render();
      });
    });
    Backbone.history.start();
  };
  return {
    initialize: initialize
  };
});
