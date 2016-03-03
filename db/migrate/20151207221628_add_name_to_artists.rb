class AddNameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :name, :string
    add_index :artists, :name, unique: true
  end
end
