describe('folder attributes', function(){
  describe('on title', function(){

    beforeEach(function(){
      this.folder = new app.Folder({path: '/path/to/folder'});
    });

    it('get title from path', function(){
      expect(this.folder.title()).toEqual('folder');
    });

  });
});
