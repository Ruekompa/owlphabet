class AddFirstNameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :first_name, :string
  end
end
