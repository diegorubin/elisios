class Api::FilesController < ApiController

  # XXX: Esse projeto é apenas um teste, se um dia ele evoluir
  # a lógica dessa action deve ser colocada em um local adequado.
  def show
    folder = Folder.find(params[:folder])
    path = params.fetch(:path, '')

    content = {}
    content[:title] = folder.title
    content[:files] = []

    current_path = File.join(folder.path, path)
    Dir.entries(current_path).each do |file|
      current_file = File.join(current_path, file)
      file_data = {}
      file_data[:name] = file
      file_data[:absolute_path] = current_file
      file_data[:directory] = File.directory?(current_file)

      content[:files] << file_data
    end

    render json: content
  end

end

