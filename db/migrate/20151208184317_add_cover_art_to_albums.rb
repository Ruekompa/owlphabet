class AddCoverArtToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :cover_art, :string
  end
end
