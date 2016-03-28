class RemoveTrackMediaToTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :track_media, :string
  end
end
