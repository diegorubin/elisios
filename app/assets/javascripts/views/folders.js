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

    console.log(this.model);
    this.files = new app.FileCollection([], this.model.folderId || this.model.id, this.model.path);
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
        this.renderFolder(file);
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
    fileView.render();
  },

  renderFolder: function(folder) {
    var folderView = new app.FolderView({model: folder, el: '#files'});
    folderView.render();
  }

});

