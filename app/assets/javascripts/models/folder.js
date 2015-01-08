'use strict';

var app = app || {};

app.Folder = Backbone.Model.extend({
  title: function() { 
    var pattern = /\/([^\/]+)\/?$/g;
    var match = pattern.exec(this.get('path'));
    return match[1];
  }
});

