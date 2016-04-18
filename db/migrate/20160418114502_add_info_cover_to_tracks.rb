class AddInfoCoverToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :info_cover, :string
  end
end
