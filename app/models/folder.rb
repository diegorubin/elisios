# Folder Model
class Folder < ActiveRecord::Base
  def title
    File.basename path
  end

  def as_json(options = {})
    super((options || {}).merge(methods: [:title]))
  end
end
