describe('file attributes', function(){
  describe('on absolutePath', function(){
    it('from folder 20 file file.txt', function(){
      var file = new app.File({folderId: 20, path: 'file.txt'});
      expect(file.absolutePath()).toEqual('/files/20/file.txt');
    });
  });
});
