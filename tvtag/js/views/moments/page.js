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

    render: function (program) {
      console.log(program);
      $.getJSON( "http://test.i.tv:4989/v2/tvtag/programs/'" + program + "'/moments",  function( data ) {
        //var set = data.moments.sequence[0];
        console.log(data);
        $.each(data.moments, function(index0, v) {
          var items = [];
          $.each(v, function (key, val) {
            items.push( "<li id='" + key + "'>" + val + "</li>" );
          });
          $( "<ul/>", {
            "class": "programs",
            html: items.join( "" )
          }).appendTo( ".moments" );
          console.log(items);
        });

      });
      
      $(this.el).html(momentsPageTemplate);
    }

  });
  return MomentsPage;
});
