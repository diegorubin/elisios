var app = app || {};

app.HomeView = Backbone.View.extend({
  el: $('#folders'),

  initialize: function() {
    this.collection = new app.FolderCollection();
    this.collection.fetch();
    this.render();

    this.listenTo(this.collection, 'add', this.renderFolder);
    this.listenTo(this.collection, 'reset', this.render);
  },

  events: {
    'click #add': 'addFolder',
    'click #btn_filter' : 'filterFolders'
  },

  filterFolders: function (e) {
    e.preventDefault();
    this.folderFilter = $('#filter').val();
    this.$el.find('.folderContainer').remove();
    this.render();
  },

  addFolder: function(e) {
    e.preventDefault();

    var formData = {};
    $('#addFolder div').find('input').each(function(i, el) {
      if($(el).val() != "") {
        formData[el.id] = $(el).val();
        $(el).val('');
      }
    });

    var folder = new app.Folder(formData);

    if(folder.isValid()) {
      this.collection.create(folder);
    } else {
      $("#path_error").html(polyglot.t(folder.validationError));
    }
  },

  render: function() {
    this.collection.each(function(item) {
      this.renderFolder(item);
    }, this);
    return this;
  },

  renderFolder: function(item) {
    if( item.get('path').match(new RegExp(this.folderFilter))) {
      var folderView = new app.FolderView({model: item});
      this.$el.append( folderView.render().el );
    }
  }
});
