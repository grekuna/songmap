class AddCoordinatesToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :latitude, :float
    add_column :songs, :longitude, :float
  end
end
