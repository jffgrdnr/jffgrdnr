define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/home/page.html'
], function($, _, Backbone, homePageTemplate){
  var HomePage = Backbone.View.extend({
    el: '.page',
    render: function () {
      $.getJSON( "../../../shows.json", function( data ) {
        var items = [];
        $.each( data, function( key, val ) {
          items.push( "<li id='" + key + "' style='background:url(../../../img/" + key +
           ".jpg)no-repeat;' data-program='"+ val +"'><span class='title'>" + key +
            "</span><a href='#/moments/?program=" + val + "'></a></li>" );
        });
       
        $( "<ul/>", {
          "class": "programs",
          html: items.join( "" )
        }).appendTo( ".program_list" );
      });
      this.$el.html(homePageTemplate);
    }
  });
  return HomePage;
});