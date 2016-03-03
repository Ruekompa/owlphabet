class RemoveTrackFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :track, :string
  end
end
