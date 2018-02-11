class AddAdressToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :street, :string
    add_column :songs, :city, :string
    add_column :songs, :zip, :string
    add_column :songs, :state, :string
    add_column :songs, :country, :string
  end
end
