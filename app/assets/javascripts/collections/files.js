'use strict';

var app = app || {};
                                       
app.FileCollection = Backbone.Collection.extend({
  model: File,

  initialize: function(models, folderId, path) {
    this.folderId = folderId;
    this.path = path || '';
  },

  url: function() {
    return '/api/files/' + this.folderId + '/' + this.path;
  }

});    

