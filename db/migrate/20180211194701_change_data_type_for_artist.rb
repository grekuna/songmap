class ChangeDataTypeForArtist < ActiveRecord::Migration[5.1]
  def change
    change_column :songs, :artist, :string
  end
end
