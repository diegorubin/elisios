var app = app || {};

app.FileView = Backbone.View.extend({
  el: $('#entries'),

  tagName: 'div',
  className: 'fileContainer',
  template: $('#fileTemplate').html(),

  events: {
    'click .delete': 'deleteFile'
  },

  deleteFile: function() {
    this.model.destroy();
    this.remove();
  },

  render: function() {
    var tmpl = _.template(this.template);
    this.$el.html(tmpl( this.model.toJSON()));
    return this;
  }

});

