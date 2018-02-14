class AddSpotiftoSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :spotifyurl, :string
  end
end
