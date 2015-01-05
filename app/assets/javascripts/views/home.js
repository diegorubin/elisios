var app = app || {};

app.HomeView = Backbone.View.extend({
  el: $('#entries'),

  initialize: function() {
    this.collection = new app.FolderCollection();
    this.collection.fetch();
    this.render();

    this.listenTo(this.collection, 'add', this.renderFolder);
    this.listenTo(this.collection, 'reset', this.render);
  },

  events: {
    'click #add': 'addFolder'
  },

  addFolder: function(e) {
    e.preventDefault();

    var formData = {};
    $( '#addFolder div' ).children( 'input' ).each(function(i, el) {
      if( $(el).val() != "" ) {
        formData[ el.id ] = $( el ).val();
      }
    });

    this.collection.create( formData );
  },

  render: function() {
    this.collection.each(function(item) {
      this.renderFolder(item);
    }, this);
  },

  renderFolder: function(item) {
    var folderView = new app.FolderView({
        model: item
    });
    this.$el.append( folderView.render().el );
  }
});

