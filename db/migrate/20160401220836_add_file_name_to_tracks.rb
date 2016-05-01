class AddFileNameToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :file_name, :string
  end
end
