class AddAlbumIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :album_id, :string
    add_index :tracks, :album_id
  end
end
