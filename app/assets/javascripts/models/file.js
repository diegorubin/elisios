'use strict';

var app = app || {};

app.File = Backbone.Model.extend({
  initialize: function() {
  },

  absolutePath: function() {
    return '/files/' + this.get('folderId') + '/' + this.get('path');
  },

  toJSON: function(options) {
    var newAttributes = _.clone(this.attributes);
    newAttributes['absolutePath'] = this.absolutePath();
    return newAttributes;
  }

});

