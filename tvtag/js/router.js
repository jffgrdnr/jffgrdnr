// Filename: router.js
define([
  'jquery',
  'underscore',
  'backbone',
  'vm',
  'views/moments/page'
], function ($, _, Backbone, Vm) {
  var AppRouter = Backbone.Router.extend({
    routes: {
      // Pages
      'favorites': 'favorites',
      'moments': 'moments',
      
      // Default - catch all
      '*actions': 'defaultAction'
    }
  });
 
  var initialize = function(options){
    
    var appView = options.appView;
    var router = new AppRouter(options);

    $.getJSON( "../../../shows.json", function( data ) {
      //Get URL and split it on 'program='
      var a = document.URL
      var res = a.split("program=");
      var show = res[1];
      program = data[show]
      switch (show) {
        case "Supernatural" :
          var program = data.Supernatural
          break;
        case "Castle" :
          var program = data.Castle
          break;
        case "The_Office" :
          var program = data.The_Office
          break;
      }
      require(['views/moments/page'], function (MomentsPage) {
        var momentsPage = Vm.create(appView, 'MomentsPage', MomentsPage);
        momentsPage.render(program);
      });
    });

    
    router.on('route:defaultAction', function (section) {
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
    router.on('route:favorites', function () {
     require(['views/favorites/page'], function (FavoritePage) {
        var favoritePage = Vm.create(appView, 'FavoritePage', FavoritePage);
        favoritePage.render();
      });
    });
    Backbone.history.start();
  };
  return {
    initialize: initialize
  };
});
