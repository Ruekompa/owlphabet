class AddSlugToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :slug, :string
  end
end
