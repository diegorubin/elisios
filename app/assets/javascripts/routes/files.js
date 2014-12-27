'use strict';

var app = app || {};

app.FileRouter = Backbone.Router.extend({
  routes:{
    "api/files/:folder/:path": "getFiles"
  }
});

