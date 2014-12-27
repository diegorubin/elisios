class FoldersController < ApplicationController

  def index
    @folders = Folder.order('title ASC')
  end

  def show
    
  end

  def new
    @folder = Folder.new  
  end

  def edit
    @folder = Folder.find(params[:id])
  end

end

