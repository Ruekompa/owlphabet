class AddArtistIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :artist_id, :string
    add_index :profiles, :artist_id
  end
end
