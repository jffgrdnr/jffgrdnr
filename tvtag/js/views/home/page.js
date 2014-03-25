define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/home/page.html'
], function($, _, Backbone, homePageTemplate){
  var HomePage = Backbone.View.extend({
    el: '.page',

    initialize: function() {

    },

    render: function () {
      $.getJSON( "../../../shows.json", function( data ) {
        var items = [];
        $.each( data, function( key, val ) {
          items.push( "<li id='" + key + "' style='background:url(../../../img/" + key +
           ".jpg)no-repeat;'><span class='title'>" + key +
            "</span><a href='#/moments?:program=" + key +
             "' highlightMenuItem(ev);></a></li>" );
        });
       
        $( "<ul/>", {
          "class": "programs",
          html: items.join( "" )
        }).appendTo( ".program_list" );
      });

    $(this.el).html(homePageTemplate);

    }

  });

  return HomePage;
});


