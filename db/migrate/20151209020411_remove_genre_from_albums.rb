class RemoveGenreFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :genre, :string
  end
end
