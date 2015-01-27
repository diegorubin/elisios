var app = app || {};

app.FolderView = Backbone.View.extend({

  tagName: 'div',
  className: 'folderContainer',
  template: $('#folderTemplate').html(),

  events: {
    'click .delete': 'deleteFolder',
    'click .openFolder': 'openFolder'
  },

  deleteFolder: function() {
    this.model.destroy();
    this.remove();
  },

  openFolder: function() {
    var self = this;

    var folderId = this.model.get('folderId');
    var path;

    if (folderId) {
      path = this.model.get('path');
    }

    this.files =
      new app.FileCollection([], folderId || this.model.id, path);
    this.files.fetch({
        success: function(collections) {
          self.renderFiles();
        }
    });
  },

  renderFiles: function() {
    $('#files').html('');
    for(var i = 0; i < this.files.models.length; i++) {
      var file = this.files.models[i];

      if(file.get('directory')) {
        var fileTitle = file.get('title');
        if (fileTitle.slice(-fileTitle.length) != '.') {
          this.renderFolder(file);
        }
      } else {
        this.renderFile(file);
      }
    }
  },

  render: function() {
    var tmpl = _.template(this.template);
    this.$el.append(tmpl(this.model.toJSON()));
    return this;
  },

  renderFile: function(file) {
    var fileView = new app.FileView({model: file});
    $('#files').append(fileView.render().el);
  },

  renderFolder: function(folder) {
    var folderView = new app.FolderView({model: folder});
    $('#files').append(folderView.render().el);
  }

});
