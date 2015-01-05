var app = app || {};

app.FileView = Backbone.View.extend({
  el: $('#files'),

  tagName: 'div',
  className: 'fileContainer',
  template: $('#fileTemplate').html(),

  events: {
    'click .openFile': 'openFile'
  },

  openFile: function() {
  },

  render: function() {
    var tmpl = _.template(this.template);
    this.$el.append(tmpl(this.model.toJSON()));
    return this;
  }

});

