class AddSongsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :songs, :json
  end
end
