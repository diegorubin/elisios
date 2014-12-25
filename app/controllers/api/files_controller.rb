class Api::FilesController < ApiController

  def show
    content = {}
    content[:path] = params[:path]
    content[:files] = Dir.entries(path)
    render json: content
  end

end

