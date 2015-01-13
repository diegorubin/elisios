class FilesController < ApplicationController

  def show
    folder = Folder.find(params[:folder])
    file = File.join(folder.path, params[:path])
    send_file file
  end
  
end
