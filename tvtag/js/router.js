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

  initialize: 

  function parseURL(url) {
    var a =  document.createElement('a');
    a.href = url;
    return {
        source: url,
        protocol: a.protocol.replace(':',''),
        host: a.hostname,
        port: a.port,
        query: a.search,
        params: (function(){
            var ret = {},
                seg = a.search.replace(/^\?/,'').split('&'),
                len = seg.length, i = 0, s;
            for (;i<len;i++) {
                if (!seg[i]) { continue; }
                s = seg[i].split('=');
                ret[s[0]] = s[1];
            }
            return ret;
        })(),
        file: (a.pathname.match(/\/([^\/?#]+)$/i) || [,''])[1],
        hash: a.hash.replace('#',''),
        path: a.pathname.replace(/^([^\/])/,'/$1'),
        relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [,''])[1],
        segments: a.pathname.replace(/^\//,'').split('/')
    };
  } 
 
  var initialize = function(options){
    

    var appView = options.appView;
    var router = new AppRouter(options);
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
