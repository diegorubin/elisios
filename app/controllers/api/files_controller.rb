class Api::FilesController < ApiController

  def show
    folder = Folder.find(params[:folder])
    path = params.fetch(:path, '')

    content = {}
    content[:title] = folder.title
    content[:files] = Dir.entries(File.join(folder.path, path))

    render json: content
  end

end

