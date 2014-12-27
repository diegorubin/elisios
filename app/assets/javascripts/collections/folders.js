'use strict';

var app = app || {};

app.FolderCollection = Backbone.Collection.extend({
  model: app.Folder,
  url: '/api/folders'
});

