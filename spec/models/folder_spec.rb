require 'spec_helper'

describe Folder do

  context 'on validate' do

    let(:folder) {FactoryGirl.build(:folder)}

    it('path blank') {folder.path = ''}

    after(:each) do
      expect(folder).to be_invalid
    end
    
  end

end
