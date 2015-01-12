'use strict';

describe('building url', function(){
  it('remove "/" from path', function(){
    var collection = new app.FileCollection([], '20', '/user');
    expect(collection.url()).toEqual('/api/files/20/user');
  });

  it('not remove "/" from path', function(){
    var collection = new app.FileCollection([], '20', 'user');
    expect(collection.url()).toEqual('/api/files/20/user');
  });
});

