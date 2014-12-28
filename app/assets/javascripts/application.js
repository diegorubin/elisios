//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require backbone

//= require_tree ./models
//= require_tree ./routes
//= require_tree ./collections
//= require_tree ./views

var app = app || {};

$(function() {
  new app.HomeView();
});

