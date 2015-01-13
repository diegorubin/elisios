require 'spec_helper'

describe Api::FilesController, type: :controller do

  let(:folder_saved) {FactoryGirl.create(:folder)}

  context 'on show' do

    it 'get folder content' do
      get :show, folder: folder_saved.id, format: :json
      expect(response.status).to eq 200
      expect(response).to match_response_list("file")
    end

  end
end
