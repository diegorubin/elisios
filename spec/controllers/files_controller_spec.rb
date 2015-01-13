require 'spec_helper'

describe FilesController, type: :controller do

  context 'on show' do

    let(:folder) {FactoryGirl.create(:folder)}

    it 'get example file' do
      gemfile_file = File.open(File.join(Rails.root.to_s, 'Gemfile'))

      get :show, folder: folder.id, path: 'Gemfile'
      expect(response.body).to eql(gemfile_file.read)
    end

    it 'get example file with extension' do
      gemfile_file = File.open(File.join(Rails.root.to_s, 'Gemfile.lock'))

      get :show, folder: folder.id, path: 'Gemfile.lock'
      expect(response.body).to eql(gemfile_file.read)
    end

  end

end

