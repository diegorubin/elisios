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

    describe('get errors', function(){
      it('get message of path', function() {
        this.folder.set('path', '');
        expect(this.folder.isValid()).toBe(false);
        expect(this.folder.validationError)
          .toEqual('activerecord.errors.folder.attributes.path.blank');
      });
    });

  });

});
