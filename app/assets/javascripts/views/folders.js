var app = app || {};

app.FolderView = Backbone.View.extend({
  tagName: 'div',
  className: 'folderContainer',
  template: $( '#folderTemplate' ).html(),

  events: {
    'click .delete': 'deleteFolder'
  },

  deleteFolder: function() {
    this.model.destroy();
    this.remove();
  },

  render: function() {
    var tmpl = _.template( this.template );
    this.$el.html(tmpl( this.model.toJSON()));
    return this;
  }

});

