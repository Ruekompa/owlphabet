class RemoveSongsFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :songs, :json
  end
end
