class AddInfoArtistToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :info_artist, :string
  end
end
