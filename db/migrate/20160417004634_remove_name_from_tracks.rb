class RemoveNameFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :name, :string
  end
end
