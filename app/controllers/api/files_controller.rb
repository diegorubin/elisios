class Api::FilesController < ApiController

  # XXX: Esse projeto é apenas um teste, se um dia ele evoluir
  # a lógica dessa action deve ser colocada em um local adequado.
  def show
    folder = Folder.find(params[:folder])
    path = params.fetch(:path, '')

    current_path = File.join(folder.path, path)
    files = Dir.entries(current_path).collect do |file|
      current_file = File.join(current_path, file)
      file_data = {}
      file_data[:title] = file
      file_data[:directory] = File.directory?(current_file)
      file_data[:path] = File.join(path, file)
      file_data[:folderId] = folder.id

      file_data
    end

    render json: files
  end

end
