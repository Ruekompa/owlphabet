class AddTrackMediaToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_media, :string
  end
end
