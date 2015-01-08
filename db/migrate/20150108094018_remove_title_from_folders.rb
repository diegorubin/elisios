class RemoveTitleFromFolders < ActiveRecord::Migration
  def change
    remove_column :folders, :title, :string
  end
end
