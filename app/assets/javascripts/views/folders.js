var app = app || {};

app.FolderView = Backbone.View.extend({
  el: $( '#folders' ),

  tagName: 'div',
  className: 'folderContainer',
  template: $( '#folderTemplate' ).html(),

  events: {
    'click .delete': 'deleteFolder',
    'click .openFolder': 'openFolder'
  },

  deleteFolder: function() {
    this.model.destroy();
    this.remove();
  },

  openFolder: function() {
    this.files = 
      new app.FileCollection([], this.model.folderId, this.model.path);
    this.files.fetch();

    this.collection.each(function(file) {this.renderFile(file)}, this);
  },

  render: function() {
    var tmpl = _.template( this.template );
    this.$el.html(tmpl( this.model.toJSON()));
    return this;
  },

  renderFile: function(file) {
    var fileView = new app.FileView({model: file});
    this.$el.append(fileView.render().el);
  }

});

