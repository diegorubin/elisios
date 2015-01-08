describe('folder attributes', function(){

  beforeEach(function(){
    this.folder = new app.Folder({path: '/path/to/folder'});
  });

  describe('on title', function(){

    it('get title from path', function(){
      expect(this.folder.title()).toEqual('folder');
    });

  });

  describe('on validate', function(){

    it('is valid', function(){
      expect(this.folder.isValid()).toBe(true);
    });

    describe('not valid', function(){
      it('require path', function(){
        this.folder.set('path', '');
      });

      afterEach(function() {
        expect(this.folder.isValid()).toBe(false);
      });
    });

  });

});
