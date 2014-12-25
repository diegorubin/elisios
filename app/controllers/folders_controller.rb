class FoldersController < ApplicationController

  def index
    @folders = Folder.order('title ASC')
  end

end
