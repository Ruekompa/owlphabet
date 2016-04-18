class AddInfoYearToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :info_year, :integer
  end
end
