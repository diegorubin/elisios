class Api::FoldersController < ApiController

  before_filter :get_folder, only: [:show, :edit]

  def index
    folders = Folder.order('title desc')
    render json: folders
  end

  def create
    folder = Folder.create(folder_params)
    render json: {folder: folder}
  end

  def edit
    @folder.update(folder_params)
    render json: {folder: @folder}
  end

  def show

  end

  private
  def folder_params
    params.require(:folder).permit(:title, :path)
  end

  def get_folder
    @folder = Folder.find(params[:id])
  end

end

