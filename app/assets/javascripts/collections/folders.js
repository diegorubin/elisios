(function (){
  'use strict';

  var FolderCollection = Backbone.Collection.extend({
    model: Folder,
    url: '/api/folders'
  });
});
