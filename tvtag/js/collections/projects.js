define([
  'jquery',
  'lodash',
  'backbone',
  'models/projects',
  'views/home/page'
], function($, _, Backbone, projectsModel){
  var projectsCollection = Backbone.Collection.extend({
    model: projectsModel,

   
    initialize: function () {

    },

    render: function () {

    }
    
  });

  return projectsCollection;
});
