class AddInfoAlbumToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :info_album, :string
  end
end
