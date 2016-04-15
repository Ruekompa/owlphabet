class RemoveLastNameFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :last_name, :string
  end
end
