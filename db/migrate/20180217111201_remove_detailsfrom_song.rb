class RemoveDetailsfromSong < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :album
    remove_column :songs, :zip
    remove_column :songs, :state
  end
end
