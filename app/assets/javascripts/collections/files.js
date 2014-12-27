(function (){
  'use strict';
                                       
  var FileCollection = Backbone.Collection.extend({
    model: File,
    url: '/api/files'
  });    

});

