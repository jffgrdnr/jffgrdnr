define([
  'jquery',
  'lodash',
  'backbone',
  'text!templates/moments/page.html'
], function($, _, Backbone, Vm, momentsPageTemplate){
  var MomentsPage = Backbone.View.extend({
    el: '.page',
    
    initialize: function(){
    },

    render: function () {

      $.getJSON( "http://test.i.tv:4989/v2/tvtag/programs/se-4d1a5f207f6dfb6e36b3bda23062b82c/moments",  function( data ) {
        var items = [];
        $.each( data, function( key, val ) {
          items.push( "<li id='" + key + "'>" + val + "</li>" );
        });
       
        $( "<ul/>", {
          "class": "programs",
          html: items.join( "" )
        }).appendTo( ".moments_list" );
        console.log(data);
      });

      this.$el.html(momentsPageTemplate);
    }

  });
  return MomentsPage;
});
