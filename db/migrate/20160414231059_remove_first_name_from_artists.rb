class RemoveFirstNameFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :first_name, :string
  end
end
