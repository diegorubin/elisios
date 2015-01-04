var app = app || {};

app.FolderView = Backbone.View.extend({
  el: $('#entries'),

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
    this.files = new app.FileCollection([], this.model.id, this.model.path);
    this.files.fetch({success: this.renderFiles()});
  },

  renderFiles: function() {
    console.log('renderFiles');
    console.log(this.files.models.length);
    for(var i = 0; i < this.files.models.length; i++) {
      console.log(i);
    }
  },

  render: function() {
    var tmpl = _.template(this.template);
    this.$el.html(tmpl(this.model.toJSON()));
    return this;
  },

  renderFile: function(file) {
    var fileView = new app.FileView({model: file});
    this.$el.append(fileView.render().el);
  }

});

