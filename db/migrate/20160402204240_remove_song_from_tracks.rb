class RemoveSongFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :song, :string
  end
end
