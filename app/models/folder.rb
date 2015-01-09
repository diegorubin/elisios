# Folder Model
class Folder < ActiveRecord::Base
  validates :path, presence: true
end
