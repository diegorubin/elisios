'use strict';

var app = app || {};
                                       
app.FileCollection = Backbone.Collection.extend({
  model: app.File,

  initialize: function(models, folderId, path) {
    this.models = models;
    this.folderId = folderId;
    this.path = path || '';
  },

  url: function() {
    if(this.path.indexOf('/') === 0) {
      this.path = this.path.substr(1);
    }
    return '/api/files/' + this.folderId + '/' + this.path;
  }

});    

