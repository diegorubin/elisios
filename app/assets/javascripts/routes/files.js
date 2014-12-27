(function() {
  var FileRouter = Backbone.Router.extend({
    routes:{
      "api/files/:folder/:path": "getFiles",
    };
  });
});
