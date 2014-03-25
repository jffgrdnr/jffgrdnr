define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/moments/page.html'
], function($, _, Backbone, momentsPageTemplate){
  var MomentsPage = Backbone.View.extend({
    el: '.page',
    render: function (program) {
      $.getJSON( "http://test.i.tv:4989/v2/tvtag/programs/se-4440ee8506a31b5f6bf71d4e22a2fd95/moments",  function( data ) {
        $.each(data.moments, function(index0, v) {
          var items = [];
          $.each(v, function (key, val) {
            if (key == 'title'){
              items.push( "<li class='" + key + "'>" + val + "</li>" );
            }
            if (key == 'screenshotUrl'){
              items.push( "<li class='" + key + "'><img src='" + val + "' /></li>" );
            }
            if (key == '_id'){
              items.push( "<button class='favorite' onclick='saveFavorite(" + key + "," + val + ")';>Favorite</button>" );
            }
            
          });
          $( "<ul/>", {
            "class": "programs",
            html: items.join( "" )
          }).appendTo( ".moment_list" );
          console.log(items);
          $("ul.programs:not(:has(li))").hide();
        });

      });
      var saveFavorite = function(title,id){
        debugger;
        var favorites = [];
        favorites.push({title : '"' + title + '"', id:'"' + id + '"'});
        console.log(favorites);
        $.ajax
        ({
            type: "GET",
            dataType : 'json',
            async: false,
            url: '../../../favorites.json',
            data: { data: JSON.stringify(favorites) },
            success: function () {alert("Thanks!"); },
            failure: function() {alert("Error!");}
        });
      };
      
      this.$el.html(momentsPageTemplate);
    }
  });
  return MomentsPage;
});
